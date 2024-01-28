import 'package:chillflix2/core/usecases/upcoming_movies_usecase.dart';
import 'package:chillflix2/presentation/providers/common_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/movies.dart';

final upcomingUseCaseProvider = FutureProvider<UpcomingMoviesUseCase>((ref) {
  final upcomingRepository = ref.read(moviesDeatilsRepositoryProvider);
  return UpcomingMoviesUseCaseImpl(upcomingRepository);
});

final upcomingMovies = FutureProvider<List<Movies>?>((ref) async {
  final upcomingMoviesUseCase = await ref.read(upcomingUseCaseProvider.future);
  return upcomingMoviesUseCase.getUpcomingMovies(1);
});
