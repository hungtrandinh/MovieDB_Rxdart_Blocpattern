import 'package:flutter/material.dart';
import 'package:movie_traninhhung/Model/discover_reponse.dart';

import 'package:movie_traninhhung/Service/repository.dart';
import 'package:rxdart/subjects.dart';

class Discover_bloc {
  final Repository _repository = Repository();
  final BehaviorSubject<Discover_reponse> _behaviorSubject =
      BehaviorSubject<Discover_reponse>();
  BehaviorSubject<Discover_reponse> get subjectDiscover => _behaviorSubject;

  getDiscover() async {
    Discover_reponse discover_reponse = await _repository.getDiscover();
    _behaviorSubject.sink.add(discover_reponse);
  }

  void discope() {
    _behaviorSubject.close();
  }
}

final Discover_bloc discover_bloc = Discover_bloc();
