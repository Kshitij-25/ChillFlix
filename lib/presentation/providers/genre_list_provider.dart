import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/usecases/genre_usecase.dart';
import '../../data/models/genrelist.dart';
import '../../data/repository/genre_repo.dart';
import '../../data/sources/genre_api_service.dart';

// Provider for GenreApiService
final genreApiServiceProvider = Provider<GenreApiService>((ref) {
  return GenreApiService();
});

// Provider for GenreRepository
final genreRepositoryProvider = Provider<GenreRepository>((ref) {
  final genreApiService = ref.read(genreApiServiceProvider);
  return GenreRepository(genreApiService);
});

// FutureProvider for GenreUseCase
final genreUseCaseProvider = FutureProvider<GenreUseCaseImpl>((ref) async {
  final genreRepository = ref.read(genreRepositoryProvider);
  return GenreUseCaseImpl(genreRepository);
});

// Example of how to use the GenreUseCase in a widget
final genreListProvider = FutureProvider<List<GenreList>?>((ref) async {
  final genreUseCase = await ref.read(genreUseCaseProvider.future);
  return genreUseCase.getGenreList();
});

// Define a provider to store the selected genre index
final activeGenreIndexProvider = StateProvider<int?>((ref) => null);
