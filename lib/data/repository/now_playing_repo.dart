import 'package:chillflix2/data/models/movies.dart';
import 'package:chillflix2/data/sources/now_playing_api_service.dart';

class NowPlayingRepository {
  NowPlayingRepository(this._nowPlayingApiService);
  final NowPlayingApiService _nowPlayingApiService;

  Future<List<Movies>?> getNowPlaying(page) async {
    return _nowPlayingApiService.getNowPlaying(page);
  }
}
