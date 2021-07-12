import 'package:movie_traninhhung/Model/movie_daital_reponse.dart';
import 'package:movie_traninhhung/Service/repository.dart';
import 'package:rxdart/subjects.dart';

class Movie_daital_bloc {
  final Repository _repository = Repository();
  final BehaviorSubject<Movie_Daital_Reponse> _subject =
      BehaviorSubject<Movie_Daital_Reponse>();
  BehaviorSubject<Movie_Daital_Reponse> get subjectMoviedaital => _subject;
  getMoviedaital(int id) async {
    Movie_Daital_Reponse movie_daital_reponse =
        await _repository.getMoviedaital(id);
    _subject.sink.add(movie_daital_reponse);
  }

  void drainStream() {
    _subject.value = null;
  }

  void discope() async {
    await _subject.drain();
    _subject.close();
  }
}

final Movie_daital_bloc movie_daital_bloc = Movie_daital_bloc();
