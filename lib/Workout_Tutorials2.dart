import 'package:flutter/material.dart';
import 'package:videos_player/model/video.model.dart';
import 'package:videos_player/videos_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:qr_scanner/Global.dart';

class Workout_Tutorials2 extends StatefulWidget {
  @override
  _Workout_Tutorials2 createState() => _Workout_Tutorials2();
}

class _Workout_Tutorials2 extends State<Workout_Tutorials2> {
  List<Map<String, Object>> _list = [
    {
      'videoUrl':
      "https://youtu.be/dGqI0Z5ul4k",
    },
    {
      'videoUrl':
      "https://youtu.be/5Y3KW5rWMh4",
    },
    {
      'videoUrl':
      "https://youtu.be/-lcbvOddoi8",
    },
    {
      'videoUrl':
      "https://youtu.be/hmnZKRpYaV8",
    },
    {
      'videoUrl':
      "https://youtu.be/DhewkuU_95s",
    }
  ];
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller1;
    return Scaffold(
      appBar: AppBar(
        title: Text("Rachel's Workout Room"),
        backgroundColor: Global().buttonColor,
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (BuildContext ctx, int index) {
          return Card(
            margin: const EdgeInsets.fromLTRB(0,0,0,12.0),
            child: YoutubePlayer(
              controller: _controller1 = YoutubePlayerController(
                initialVideoId: YoutubePlayer.convertUrlToId(
                    _list[index]['videoUrl']),
                flags: YoutubePlayerFlags(
                  enableCaption: false,
                  isLive: false,
                  autoPlay: false,
                  mute: false,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}