import 'package:flutter/material.dart';
import 'package:movie_traninhhung/Bloc/movie_daital_bloc.dart';
import 'package:movie_traninhhung/Model/movie_daital.dart';
import 'package:movie_traninhhung/Model/movie_daital_reponse.dart';

class Thongtinphim extends StatefulWidget {
  final int id;
  const Thongtinphim({Key key, this.id}) : super(key: key);
  StateThongtinphim createState() => StateThongtinphim(id);
}

class StateThongtinphim extends State<Thongtinphim> {
  final int id;
  StateThongtinphim(this.id);
  @override
  void initState() {
    super.initState();
    movie_daital_bloc..getMoviedaital(id);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Movie_Daital_Reponse>(
      stream: movie_daital_bloc.subjectMoviedaital.stream,
      builder: (context, AsyncSnapshot<Movie_Daital_Reponse> snapshot) {
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
      },
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

  Widget _buildHomeWidget(Movie_Daital_Reponse data) {
    Movie_daital movies = data.movie_daital;
    print(movies);
    if (movies.genres.length == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "BUDGET",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      movies.budget.toString() + "\$",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "DURATION",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(movies.runtime.toString() + "min",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "RELEASE DATE",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(movies.release_date,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0))
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "GENRES",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 38.0,
                  padding: EdgeInsets.only(right: 10.0, top: 10.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.genres.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              border:
                                  Border.all(width: 1.0, color: Colors.white)),
                          child: Text(
                            movies.genres[index].name,
                            maxLines: 2,
                            style: TextStyle(
                                height: 1.4,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 9.0),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      );
    }
  }
}
