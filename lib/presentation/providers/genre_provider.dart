import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import '../../data/core/api_client.dart';
import '../../data/data_sources/genre_remote_data_source.dart';
import '../../data/di/get_it.dart';
import '../../data/models/genre_list.dart';
import '../../data/repositories/genre_repository.dart';

// Define a provider to store the selected genre index
final activeGenreIndexProvider = StateProvider<int?>((ref) => 0);

final genreRemoteDataSourceProvider = Provider<GenreRemoteDataSource>((ref) {
  // Retrieve the required dependencies from GetIt
  final apiClient = getItInstance<ApiClient>();
  final logger = getItInstance<Logger>();

  return GenreRemoteDataSourceImpl(apiClient, logger);
});

final genreRepositoryProvider = FutureProvider<GenreRepository>((ref) async {
  final genreRemoteDataSource = ref.watch(genreRemoteDataSourceProvider);
  return GenreRepository(genreRemoteDataSource);
});

final genreListProvider = FutureProvider<List<GenreList>>((ref) async {
  final genreRepository = await ref.read(genreRepositoryProvider.future);
  final eitherGenresOrError = await genreRepository.getCombinedGenres();
  return eitherGenresOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (genres) => genres!, // Return the genres if no error occurred
  );
});
