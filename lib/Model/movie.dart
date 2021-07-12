class Movie {
  final int id;
  final String original_title;
  final String overview;
  final double popularity;
  final String poster_path;
  final String title;
  final double vote_average;
  final double vote_count;
  Movie(
      {this.original_title,
      this.id,
      this.overview,
      this.popularity,
      this.poster_path,
      this.title,
      this.vote_average,
      this.vote_count});
  Movie.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        original_title = json['original_title'],
        overview = json['overview'],
        popularity = json['popularity'],
        poster_path = json['poster_path'],
        title = json['title'],
        vote_average = json['vote_average'].toDouble(),
        vote_count = json['vote_count'].toDouble();
}
