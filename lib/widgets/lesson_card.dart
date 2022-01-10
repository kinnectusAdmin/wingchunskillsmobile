
import 'package:flutter/material.dart';
import '../models/lesson.dart';
import '../utils/colors.dart';
import '../router.dart';

class LessonCard extends StatelessWidget {
  
  final Lesson _lesson;
  
  LessonCard(this._lesson);

  void _didSelectLesson(BuildContext context) => routeToLesson(_lesson, context);
  Widget image(String imageURL, BuildContext context) {
    return 
    Padding(
      padding: EdgeInsets.only(bottom: 10, top: 10),
      child: GestureDetector(
              onTap: () => _didSelectLesson(context),
              child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shadowColor: Colors.black,
                      elevation: 5, 
                      child: Image.asset(imageURL)
                    )
            ),
      );
  }
  Widget title() {
    return 
    Expanded(flex: 4, child: Text(_lesson.title, style: TextStyle(color: Colors.white)));
  }
  
  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: EdgeInsets.only(left: 20, right: 20), 
      child: Column(
              children: 
              [
                image(_lesson.imageURL, context),
                Padding(padding: EdgeInsets.only(left: 20), child: Row(children: [title()])),
              ]
            )
      );
  }
}