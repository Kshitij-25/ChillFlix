// MovieStateNotifier class for managing local state

// MovieStateProvider for providing local state
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/movie_details.dart';

final movieStateProvider = ChangeNotifierProvider((ref) => MovieStateNotifier());

class MovieStateNotifier extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final List<MovieDetails> _myList = [];
  final List<MovieDetails> _watchlist = [];

  List<MovieDetails> get myList => _myList;
  List<MovieDetails> get watchlist => _watchlist;

  void addToMyList(MovieDetails moviesDetails, String collectionName) {
    _myList.add(moviesDetails);
    notifyListeners();
    _updateFirestoreMovieStatus(moviesDetails.id.toString(), true, false, collectionName, moviesDetails: moviesDetails);
  }

  void removeFromMyList(String movieId, String collectionName) {
    _myList.removeWhere((moviesDetails) => moviesDetails.id.toString() == movieId);
    notifyListeners();
    _updateFirestoreMovieStatus(movieId, false, false, collectionName);
  }

  void addToWatchlist(MovieDetails moviesDetails, String collectionName) {
    _watchlist.add(moviesDetails);
    notifyListeners();
    _updateFirestoreMovieStatus(moviesDetails.id.toString(), false, true, collectionName, moviesDetails: moviesDetails);
  }

  void removeFromWatchlist(String movieId, String collectionName) {
    _watchlist.removeWhere((moviesDetails) => moviesDetails.id.toString() == movieId);
    notifyListeners();
    _updateFirestoreMovieStatus(movieId, false, false, collectionName);
  }

  Future<void> _updateFirestoreMovieStatus(String movieId, bool addedToMyList, bool addedToWatchlist, String collectionName,
      {MovieDetails? moviesDetails}) async {
    try {
      final userUid = FirebaseAuth.instance.currentUser!.uid;
      final docRef = firestore.collection('users').doc(userUid).collection(collectionName).doc(movieId);

      // Check if the document already exists
      final docSnapshot = await docRef.get();
      if (!docSnapshot.exists) {
        // Document does not exist, create a new one
        await docRef.set(moviesDetails!.toJson());
      }

      // Update the document with both 'addedToMyList' and 'addedToWatchlist' fields
      await docRef.set({
        'addedToMyList': addedToMyList,
        'addedToWatchlist': addedToWatchlist,
        // Add other movie details here if needed
      }, SetOptions(merge: true));
    } catch (e, stackTrace) {
      debugPrint('Error updating Firestore: $e');
      debugPrint('Stack Trace: $stackTrace');
      // Handle errors if necessary
      rethrow; // Re-throw the error to propagate it further if needed
    }
  }
}
