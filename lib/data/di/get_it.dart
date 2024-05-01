import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:tmdb_chillflix/data/data_sources/credits_remote_data_source.dart';
import 'package:tmdb_chillflix/data/repositories/credit_repository.dart';

import '../core/api_client.dart';
import '../data_sources/auth_local_data_source.dart';
import '../data_sources/genre_remote_data_source.dart';
import '../data_sources/movie_remote_data_source.dart';
import '../repositories/auth_repository.dart';
import '../repositories/genre_repository.dart';
import '../repositories/movie_repository.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Dio>(() => Dio());

  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<Logger>(() => Logger());

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(getItInstance(), getItInstance()));

  getItInstance.registerLazySingleton<GenreRemoteDataSource>(() => GenreRemoteDataSourceImpl(getItInstance(), getItInstance()));

  getItInstance.registerLazySingleton<CreditsRemoteDataSource>(() => CreditsRemoteDataSourceImpl(getItInstance(), getItInstance()));

  getItInstance.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<MovieRepository>(() => MovieRepository(getItInstance()));

  getItInstance.registerLazySingleton<GenreRepository>(() => GenreRepository(getItInstance()));

  getItInstance.registerLazySingleton<CreditRepository>(() => CreditRepository(getItInstance()));

  getItInstance.registerLazySingleton<AuthRepository>(() => AuthRepository(getItInstance()));
}
