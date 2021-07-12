import 'package:movie_traninhhung/Model/discover.dart';

class Discover_reponse {
  final List<Discover> discover;
  final String errors;
  Discover_reponse(this.discover, this.errors);
  Discover_reponse.fromJson(Map<String, dynamic> json)
      : discover =
            (json["results"] as List).map((e) => Discover.fromJson(e)).toList(),
        errors = "";
  Discover_reponse.withError(String valuuerrors)
      : errors = valuuerrors,
        discover = List();
}
