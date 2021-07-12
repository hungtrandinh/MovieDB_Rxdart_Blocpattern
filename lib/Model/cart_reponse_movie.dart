import 'cast_movie.dart';

class CartReponseMovie {
  final List<CastMovieScreenNow> carts;
  final String errors;
  CartReponseMovie(this.carts, this.errors);
  CartReponseMovie.fromJson(Map<String, dynamic> json)
      : carts = (json["cast"] as List)
            .map((e) => CastMovieScreenNow.fromJson(e))
            .toList(),
        errors = "";
  CartReponseMovie.withError(String valuuerrors)
      : errors = valuuerrors,
        carts = List();
}
