import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/movie_details.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addMovieToCollection(String userId, String collectionName, MovieDetails moviesDetails) async {
    try {
      final collectionRef = _firestore.collection('users').doc(userId).collection(collectionName);
      final querySnapshot = await collectionRef.get();

      if (querySnapshot.docs.isEmpty) {
        // Collection is empty, add the movie directly
        await collectionRef.doc(moviesDetails.id.toString()).set(moviesDetails.toJson());
      } else {
        // Collection is not empty, check if it contains a dummy document
        final dummyDocSnapshot = querySnapshot.docs.firstWhere((doc) => doc.id == 'dummy');
        // Delete the dummy document
        await dummyDocSnapshot.reference.delete();
        await collectionRef.doc(moviesDetails.id.toString()).set(moviesDetails.toJson());
      }
    } catch (e) {
      debugPrint(e.toString());
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
          final updatedMovie = MovieDetails.fromJson(movieData).copyWith(
            addedToMyList: false,
            addedToWatchlist: false,
          );
          await movieDocRef.set(updatedMovie.toJson());
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
