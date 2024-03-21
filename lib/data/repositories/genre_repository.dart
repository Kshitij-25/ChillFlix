import 'dart:io';

import 'package:dartz/dartz.dart';

import '../core/app_error.dart';
import '../data_sources/genre_remote_data_source.dart';
import '../models/genre_list.dart';

class GenreRepository {
  final GenreRemoteDataSource _genreRemoteDataSource;
  GenreRepository(this._genreRemoteDataSource);

  Future<Either<AppError, List<GenreList>?>>? getCombinedGenres() async {
    try {
      final combinedGenres = await _genreRemoteDataSource.getCombinedGenres();
      return Right(combinedGenres);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }
}
