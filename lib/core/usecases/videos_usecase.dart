import 'package:chillflix2/data/models/videos_model.dart';

import '../../data/repositories/movies_repo.dart';
import '../../main.dart';
import '../error/failure.dart';

abstract class VideosUseCase {
  Future<List<VideosModel>?>? getVideos(movieId);
}

class VideosUseCaseImpl implements VideosUseCase {
  VideosUseCaseImpl(this.moviesRepository);
  final MoviesRepository moviesRepository;

  @override
  Future<List<VideosModel>?>? getVideos(movieId) async {
    try {
      return moviesRepository.getVideos(movieId);
    } catch (e) {
      if (e is ServerFailure) {
        throw ServerFailure(serverFailureMessage: e.message);
      } else if (e is NetworkFailure) {
        throw NetworkFailure(networkFailureMessage: e.message);
      } else {
        logger.e('VideosUseCase - getVideos : $e');
      }
    }
    return null;
  }
}
