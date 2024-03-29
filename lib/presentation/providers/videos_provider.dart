import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/video_model.dart';
import 'movie_provider.dart';

part 'videos_provider.g.dart';

@riverpod
Future<List<VideoModel>> videos(VideosRef ref, {required int moviesId}) async {
  final moviesRepository = ref.read(movieRepositoryProvider);
  final eitherVideossOrError = await moviesRepository.getVideos(moviesId);
  return eitherVideossOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (videos) => videos!,
  );
}
