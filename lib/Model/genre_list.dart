import 'package:movie_traninhhung/Model/movie.dart';

class Genrelist {
  final List<Movie> genrelistmovie;
  final String erros;
  Genrelist(this.erros, this.genrelistmovie);
  Genrelist.fromJson(Map<String, dynamic> json)
      : genrelistmovie =
            (json['results'] as List).map((e) => Movie.fromJson(e)).toList(),
        erros = "";
}
