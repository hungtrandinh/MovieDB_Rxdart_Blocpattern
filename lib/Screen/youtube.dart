import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Scrren_youtube extends StatefulWidget {
  final YoutubePlayerController youtubePlayerController;

  const Scrren_youtube({Key key, this.youtubePlayerController})
      : super(key: key);
  @override
  StateYouTube createState() => StateYouTube(youtubePlayerController);
}

class StateYouTube extends State<Scrren_youtube> {
  final YoutubePlayerController _controller;

  StateYouTube(this._controller);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 290),
        child: Stack(
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
            ),
            Positioned(
              top: 40.0,
              right: 20.0,
              child: IconButton(
                  icon: Icon(
                    EvaIcons.closeCircle,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
