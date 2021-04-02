import 'package:flutter/material.dart';
import 'package:videos_player/model/video.model.dart';
import 'package:videos_player/videos_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Workout_Tutorials extends StatefulWidget {
  @override
  _Workout_Tutorials createState() => _Workout_Tutorials();
}

class _Workout_Tutorials extends State<Workout_Tutorials> {
  YoutubePlayerController _controller;
  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          'https://www.youtube.com/watch?v=W-rHIsDFrzQ'),
      flags: YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: false,
      ),
    );
  }

  @override
  void initState() {
    //runYoutubePlayer();
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Map<String, Object>> _list = [
    {
      'id': "2",
      'name': "Elephant Dream",
      'videoUrl':
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
      'thumbnailUrl':
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
    },
    {
      'id': "3",
      'name': "Big Buck Bunny",
      'videoUrl':
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      'thumbnailUrl':
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
    },
    {
      'id': "4",
      'name': "For Bigger Blazes",
      'videoUrl':
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
      'thumbnailUrl':
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg"
    }
  ];
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller1;
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller1 = YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(
              'https://www.youtube.com/watch?v=W-rHIsDFrzQ'),
          flags: YoutubePlayerFlags(
            enableCaption: false,
            isLive: false,
            autoPlay: false,
            mute: false,
          ),
        ),
      ),

      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: Text("yes"),
          ),
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                player,
              ])),
        );
      },
    );
  }
}
