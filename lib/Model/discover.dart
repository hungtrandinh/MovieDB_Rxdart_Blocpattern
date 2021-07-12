class Discover {
  final String poster_path;
  final int id;
  final String original_language;
  final String original_title;
  final double popularity;
  final double vote_average;
  final int vote_count;
  Discover(
    this.poster_path,
    this.id,
    this.original_language,
    this.original_title,
    this.popularity,
    this.vote_average,
    this.vote_count,
  );
  Discover.fromJson(Map<String, dynamic> json)
      : poster_path = json['poster_path'],
        original_language = json['original_language'],
        popularity = json['popularity'].toDouble(),
        vote_average = json['vote_average'].toDouble(),
        vote_count = json['vote_count'],
        id = json['id'],
        original_title = json['original_title'];
}
