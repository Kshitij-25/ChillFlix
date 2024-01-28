import 'package:chillflix2/core/usecases/movies_details_usecase.dart';
import 'package:chillflix2/data/models/movies_details.dart';
import 'package:chillflix2/presentation/providers/common_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesDetailsUseCaseProvider = FutureProvider<MoviesDetailsUseCase>((ref) {
  final moviesDetailsRepository = ref.read(moviesDeatilsRepositoryProvider);
  return MoviesDetailsUseCaseImpl(moviesDetailsRepository);
});

final moviesDetails = FutureProvider.family<MoviesDetails?, int>((ref, movieId) async {
  final moviesDetailsUseCase = await ref.read(moviesDetailsUseCaseProvider.future);
  return moviesDetailsUseCase.getMoviesDetails(movieId);
});
