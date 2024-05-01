import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/movie_details.dart';

class CreateMovieCollection {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createInitialMoviesCollection(String userId, String collectionName) async {
    final batch = _firestore.batch();
    final dummyMovieData = MovieDetails(
      backdropPath: '',
      id: 0,
      title: '',
      originalTitle: '',
      overview: '',
      posterPath: '',
      isAdult: false,
      budget: 0,
      genres: [],
      homepage: '',
      imdbId: '',
      originalLanguage: '',
      popularity: 0,
      releaseDate: '',
      revenue: 0,
      runtime: 0,
      status: '',
      tagline: '',
      video: false,
      voteAverage: 0,
      voteCount: 0,
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
