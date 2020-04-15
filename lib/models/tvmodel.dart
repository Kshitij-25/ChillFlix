class TvModel {
  final String original_name,
      overview,
      poster_path,
      origin_country,
      first_air_date;
  final int id;
  final double rating;
  final List genre;

  TvModel({
    this.original_name,
    this.genre,
    this.id,
    this.overview,
    this.poster_path,
    this.rating,
    this.first_air_date,
    this.origin_country,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) {
    return TvModel(
      original_name: json['original_name'],
      overview: json['overview'],
      poster_path: json['poster_path'],
      id: json['id'],
      origin_country: json['production_companies'][0]['origin_country'],
      first_air_date: json['release_date'],
      genre: json['genres'],
      rating: json['vote_average'],
    );
  }
}
