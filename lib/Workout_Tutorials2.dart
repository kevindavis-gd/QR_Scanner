import 'package:flutter/material.dart';
import 'package:videos_player/model/video.model.dart';
import 'package:videos_player/videos_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:qr_scanner/Global.dart';

///////////////////////////////////////////////////////////////////
//Stateful widget to call the new state
///////////////////////////////////////////////////////////////////
class Workout_Tutorials2 extends StatefulWidget {
  @override
  _Workout_Tutorials2 createState() => _Workout_Tutorials2();
}


///////////////////////////////////////////////////////////////////
//State of the page
///////////////////////////////////////////////////////////////////
class _Workout_Tutorials2 extends State<Workout_Tutorials2> {
  //list of youtube links
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
        title: Text("Workout Room"),
        backgroundColor: Global().buttonColor,
      ),
      body: ListView.builder(
        //number of cards that will be in the view
        itemCount: _list.length,
        itemBuilder: (BuildContext ctx, int index) {
          return Card(
            //padding between/around cards
            margin: const EdgeInsets.fromLTRB(0,0,0,12.0),
            //create a youtube player
            child: YoutubePlayer(
              //youtube controller that has the settings for the player
              controller: _controller1 = YoutubePlayerController(
                //convert all the links in the list to work in the player
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