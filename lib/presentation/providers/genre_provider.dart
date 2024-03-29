import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/core/api_client.dart';
import '../../data/data_sources/genre_remote_data_source.dart';
import '../../data/di/get_it.dart';
import '../../data/models/genre_list.dart';
import '../../data/repositories/genre_repository.dart';

part 'genre_provider.g.dart';

// Define a provider to store the selected genre index
final activeGenreIndexProvider = StateProvider<int?>((ref) => 0);

@riverpod
GenreRemoteDataSource genreRemoteDataSource(GenreRemoteDataSourceRef ref) {
  // Retrieve the required dependencies from GetIt
  final apiClient = getItInstance<ApiClient>();
  final logger = getItInstance<Logger>();

  return GenreRemoteDataSourceImpl(apiClient, logger);
}

@riverpod
Future<GenreRepository> genreRepository(GenreRepositoryRef ref) async {
  final genreRemoteDataSource = ref.watch(genreRemoteDataSourceProvider);
  return GenreRepository(genreRemoteDataSource);
}

@riverpod
Future<List<GenreList>> genreList(GenreListRef ref) async {
  final genreRepository = await ref.read(genreRepositoryProvider.future);
  final eitherGenresOrError = await genreRepository.getCombinedGenres();
  return eitherGenresOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (genres) => genres!, // Return the genres if no error occurred
  );
}
