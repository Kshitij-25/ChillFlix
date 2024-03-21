import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/movie_details.dart';

class CreateMovieCollection {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createInitialMoviesCollection(String userId, String collectionName) async {
    final batch = _firestore.batch();
    final dummyMovieData = MovieDetails(
      backdrop_path: '',
      id: 0,
      title: '',
      original_title: '',
      overview: '',
      poster_path: '',
      adult: false,
      budget: 0,
      genres: [],
      homepage: '',
      imdb_id: '',
      original_language: '',
      popularity: 0,
      release_date: '',
      revenue: 0,
      runtime: 0,
      status: '',
      tagline: '',
      video: false,
      vote_average: 0,
      vote_count: 0,
      addedToMyList: false,
      addedToWatchlist: false,
    );
    final dummyMovieDataMap = dummyMovieData.toJson();

    final querySnapshot = await _firestore.collection('users').doc(userId).collection(collectionName).get();
    if (querySnapshot.docs.isEmpty) {
      // If collection is empty, add a dummy movie document
      batch.set(_firestore.collection('users').doc(userId).collection(collectionName).doc('dummy'), dummyMovieDataMap);
      await batch.commit();
    }
  }
}
