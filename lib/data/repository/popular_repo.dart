import 'package:chillflix2/data/sources/popular_api_service.dart';

import '../models/movies.dart';

class PopularRepository {
  PopularRepository(this._popularApiService);
  final PopularApiService _popularApiService;

  Future<List<Movies>?> getPopular(page) async {
    return _popularApiService.getPopular(page);
  }
}
