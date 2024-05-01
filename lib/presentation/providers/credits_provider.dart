import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb_chillflix/data/data_sources/credits_remote_data_source.dart';
import 'package:tmdb_chillflix/data/repositories/credit_repository.dart';

import '../../data/core/api_client.dart';
import '../../data/di/get_it.dart';
import '../../data/models/credits_model.dart';

part 'credits_provider.g.dart';

@riverpod
CreditsRemoteDataSource creditsRemoteDataSource(CreditsRemoteDataSourceRef ref) {
  // Retrieve the required dependencies from GetIt
  final apiClient = getItInstance<ApiClient>();
  final logger = getItInstance<Logger>();

  return CreditsRemoteDataSourceImpl(apiClient, logger);
}

@riverpod
Future<CreditRepository> creditsRepository(CreditsRepositoryRef ref) async {
  final creditsRemoteDataSource = ref.watch(creditsRemoteDataSourceProvider);
  return CreditRepository(creditsRemoteDataSource);
}

@riverpod
Future<CreditsModel> getCreditsForMovie(GetCreditsForMovieRef ref, {required int movieId}) async {
  final creditsRepository = await ref.read(creditsRepositoryProvider.future);
  final eitherGetCreditsForMovieOrError = await creditsRepository.getCreditsForMovie(movieId);
  return eitherGetCreditsForMovieOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (movieCredits) => movieCredits,
  );
}
