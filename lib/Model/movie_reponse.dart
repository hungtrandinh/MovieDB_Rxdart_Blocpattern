import 'movie.dart';

class Movie_reponse {
  final List<Movie> movies;
  final String erros;

  Movie_reponse(this.movies, this.erros);
  Movie_reponse.fromJson(Map<String, dynamic> json)
      : movies = (json['results'] as List)
            .map((e) => new Movie.fromJson(e))
            .toList(),
        erros = "";
  Movie_reponse.withError(String errorValue)
      : movies = List(),
        erros = errorValue;
}
