import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'create_movie_collection.dart';

class CreateUserCollection {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUserCollection() async {
    // After successful login, check if the user document exists
    final user = _auth.currentUser;

    if (user != null) {
      final userDocSnapshot = await _firestore.collection('users').doc(user.uid).get();
      if (!userDocSnapshot.exists) {
        // If user document doesn't exist, create it
        await _firestore.collection('users').doc(user.uid).set({
          'username': user.displayName ?? '',
          'email': user.email ?? '',
        });

        // Create subcollections for liked_movies and watchlist
        await CreateMovieCollection().createInitialMoviesCollection(user.uid, 'my_list');
        await CreateMovieCollection().createInitialMoviesCollection(user.uid, 'watchlist');
      }
    }
  }
}
