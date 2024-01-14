import 'package:chillflix2/data/models/movies.dart';
import 'package:chillflix2/data/sources/trending_api_service.dart';

class TrendingRepository {
  TrendingRepository(this._trendingApiService);
  TrendingApiService _trendingApiService;

  Future<List<Movies>?>? getAllTrending() {
    return _trendingApiService.getAllTrending();
  }
}
