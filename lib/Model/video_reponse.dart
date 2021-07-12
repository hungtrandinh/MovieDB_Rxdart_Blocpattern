import 'package:movie_traninhhung/Model/video.dart';

class Video_reponse {
  final List<Video> videos;
  final String erros;

  Video_reponse(this.videos, this.erros);
  Video_reponse.fromJson(Map<String, dynamic> json)
      : videos =
            (json['results'] as List).map((e) => Video.fromJson(e)).toList(),
        erros = "";
  Video_reponse.withErrors(String valueErrors)
      : videos = List(),
        erros = valueErrors;
}
