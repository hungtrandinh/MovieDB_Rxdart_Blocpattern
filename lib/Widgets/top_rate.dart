import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_traninhhung/Bloc/discover_bloc.dart';
import 'package:movie_traninhhung/Model/discover.dart';
import 'package:movie_traninhhung/Model/discover_reponse.dart';

class TopRate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateTopRate();
  }
}

class StateTopRate extends State<TopRate> {
  @override
  void initState() {
    super.initState();
    discover_bloc..getDiscover();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Discover_reponse>(
        stream: discover_bloc.subjectDiscover.stream,
        builder: (context, AsyncSnapshot<Discover_reponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.errors != null &&
                snapshot.data.errors.length > 0) {
              return _movieErros();
            } else {
              return _myhomeMovie(snapshot.data);
            }
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
    return Container(
      width: 200,
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Erros *.*",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ))
        ]),
      ),
    );
  }

  Widget _myhomeMovie(Discover_reponse data) {
    List<Discover> discovers = data.discover;
    if (discovers.length == 0) {
      return Container(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: 20, top: 15, bottom: 15)),
            Text(
              "MOVIE  RATE",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
      );
    } else {
      return Container(
        height: 370,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 15, bottom: 15),
              child: Text(
                "MOVIE TOP RATE",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 300,
                child: ListView.builder(
                    itemCount: discovers.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                          padding:
                              EdgeInsets.only(top: 10, right: 10, left: 15),
                          width: 180,
                          height: 260,
                          child: GestureDetector(
                            onTap: () {
                              print(
                                  "viết hàm chuyển màn hình khi click vào hình ảnh");
                            },
                            child: Column(
                              children: <Widget>[
                                discovers[index].poster_path == null
                                    ? Hero(
                                        tag: "onpe",
                                        child: Container(
                                          height: 180,
                                          decoration: new BoxDecoration(
                                            color: Colors.yellow,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2.0)),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                EvaIcons.filmOutline,
                                                color: Colors.yellow,
                                                size: 60.0,
                                              )
                                            ],
                                          ),
                                        ))
                                    : Hero(
                                        tag: "Image not null",
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              right: 15, top: 10, bottom: 10),
                                          height: 180.0,
                                          decoration: new BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2.0)),
                                            shape: BoxShape.rectangle,
                                            image: new DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://image.tmdb.org/t/p/w200/" +
                                                        discovers[index]
                                                            .poster_path)),
                                          ),
                                        ),
                                      ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      discovers[index].original_title,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          discovers[index]
                                              .vote_average
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        RatingBar.builder(
                                          itemSize: 15.0,
                                          initialRating: discovers[index]
                                              .vote_average
                                              .toDouble(),
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: false,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          itemBuilder: (context, _) => Icon(
                                            EvaIcons.star,
                                            color: Colors.yellow,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ))),
            Divider(
              height: 5,
              color: Colors.white,
            )
          ],
        ),
      );
    }
  }
}
