import 'package:movie_traninhhung/Model/video_reponse.dart';
import 'package:movie_traninhhung/Service/repository.dart';
import 'package:rxdart/rxdart.dart';

class Video_bloc {
  final Repository _repository = Repository();
  final BehaviorSubject<Video_reponse> _behaviorSubject =
      BehaviorSubject<Video_reponse>();
  BehaviorSubject<Video_reponse> get subjectVideo => _behaviorSubject;

  getVideo(int id) async {
    Video_reponse discover_reponse = await _repository.getVideo(id);
    _behaviorSubject.sink.add(discover_reponse);
  }

  void discope() {
    _behaviorSubject.close();
  }
}

final Video_bloc video_bloc = Video_bloc();
