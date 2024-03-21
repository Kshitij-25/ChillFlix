import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchNotifierProvider = ChangeNotifierProvider<SearchNotifier>((ref) => SearchNotifier());

class SearchNotifier extends ChangeNotifier {
  String _query = "";
  String get query => _query;

  set query(query) {
    _query = query;
    notifyListeners();
  }
}
