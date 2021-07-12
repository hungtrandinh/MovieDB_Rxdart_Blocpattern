import 'package:movie_traninhhung/Model/cart_reponse.dart';
import 'package:movie_traninhhung/Model/cart_reponse_movie.dart';
import 'package:movie_traninhhung/Service/repository.dart';
import 'package:rxdart/subjects.dart';

class Cast_Movie_bloc {
  Repository _repository = Repository();
  final BehaviorSubject<CartReponseMovie> _subject =
      BehaviorSubject<CartReponseMovie>();
  BehaviorSubject<CartReponseMovie> get behaviorSubjectCartMoive => _subject;
  getAllCarta(int id) async {
    CartReponseMovie cartReponse = await _repository.getCartMovie(id);
    _subject.sink.add(cartReponse);
  }

  void dranstream() {
    _subject.value = null;
  }

  void discope() {
    _subject.close();
  }
}

final Cast_Movie_bloc cast_movie_bloc = Cast_Movie_bloc();
