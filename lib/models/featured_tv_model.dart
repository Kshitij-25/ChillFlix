class FeaturedTvModel {
  final String? original_title, overview, poster_path, country, release_date;
  final int? id, runtime;
  final double? rating;
  final List? genre;
  FeaturedTvModel({
    this.country,
    this.rating,
    this.genre,
    this.release_date,
    this.runtime,
    this.original_title,
    this.overview,
    this.poster_path,
    this.id,
  });
  factory FeaturedTvModel.fromJson(Map<String, dynamic> json) {
    return FeaturedTvModel(
      original_title: json['name'],
      overview: json['overview'],
      poster_path: json['poster_path'],
      id: json['id'],
      // country: json['production_companies'][0]['origin_country'],
      release_date: json['first_air_date'],
      // run_time: json['run_time'],
      // genre: json['genres'],
      rating: json['vote_average'],
    );
  }
}
