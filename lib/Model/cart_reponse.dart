import 'package:movie_traninhhung/Model/cart.dart';

class CartReponse {
  final List<CastMovieScreen> carts;
  final String errors;

  CartReponse(this.carts, this.errors);
  CartReponse.fromJson(Map<String, dynamic> json)
      : carts = (json["cast"] as List)
            .map((e) => CastMovieScreen.fromJson(e))
            .toList(),
        errors = "";
  CartReponse.withError(String valuuerrors)
      : errors = valuuerrors,
        carts = List();
}
