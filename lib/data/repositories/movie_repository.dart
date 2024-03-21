import 'dart:io';

import 'package:dartz/dartz.dart';

import '../core/app_error.dart';
import '../data_sources/movie_remote_data_source.dart';
import '../models/movie_details.dart';
import '../models/movie_model.dart';
import '../models/video_model.dart';

class MovieRepository {
  final MovieRemoteDataSource _movieRemoteDataSource;
  MovieRepository(this._movieRemoteDataSource);

  Future<Either<AppError, List<MovieModel>?>>? discoverMovies(genresId) async {
    try {
      final discoverMovies = await _movieRemoteDataSource.discoverMovies(genresId);
      return Right(discoverMovies);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  Future<Either<AppError, List<MovieModel>?>>? getAllTrending() async {
    try {
      final getAllTrending = await _movieRemoteDataSource.getAllTrending();
      return Right(getAllTrending);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  Future<Either<AppError, MovieDetails?>>? getMoviesDetails(movieId) async {
    try {
      final getMoviesDetails = await _movieRemoteDataSource.getMoviesDetails(movieId);
      return Right(getMoviesDetails);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  Future<Either<AppError, List<MovieModel>?>>? getNowPlaying(page) async {
    try {
      final getNowPlaying = await _movieRemoteDataSource.getNowPlaying(page);
      return Right(getNowPlaying);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  Future<Either<AppError, List<MovieModel>?>>? getPopular(page) async {
    try {
      final getPopular = await _movieRemoteDataSource.getPopular(page);
      return Right(getPopular);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  Future<Either<AppError, List<MovieModel>?>>? getSimilarMovies(movieId) async {
    try {
      final getSimilarMovies = await _movieRemoteDataSource.getSimilarMovies(movieId);
      return Right(getSimilarMovies);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  Future<Either<AppError, List<MovieModel>?>>? getUpcomingMovies(page) async {
    try {
      final getUpcomingMovies = await _movieRemoteDataSource.getUpcomingMovies(page);
      return Right(getUpcomingMovies);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  Future<Either<AppError, List<VideoModel>?>>? getVideos(movieId) async {
    try {
      final getVideos = await _movieRemoteDataSource.getVideos(movieId);
      return Right(getVideos);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  Future<Either<AppError, List<MovieModel>?>>? multiSearch(query) async {
    try {
      final multiSearch = await _movieRemoteDataSource.multiSearch(query);
      return Right(multiSearch);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }
}
