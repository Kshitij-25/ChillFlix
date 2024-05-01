import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/movie_details.dart';
import 'firestore_service_provider.dart';
import 'movie_provider.dart';

part 'movie_details_provider.g.dart';

// @riverpod
// Future<MovieDetails> moviesDetails(MoviesDetailsRef ref, {required int movieId}) async {
//   final moviesRepository = ref.read(movieRepositoryProvider);
//   final eitherMovieDetailsOrError = await moviesRepository.getMoviesDetails(movieId);
//   return eitherMovieDetailsOrError!.fold(
//     (error) {
//       throw error; // Throw the error for Riverpod to handle
//     },
//     (moviesDetails) => moviesDetails!,
//   );
// }
@riverpod
Future<MovieDetails> moviesDetails(MoviesDetailsRef ref, {required int movieId}) async {
  final moviesRepository = ref.read(movieRepositoryProvider);
  final firestoreService = ref.read(firestoreServiceProvider);

  final eitherMovieDetailsOrError = await moviesRepository.getMoviesDetails(movieId);
  final userUid = FirebaseAuth.instance.currentUser!.uid;

  // Fetch user's myList status
  final myListStatus = await firestoreService.checkMovieStatusInCollection(userUid, 'my_list', movieId.toString());
  // Fetch user's watchlist status
  final watchlistStatus = await firestoreService.checkMovieStatusInCollection(userUid, 'watchlist', movieId.toString());

  return eitherMovieDetailsOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (moviesDetails) {
      // Create a new instance of MovieDetails with updated status
      final updatedMovieDetails = moviesDetails!.copyWith(
        addedToMyList: myListStatus,
        addedToWatchlist: watchlistStatus,
      );
      return updatedMovieDetails;
    },
  );
}
