import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_traninhhung/Bloc/video_bloc.dart';
import 'package:movie_traninhhung/Model/movie.dart';
import 'package:movie_traninhhung/Model/video.dart';
import 'package:movie_traninhhung/Model/video_reponse.dart';
import 'package:movie_traninhhung/Screen/youtube.dart';
import 'package:movie_traninhhung/Widgets/castMovie.dart';
import 'package:movie_traninhhung/Widgets/thongtinphim.dart';
import 'package:sliver_fab/sliver_fab.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ScreenMovie extends StatefulWidget {
  final Movie movie;

  const ScreenMovie({Key key, this.movie}) : super(key: key);

  StateScreenMovie createState() => StateScreenMovie(movie);
}

class StateScreenMovie extends State<ScreenMovie> {
  final Movie movie;
  StateScreenMovie(this.movie);
  @override
  void initState() {
    super.initState();
    video_bloc..getVideo(movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF151C26),
      body: Builder(builder: (context) {
        return SliverFab(
          floatingPosition: FloatingPosition(right: 16),
          floatingWidget: StreamBuilder<Video_reponse>(
              stream: video_bloc.subjectVideo.stream,
              builder: (context, AsyncSnapshot<Video_reponse> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.erros != null &&
                      snapshot.data.erros.length > 0) {
                    return _buildErrorWidget(snapshot.data.erros);
                  }
                  return _buildHomeWidget(snapshot.data);
                } else if (snapshot.hasError) {
                  return _buildErrorWidget(snapshot.data.erros);
                } else {
                  return _buildLoadingWidget();
                }
              }),
          expandedHeight: 250,
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(movie.title,
                    style:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 12)),
                background: Stack(
                  children: <Widget>[
                    Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(0)),
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/original/" +
                                    movie.poster_path)),
                      ),
                      child: new Container(
                        decoration: new BoxDecoration(
                            color: Colors.black.withOpacity(0.2)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [
                              0.1,
                              0.9
                            ],
                            colors: [
                              Colors.black.withOpacity(0.5),
                              Colors.black.withOpacity(0.0)
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
                padding: EdgeInsets.all(0.0),
                sliver: SliverList(
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          movie.vote_average.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        RatingBar.builder(
                          itemSize: 10.0,
                          initialRating: movie.vote_average / 2,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                    child: Text(
                      "OVERVIEW",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      movie.overview,
                      style: TextStyle(
                          color: Colors.white, fontSize: 12.0, height: 1.5),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        CastMovie(id: movie.id),
                        Thongtinphim(id: movie.id),
                      ],
                    ),
                  )
                ])))
          ],
        );
      }),
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

  Widget _buildHomeWidget(Video_reponse data) {
    final List<Video> videos = data.videos;
    return FloatingActionButton(
      backgroundColor: Colors.yellow.shade900,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scrren_youtube(
              youtubePlayerController: YoutubePlayerController(
                initialVideoId: videos[0].key,
                flags: YoutubePlayerFlags(
                  autoPlay: true,
                  mute: false,
                ),
              ),
            ),
          ),
        );
      },
      child: Icon(Icons.play_arrow),
    );
  }
}
