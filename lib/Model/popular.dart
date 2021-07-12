import 'package:movie_traninhhung/Model/popurlar_reponse.dart';

class Popular_reponse {
  final List<Popular> popular;
  final String errors;
  Popular_reponse(this.popular, this.errors);
  Popular_reponse.fromJson(Map<String, dynamic> json)
      : popular = (json['genres'] as List)
            .map((e) => new Popular.fromJson(e))
            .toList(),
        errors = "";
  Popular_reponse.withErros(String valueErros)
      : errors = valueErros,
        popular = List();
}
