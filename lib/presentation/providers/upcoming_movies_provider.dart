import 'package:chillflix2/presentation/providers/common_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/usecases/movies_usecase.dart';
import '../../data/models/movies.dart';

final upcomingUseCaseProvider = FutureProvider<MoviesUseCase>((ref) {
  final upcomingRepository = ref.read(moviesDeatilsRepositoryProvider);
  return MoviesUseCaseImpl(upcomingRepository);
});

final upcomingMovies = FutureProvider<List<Movies>?>((ref) async {
  final upcomingMoviesUseCase = await ref.read(upcomingUseCaseProvider.future);
  return upcomingMoviesUseCase.getUpcomingMovies(1);
});
