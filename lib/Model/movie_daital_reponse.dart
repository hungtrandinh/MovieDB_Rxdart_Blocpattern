import 'package:movie_traninhhung/Model/movie_daital.dart';

class Movie_Daital_Reponse {
  final Movie_daital movie_daital;
  final String erros;

  Movie_Daital_Reponse(this.movie_daital, this.erros);
  Movie_Daital_Reponse.fromJson(Map<String, dynamic> json)
      : movie_daital = Movie_daital.fromJson(json),
        erros = "";
  Movie_Daital_Reponse.withErros(String valueerros)
      : movie_daital = Movie_daital(null, null, null, null, null, null, null,
            null, null, null, null, null, null),
        erros = valueerros;
}
