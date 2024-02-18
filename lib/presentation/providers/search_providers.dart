import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/usecases/movies_usecase.dart';
import '../../data/models/movies.dart';
import 'common_providers.dart';

final searchUseCaseProvider = FutureProvider<MoviesUseCase>((ref) {
  final moviesRepository = ref.read(moviesDeatilsRepositoryProvider);
  return MoviesUseCaseImpl(moviesRepository);
});

final multiSearchProvider = FutureProvider.family<List<Movies>?, String>((ref, query) async {
  final multiSearchUseCase = await ref.read(searchUseCaseProvider.future);
  return multiSearchUseCase.multiSearch(query);
});
