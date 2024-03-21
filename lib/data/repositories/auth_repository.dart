// ignore_for_file: void_checks

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tmdb_chillflix/data/data_sources/auth_local_data_source.dart';

import '../core/app_error.dart';

class AuthRepository {
  final AuthLocalDataSource _authLocalDataSource;
  AuthRepository(this._authLocalDataSource);

  Future<Either<AppError, bool>>? loginUser(email, password) async {
    try {
      final isLoggedIn = await _authLocalDataSource.loginUser(email, password);
      return Right(isLoggedIn);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  Future<Either<AppError, bool>>? loginWithGoogle() async {
    try {
      final isLoggedIn = await _authLocalDataSource.loginWithGoogle();
      return Right(isLoggedIn);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  Future<Either<AppError, bool>>? registerUser(email, password) async {
    try {
      final userRegistered = await _authLocalDataSource.registerUser(email, password);
      return Right(userRegistered);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  Future<Either<AppError, void>>? logout() async {
    await _authLocalDataSource.logout();
    return const Right(Unit);
  }
}
