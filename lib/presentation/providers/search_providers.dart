import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/usecases/serach_usecase.dart';
import '../../data/models/movies.dart';
import '../../data/repository/search_repo.dart';
import '../../data/sources/search_data_source.dart';

final searchDataSourceProvider = Provider<SearchDataSource>((ref) {
  return SearchDataSource();
});

final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  final searchDataSource = ref.read(searchDataSourceProvider);
  return SearchRepository(searchDataSource);
});

final searchUseCaseProvider = FutureProvider<SearchUseCase>((ref) {
  final searchRepository = ref.read(searchRepositoryProvider);
  return SearchUseCaseImpl(searchRepository);
});

final multiSearchProvider = FutureProvider.family<List<Movies>?, String>((ref, query) async {
  final multiSearchUseCase = await ref.read(searchUseCaseProvider.future);
  return multiSearchUseCase.multiSearch(query);
});
