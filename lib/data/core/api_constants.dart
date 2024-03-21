// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  ApiConstants._();

  static const BASE_URL = "https://api.themoviedb.org/3";
  static String? API_KEY = dotenv.env['API_KEY'];
  static const BASE_IMAGE_URL = "https://image.tmdb.org/t/p/original";
}
