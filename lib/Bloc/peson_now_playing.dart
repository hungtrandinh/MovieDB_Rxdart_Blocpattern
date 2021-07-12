import 'package:movie_traninhhung/Model/movie_reponse.dart';
import 'package:movie_traninhhung/Service/repository.dart';

import 'package:rxdart/rxdart.dart';

class NowPlaying {
  final Repository _repository = Repository();
  final BehaviorSubject<Movie_reponse> _behaviorSubject =
      BehaviorSubject<Movie_reponse>();

  getPlayingUrl() async {
    Movie_reponse repository = await _repository.getNowPlaying();
    _behaviorSubject.sink.add(repository);
  }

  discope() {
    _behaviorSubject.close();
  }

  BehaviorSubject<Movie_reponse> get subject => _behaviorSubject;
}

final NowPlaying nowPlaying = NowPlaying();
