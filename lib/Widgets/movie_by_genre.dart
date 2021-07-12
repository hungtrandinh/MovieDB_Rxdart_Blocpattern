import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_traninhhung/Bloc/mymovie_listgenre.dart';
import 'package:movie_traninhhung/Model/movie.dart';
import 'package:movie_traninhhung/Model/movie_reponse.dart';
import 'package:movie_traninhhung/Screen/movie_scrren.dart';

class MovieByGrene extends StatefulWidget {
  final int id;
  const MovieByGrene({Key key, @required this.id}) : super(key: key);
  @override
  StateMovieByGrene createState() => StateMovieByGrene(id);
}

class StateMovieByGrene extends State<MovieByGrene> {
  final int id;
  StateMovieByGrene(this.id);
  @override
  void initState() {
    super.initState();
    mymovie_genre..getListGenre(id);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Movie_reponse>(
        stream: mymovie_genre.behaviorSubject.stream,
        builder: (context, AsyncSnapshot<Movie_reponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.erros != null && snapshot.data.erros.length > 0) {
              return _buildErrorWidget(snapshot.data.erros);
            }
            return _buildHomeWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.data.erros);
          } else {
            return _buildLoadingWidget();
          }
        });
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 25.0,
          width: 25.0,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
            strokeWidth: 4.0,
          ),
        )
      ],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }

  Widget _buildHomeWidget(Movie_reponse data) {
    final List<Movie> movies = data.movies;
    print(movies);
    if (movies.length == 0) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("No movie")],
          ),
        ),
      );
    } else {
      return Container(
          height: 350,
          padding: EdgeInsets.only(left: 10.0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10, right: 15),
                  child: GestureDetector(
                    onTap: () {
                      print("clicl");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScreenMovie(
                                    movie: movies[index],
                                  )));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        movies[index].poster_path == null
                            ? Container(
                                width: 120.0,
                                height: 180.0,
                                decoration: new BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.0)),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      EvaIcons.filmOutline,
                                      color: Colors.yellow,
                                      size: 60.0,
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                width: 120.0,
                                height: 180.0,
                                decoration: new BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  shape: BoxShape.rectangle,
                                  image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://image.tmdb.org/t/p/w200/" +
                                              movies[index].poster_path)),
                                )),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: 100,
                          child: Text(
                            movies[index].title,
                            maxLines: 2,
                            style: TextStyle(
                                height: 1.4,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.0),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              movies[index].vote_average.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            RatingBar.builder(
                              itemSize: 15.0,
                              initialRating:
                                  movies[index].vote_average.toDouble(),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => Icon(
                                EvaIcons.star,
                                color: Colors.yellow,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }));
    }
  }
}
