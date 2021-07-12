import 'package:flutter/material.dart';
import 'package:movie_traninhhung/Model/movie_reponse.dart';
import 'package:movie_traninhhung/Service/repository.dart';
import 'package:rxdart/subjects.dart';

class Mymovie_genre {
  final Repository _repository = Repository();
  final BehaviorSubject<Movie_reponse> _subject =
      BehaviorSubject<Movie_reponse>();
  BehaviorSubject<Movie_reponse> get behaviorSubject => _subject;
  getListGenre(int id) async {
    Movie_reponse movie_reponse = await _repository.getListGenre(id);
    _subject.sink.add(movie_reponse);
  }

  void dranstream() {
    _subject.value = null;
  }

  @mustCallSuper
  void discope() async {
    await _subject.drain();
    _subject.close();
  }
}

final Mymovie_genre mymovie_genre = Mymovie_genre();
