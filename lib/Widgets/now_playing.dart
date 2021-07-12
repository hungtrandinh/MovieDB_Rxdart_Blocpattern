import 'package:flutter/material.dart';
import 'package:movie_traninhhung/Bloc/peson_now_playing.dart';
import 'package:movie_traninhhung/Model/movie.dart';

import 'package:movie_traninhhung/Model/movie_reponse.dart';
import 'package:page_indicator/page_indicator.dart';

class Nowplaying extends StatefulWidget {
  @override
  StateNowPlaying createState() => StateNowPlaying();
}

class StateNowPlaying extends State<Nowplaying> {
  PageController pageController =
      PageController(viewportFraction: 1, keepPage: true);

  @override
  void initState() {
    super.initState();
    nowPlaying..getPlayingUrl();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Movie_reponse>(
        stream: nowPlaying.subject.stream,
        builder: (context, AsyncSnapshot<Movie_reponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.erros != null && snapshot.data.erros.length > 0) {
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
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
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

  Widget _myhomeMovie(Movie_reponse data) {
    List<Movie> movies = data.movies;
    if (movies.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "No More Movies",
                  style: TextStyle(color: Colors.black45),
                )
              ],
            )
          ],
        ),
      );
    } else
      return Container(
          height: 220,
          child: PageIndicatorContainer(
            length: movies.take(5).length,
            align: IndicatorAlign.bottom,
            padding: EdgeInsets.all(5.0),
            shape: IndicatorShape.roundRectangleShape(size: Size(7, 7)),
            pageView: PageView.builder(
              itemCount: movies.take(5).length,
              controller: pageController,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      print("a");
                    },
                    child: Stack(
                      children: [
                        Hero(
                            tag: movies[index].id,
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 220,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://image.tmdb.org/t/p/original/" +
                                              movies[index].poster_path),
                                    )))),
                        Positioned(
                            bottom: 0.0,
                            top: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.yellow,
                              size: 40.0,
                            )),
                        Positioned(
                            bottom: 30,
                            left: 10,
                            child: Text(
                              movies[index].title,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ))
                      ],
                    ));
              },
            ),
          ));
  }
}
