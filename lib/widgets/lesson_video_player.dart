import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../utils/colors.dart';

class Player {
  static Widget video(Future<void> future, VideoPlayerController controller) {
    return 
    // Use a FutureBuilder to display a loading spinner while waiting for the
    // VideoPlayerController to finish initializing.
    FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the video.
          return AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            // Use the VideoPlayer widget to display the video.
              child: VideoPlayer(controller),
            );
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return const Center(
            child: Text('Loading...'),
          );
        }
      },
    );
  }
}