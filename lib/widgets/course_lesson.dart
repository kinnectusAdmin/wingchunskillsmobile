
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wingchunskills/utils/dark_radial_decoration.dart';
import '/utils/colors.dart';
import '../widgets/simple_app_bar.dart';
import './simple_app_bar.dart';
import '../models/lesson.dart';
import '../widgets/lesson_video_player.dart';
import '../utils/functions.dart';
import '../widgets/video_controls.dart';
import '../router.dart';
import './comments.dart';
class CourseLesson extends StatefulWidget {
  final Lesson _lesson;

  CourseLesson(this._lesson);

    @override
  CourseLessonState createState() => CourseLessonState();
}

class CourseLessonState extends State<CourseLesson> {

  late VideoPlayerController _controller = VideoPlayerController.network('');
  late Future<void> _initializeVideoPlayerFuture;
  Widget video = const Text('Loading...');
  @override
  void initState() {
    setUp();
    super.initState();
  }
  void reset() {
    _controller.seekTo(Duration.zero);
    video = Image.network(widget._lesson.imageURL, fit: BoxFit.fill);
    _controller.pause();
  }
  void setUp() async {
    video = Image.network(widget._lesson.imageURL, fit: BoxFit.fill);
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(widget._lesson.videoURL);
    _initializeVideoPlayerFuture = _controller.initialize();
  }
  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    super.dispose();
  }

  void _didPressPlay () {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        video = Player.video(_initializeVideoPlayerFuture, _controller);
        _controller.play();
      }
    });
  }
  void _didPressStop() {
    setState(() {
      reset();
    });
  }
  
  Widget player(BuildContext context) {
    return
      Stack(    
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: isPortrait(context) ? MediaQuery.of(context).size.width * (9/16) : MediaQuery.of(context).size.height,
            child: video
          ), 
          VideoControls(_controller, _didPressPlay, _didPressStop)
          ],
      );
  }

  void _didSelectComment (BuildContext context) {
    routeToAddComment(widget._lesson, context);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return MaterialApp(
          home: Scaffold(
            floatingActionButton: FloatingActionButton(backgroundColor: Colors.grey[200], child: Icon(Icons.chat_rounded, color: Colors.black87), onPressed: () => _didSelectComment(context)),
            appBar: orientation == Orientation.landscape ? null : simpleAppBarWithReturn(widget._lesson.title, context, Colors.black.withOpacity(0.9)),
            body: OrientationBuilder(
                  builder: (context, orientation){
                    switch(orientation){
                    case Orientation.portrait:
                      return
                        Container(
                          decoration: darkRadialGradient(),
                          child: Column(
                            children: [
                              player(context),
                              Padding(padding: EdgeInsets.only(top: 10, left: 10, right: 10), child: Text(widget._lesson.description, style: TextStyle(color: Colors.grey[200]))),
                              Expanded(child: Comments(widget._lesson))
                            ]
                          ),
                        );
                    case Orientation.landscape:
                      return player(context);
                    }
                }),
          ),
        );
      }
    );
  }
}