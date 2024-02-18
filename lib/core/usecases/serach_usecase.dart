import 'package:chillflix2/data/repository/search_repo.dart';

import '../../data/models/movies.dart';
import '../../main.dart';
import '../error/failure.dart';

abstract class SearchUseCase {
  Future<List<Movies>?>? multiSearch(query);
}

class SearchUseCaseImpl implements SearchUseCase {
  SearchUseCaseImpl(this._searchRepository);

  final SearchRepository _searchRepository;

  @override
  Future<List<Movies>?>? multiSearch(query) {
    try {
      return _searchRepository.multiSearch(query);
    } catch (e) {
      if (e is ServerFailure) {
        throw ServerFailure(serverFailureMessage: e.message);
      } else if (e is NetworkFailure) {
        throw NetworkFailure(networkFailureMessage: e.message);
      } else {
        logger.e('SearchUseCase - multiSearch : $e');
      }
    }
    return null;
  }
}
