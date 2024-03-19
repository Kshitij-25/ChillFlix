// MovieStateNotifier class for managing local state
import 'package:chillflix2/data/models/movies_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// MovieStateProvider for providing local state
final movieStateProvider = ChangeNotifierProvider((ref) => MovieStateNotifier());

class MovieStateNotifier extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<MoviesDetails> _myList = [];
  List<MoviesDetails> _watchlist = [];

  List<MoviesDetails> get myList => _myList;
  List<MoviesDetails> get watchlist => _watchlist;

  void addToMyList(MoviesDetails moviesDetails, String collectionName) {
    _myList.add(moviesDetails);
    notifyListeners();
    _updateFirestoreMovieStatus(moviesDetails.id.toString(), true, false, collectionName);
  }

  void removeFromMyList(String movieId, String collectionName) {
    _myList.removeWhere((moviesDetails) => moviesDetails.id.toString() == movieId);
    notifyListeners();
    _updateFirestoreMovieStatus(movieId, false, false, collectionName);
  }

  void addToWatchlist(MoviesDetails moviesDetails, String collectionName) {
    _watchlist.add(moviesDetails);
    notifyListeners();
    _updateFirestoreMovieStatus(moviesDetails.id.toString(), false, true, collectionName);
  }

  void removeFromWatchlist(String movieId, String collectionName) {
    _watchlist.removeWhere((moviesDetails) => moviesDetails.id.toString() == movieId);
    notifyListeners();
    _updateFirestoreMovieStatus(movieId, false, false, collectionName);
  }

  Future<void> _updateFirestoreMovieStatus(String movieId, bool addedToMyList, bool addedToWatchlist, String collectionName) async {
    final userUid = FirebaseAuth.instance.currentUser!.uid;
    final docRef = firestore.collection('users').doc(userUid).collection(collectionName).doc(movieId);

    //  / Update 'addedToMyList' in 'my_list' collection
    await docRef.set({
      'addedToMyList': addedToMyList,
    }, SetOptions(merge: true));

    // Update 'addedToWatchlist' in 'watchlist' collection
    await docRef.set({
      'addedToWatchlist': addedToWatchlist,
    }, SetOptions(merge: true));
  }
}
