import 'package:chillflix2/data/models/movies.dart';
import 'package:chillflix2/data/repository/trending_repo.dart';

abstract class TrendingUseCase {
  Future<List<Movies>?>? getAllTrending();
}

class TrendingUseCaseImpl implements TrendingUseCase {
  TrendingUseCaseImpl(this._trendingRepository);
  final TrendingRepository _trendingRepository;

  @override
  Future<List<Movies>?>? getAllTrending() {
    return _trendingRepository.getAllTrending();
  }
}
