import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/video_model.dart';
import 'movie_provider.dart';

final videosProvider = FutureProvider.family<List<VideoModel>, int>((ref, moviesId) async {
  final moviesRepository = ref.read(movieRepositoryProvider);
  final eitherVideossOrError = await moviesRepository.getVideos(moviesId);
  return eitherVideossOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (videos) => videos!,
  );
});
