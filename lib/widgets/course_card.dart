import 'package:flutter/material.dart';
import '../models/course.dart';
import '../utils/colors.dart';

class CourseCard extends StatelessWidget {
  final Course _course;

  CourseCard(this._course);

  Widget image(String imageURL) {
    return
    Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shadowColor: Colors.black,
      elevation: 5, 
      child: Image.network(imageURL)
    );
  }
  Widget title(String courseTitle) {
    return 
    Text(_course.title, style: TextStyle(color: Colors.white));
  }
  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: EdgeInsets.only(left: 20, right: 20), 
      child: Column(
              children: 
              <Widget>[
                image(_course.imageURL),
                title(_course.title)
              ]
            )
      );
  }
}