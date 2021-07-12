import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_traninhhung/Bloc/getcastmovie_bloc.dart';
import 'package:movie_traninhhung/Model/cart_reponse_movie.dart';
import 'package:movie_traninhhung/Model/cast_movie.dart';

class CastMovie extends StatefulWidget {
  final int id;

  const CastMovie({Key key, this.id}) : super(key: key);
  @override
  MyCastMovie createState() => MyCastMovie(id);
}

class MyCastMovie extends State<CastMovie> {
  final int id;
  MyCastMovie(this.id);
  @override
  void initState() {
    super.initState();
    cast_movie_bloc..getAllCarta(id);
  }

  @override
  void dispose() {
    cast_movie_bloc.dranstream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 15),
            child: Text(
              "TRENDING PERSONS ON THIS WEEK",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
        SizedBox(
          height: 5,
        ),
        StreamBuilder<CartReponseMovie>(
          stream: cast_movie_bloc.behaviorSubjectCartMoive.stream,
          builder: (context, AsyncSnapshot<CartReponseMovie> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.errors != null &&
                  snapshot.data.errors.length > 0) {
                return _buildErrorWidget(snapshot.data.errors);
              }
              return _buildCastWidget(snapshot.data);
            } else if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.error);
            } else {
              return _buildLoadingWidget();
            }
          },
        )
      ],
    );
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
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
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

  Widget _buildCastWidget(CartReponseMovie data) {
    List<CastMovieScreenNow> cartsList = data.carts;
    if (cartsList.length == 0) {
      return Container(
        padding: EdgeInsets.all(0),
        child: Center(
          child: Text("No movie"),
        ),
      );
    } else {
      return Container(
        height: 140.0,
        padding: EdgeInsets.only(left: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cartsList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(top: 10.0, right: 8.0),
              width: 100.0,
              child: GestureDetector(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    cartsList[index].profile_path == null
                        ? Hero(
                            tag: cartsList[index].id,
                            child: Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.yellow,
                              ),
                              child: Icon(
                                FontAwesomeIcons.userAlt,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Hero(
                            tag: cartsList[index].id,
                            child: Container(
                                width: 70.0,
                                height: 70.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://image.tmdb.org/t/p/w300/" +
                                              cartsList[index].profile_path)),
                                )),
                          ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      cartsList[index].name,
                      maxLines: 2,
                      style: TextStyle(
                          height: 1.4,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 9.0),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      cartsList[index].character,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.4,
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 7.0),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
