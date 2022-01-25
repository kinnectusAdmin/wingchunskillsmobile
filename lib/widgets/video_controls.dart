import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../utils/colors.dart';

class VideoControls extends StatelessWidget {
  
  VideoPlayerController _controller;
  Function _onPressPlay;
  Function _onPressStop;

  VideoControls(this._controller, this._onPressPlay, this._onPressStop);

  Widget stopButton() {
    return 
      IconButton(
      onPressed: () => _onPressStop(),
      icon: Icon(Icons.stop_rounded, color: whiteColor()),
    );
  }
  Widget playButton() {
    return
    IconButton(
      icon: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow, color: whiteColor()),
        onPressed: () => _onPressPlay(),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return
    Container(
      color: Colors.black38,
      child:
      Row(
        children: [
                  Spacer(),
                  playButton(),
                  Padding(padding: EdgeInsets.only(right: 50), child: stopButton()),
                  ],
      )
    );
  }
}