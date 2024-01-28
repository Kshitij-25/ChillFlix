import 'package:chillflix2/core/usecases/videos_usecase.dart';
import 'package:chillflix2/data/models/videos_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common_providers.dart';

final videosUseCaseProvider = FutureProvider<VideosUseCase>((ref) {
  final similarMovies = ref.read(moviesDeatilsRepositoryProvider);
  return VideosUseCaseImpl(similarMovies);
});

final videosProvider = FutureProvider.family<List<VideosModel>?, int>((ref, moviesId) async {
  final videosUseCase = await ref.read(videosUseCaseProvider.future);
  return videosUseCase.getVideos(moviesId);
});
