import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/movie_model.dart';
import 'movie_provider.dart';

part 'trending_movies_provider.g.dart';

@riverpod
Future<List<MovieModel>> trendingMovie(TrendingMovieRef ref) async {
  final moviesRepository = ref.read(movieRepositoryProvider);
  final eitherTrendingMovieOrError = await moviesRepository.getAllTrending();
  return eitherTrendingMovieOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (trendingMovie) => trendingMovie!,
  );
}
