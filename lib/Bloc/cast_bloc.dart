import 'package:movie_traninhhung/Model/cart_reponse.dart';
import 'package:movie_traninhhung/Service/repository.dart';
import 'package:rxdart/subjects.dart';

class Cast_bloc {
  Repository _repository = Repository();
  final BehaviorSubject<CartReponse> _subject = BehaviorSubject<CartReponse>();
  BehaviorSubject<CartReponse> get behaviorSubjectCart => _subject;
  getAllCart(int id) async {
    CartReponse cartReponse = await _repository.getCart(id);
    _subject.sink.add(cartReponse);
  }

  void dranstream() {
    _subject.value = null;
  }

  void discope() {
    _subject.close();
  }
}

final Cast_bloc cast_bloc = Cast_bloc();
