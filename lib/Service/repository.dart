import 'dart:convert';

import 'package:movie_traninhhung/Model/cart_reponse.dart';
import 'package:movie_traninhhung/Model/cart_reponse_movie.dart';
import 'package:movie_traninhhung/Model/discover_reponse.dart';

import 'package:movie_traninhhung/Model/movie_daital_reponse.dart';
import 'package:movie_traninhhung/Model/popular.dart';
import 'package:movie_traninhhung/Model/video_reponse.dart';
import '../Model/movie_reponse.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class Repository {
  final Dio _dio = Dio();
  final http.Client httpclinet = http.Client();
  final String apiKey = '3871ad6519572fdaf1577d755ac3f7a5';
  static String mainURL = "https://api.themoviedb.org/3";
  var getRateUrl = '$mainURL/movie/top_rated';
  var getPlayingUrl = '$mainURL/movie/now_playing';
  var getDiscoverUrl = '$mainURL/discover/movie';

  Future<Movie_reponse> getRateurl() async {
    final url =
        ("https://api.themoviedb.org/3/movie/top_rated?api_key=3871ad6519572fdaf1577d755ac3f7a5");
    try {
      var repon = await httpclinet.get(url);
      if (repon.statusCode == 200) {
        var jsondeco = jsonDecode(repon.body);
        return Movie_reponse.fromJson(jsondeco);
      }
    } catch (exeption) {
      print(exeption);
    }
  }

  Future<CartReponse> getCart(int id) async {
    final url =
        ("https://api.themoviedb.org/3/movie/$id/credits?api_key=3871ad6519572fdaf1577d755ac3f7a5");
    try {
      Response response = await _dio.get(url);
      if (response.statusCode == 200) {
        return CartReponse.fromJson(response.data);
      } else {
        print("không kết nôi đc dữ liệu đc bạn trẻ ơi");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<CartReponseMovie> getCartMovie(int id) async {
    final url =
        ("https://api.themoviedb.org/3/movie/$id/credits?api_key=3871ad6519572fdaf1577d755ac3f7a5");
    try {
      Response response = await _dio.get(url);
      if (response.statusCode == 200) {
        return CartReponseMovie.fromJson(response.data);
      } else {
        print("không kết nôi đc dữ liệu đc bạn trẻ ơi");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Movie_reponse> getNowPlaying() async {
    final url =
        ('https://api.themoviedb.org/3/movie/top_rated?api_key=3871ad6519572fdaf1577d755ac3f7a5');
    try {
      Response response = await _dio.get(url);
      if (response.statusCode == 200) {
        return Movie_reponse.fromJson(response.data);
      } else {
        print("loi qua roi");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Popular_reponse> getPopular() async {
    final url =
        ('https://api.themoviedb.org/3/genre/movie/list?api_key=3871ad6519572fdaf1577d755ac3f7a5');
    try {
      Response response = await _dio.get(url);
      if (response.statusCode == 200) {
        return Popular_reponse.fromJson(response.data);
      } else {
        print("lỗi rồi bà nội");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Discover_reponse> getDiscover() async {
    final url =
        "https://api.themoviedb.org/3/movie/top_rated?api_key=3871ad6519572fdaf1577d755ac3f7a5";
    try {
      Response repository = await _dio.get(url);
      if (repository.statusCode == 200) {
        return Discover_reponse.fromJson(repository.data);
      } else {
        print("print lỗi mẹ rồi");
      }
    } catch (e) {
      print("không đăng nhập đươc đâu bạn ơi");
    }
  }

  Future<Movie_reponse> getListGenre(int id) async {
    final url =
        "https://api.themoviedb.org/3/discover/movie?api_key=3871ad6519572fdaf1577d755ac3f7a5&with_genres=$id";
    try {
      Response reponse = await _dio.get(url);
      if (reponse.statusCode == 200) {
        return Movie_reponse.fromJson(reponse.data);
      } else {
        print("không tìm thấy tên id");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Movie_Daital_Reponse> getMoviedaital(int id) async {
    final url =
        "https://api.themoviedb.org/3/movie/$id?api_key=3871ad6519572fdaf1577d755ac3f7a5";
    try {
      Response response = await _dio.get(url);
      if (response.statusCode == 200) {
        return Movie_Daital_Reponse.fromJson(response.data);
      } else {
        print("không nhận đc rồi bro");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Video_reponse> getVideo(int id) async {
    final url =
        "https://api.themoviedb.org/3/movie/$id/videos?api_key=3871ad6519572fdaf1577d755ac3f7a5";
    try {
      Response response = await _dio.get(url);
      if (response.statusCode == 200) {
        return Video_reponse.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
  }
}
