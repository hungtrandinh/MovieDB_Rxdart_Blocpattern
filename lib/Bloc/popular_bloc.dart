import 'package:movie_traninhhung/Model/popular.dart';
import 'package:movie_traninhhung/Model/popurlar_reponse.dart';
import 'package:movie_traninhhung/Service/repository.dart';
import 'package:rxdart/subjects.dart';

class Popularbloc {
  Repository _repository = Repository();
  final BehaviorSubject<Popular_reponse> _subject =
      BehaviorSubject<Popular_reponse>();
  BehaviorSubject<Popular_reponse> get subjectPopular => _subject;

  getPopular() async {
    Popular_reponse populara = await _repository.getPopular();
    _subject.sink.add(populara);
  }

  closeScope() {
    _subject.close();
  }
}

final Popularbloc popularbloc = Popularbloc();
