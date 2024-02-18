import 'package:chillflix2/data/models/movies.dart';
import 'package:chillflix2/data/sources/search_data_source.dart';

class SearchRepository {
  SearchRepository(this._searchDataSource);
  final SearchDataSource _searchDataSource;

  Future<List<Movies>?> multiSearch(query) async {
    return _searchDataSource.multiSearch(query);
  }
}
