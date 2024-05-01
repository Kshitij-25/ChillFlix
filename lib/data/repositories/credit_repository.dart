import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tmdb_chillflix/data/data_sources/credits_remote_data_source.dart';

import '../core/app_error.dart';
import '../models/credits_model.dart';

class CreditRepository {
  final CreditsRemoteDataSource _creditsRemoteDataSource;
  CreditRepository(this._creditsRemoteDataSource);

  Future<Either<AppError, CreditsModel>>? getCreditsForMovie(movieId) async {
    try {
      final movieCredits = await _creditsRemoteDataSource.getCreditsForMovie(movieId);
      return Right(movieCredits!);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }
}
