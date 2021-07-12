import 'package:flutter/material.dart';
import 'package:movie_traninhhung/Bloc/popular_bloc.dart';

import 'package:movie_traninhhung/Model/popular.dart';
import 'package:movie_traninhhung/Model/popurlar_reponse.dart';
import 'package:movie_traninhhung/Widgets/genre_list.dart';

class Genre extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateGenre();
  }
}

class StateGenre extends State<Genre> {
  @override
  void initState() {
    super.initState();
    popularbloc..getPopular();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Popular_reponse>(
        stream: popularbloc.subjectPopular.stream,
        builder: (context, AsyncSnapshot<Popular_reponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.errors != null &&
                snapshot.data.errors.length > 0) {
              return _movieErros();
            }
            return _myhomeMovie(snapshot.data);
          } else if (snapshot.hasError) {
            return _movieErros();
          } else {
            return _myLoadingMovie();
          }
        });
  }

  Widget _myLoadingMovie() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
            strokeWidth: 4.0,
          ),
        ],
      ),
    );
  }

  Widget _movieErros() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Erros *.*")],
      ),
    );
  }

  Widget _myhomeMovie(Popular_reponse data) {
    final List<Popular> popular = data.popular;
    print(popular);
    if (popular.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Text("No movie")],
        ),
      );
    } else {
      return Genre_listWidget(
        populars: popular,
      );
    }
  }
}
