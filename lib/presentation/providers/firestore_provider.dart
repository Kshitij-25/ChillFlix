import 'package:chillflix2/presentation/providers/auth_providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/movies_details.dart';

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

final firestoreServiceProvider = Provider((ref) => FirestoreService());

final watchlistProvider = StreamProvider<List<MoviesDetails>>((ref) {
  final firestore = ref.watch(firestoreProvider);
  final auth = ref.watch(authChangeProvider);

  if (auth.user != null) {
    final userId = auth.user!.uid;
    return firestore
        .collection('users')
        .doc(userId)
        .collection('watchlist')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => MoviesDetails.fromJson(doc.data())).toList());
  } else {
    return Stream.value([]); // Return an empty list if user is not logged in
  }
});

final myListProvider = StreamProvider<List<MoviesDetails>>((ref) {
  final firestore = ref.watch(firestoreProvider);
  final auth = ref.watch(authChangeProvider);

  if (auth.user != null) {
    final userId = auth.user!.uid;
    return firestore
        .collection('users')
        .doc(userId)
        .collection('my_list')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => MoviesDetails.fromJson(doc.data())).toList());
  } else {
    return Stream.value([]); // Return an empty list if user is not logged in
  }
});

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addMovieToCollection(String userId, String collectionName, MoviesDetails moviesDetails) async {
    try {
      final collectionRef = _firestore.collection('users').doc(userId).collection(collectionName);
      final querySnapshot = await collectionRef.get();

      if (querySnapshot.docs.isEmpty) {
        // Collection is empty, add the movie directly
        await collectionRef.doc(moviesDetails.id.toString()).set(moviesDetails.toJson());
      } else {
        // Collection is not empty, check if it contains a dummy document
        final dummyDocSnapshot = querySnapshot.docs.firstWhere((doc) => doc.id == 'dummy');
        if (dummyDocSnapshot != null) {
          // Delete the dummy document
          await dummyDocSnapshot.reference.delete();
          await collectionRef.doc(moviesDetails.id.toString()).set(moviesDetails.toJson());
        } else {
          // Collection contains data but no dummy document, add the moviesDetails directly
          await collectionRef.doc(moviesDetails.id.toString()).set(moviesDetails.toJson());
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> removeMovieFromCollection(String userId, String collectionName, String movieId) async {
    try {
      // Remove the movie from the collection
      await _firestore.collection('users').doc(userId).collection(collectionName).doc(movieId).delete();

      // Update the addedToMyList and addedToWatchlist fields to false
      final movieDocRef = _firestore.collection('users').doc(userId).collection(collectionName).doc(movieId);
      final movieDocSnapshot = await movieDocRef.get();
      if (movieDocSnapshot.exists) {
        final movieData = movieDocSnapshot.data();
        if (movieData != null) {
          final updatedMovie = MoviesDetails.fromJson(movieData).copyWith(
            addedToMyList: false,
            addedToWatchlist: false,
          );
          await movieDocRef.set(updatedMovie.toJson());
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
