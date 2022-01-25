import 'package:flutter/material.dart';
import 'package:wingchunskills/utils/colors.dart';
import '/widgets/simple_app_bar.dart';
import './simple_app_bar.dart';
import '../models/course.dart';
import 'course_card.dart';
import '../router.dart';
import '../utils/functions.dart';
import './profile_button.dart';
import '../services/courses_service.dart';

class Courses extends StatefulWidget {
    @override
  CoursesState createState() => CoursesState();
}

class CoursesState extends State<Courses> {
  
  late Future<List<Course>> _coursesFuture;
  
  @override initState() {
    _coursesFuture = fetchCourses();
    super.initState();
  }
  
  Widget _itemForCourse(Course course, BuildContext context) {
    return 
    Padding(
      padding: EdgeInsets.only(top: 20, bottom: 10),
      child: GestureDetector(
      onTap: () => routeToLessons(course, context),
      child: CourseCard(course)
      ,)
      );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: simpleAppBarWithLeftAction('My Courses', ProfileButton(), Colors.black.withOpacity(0.9)), 
        body: FutureBuilder(
          future: _coursesFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var courses = snapshot.data as List<Course>;
              return Container(
              decoration: BoxDecoration(gradient: RadialGradient(radius: 0.6, colors: [Colors.black.withOpacity(0.7), Colors.black.withOpacity(0.9)])),
              child: Center(child:
                ListView(children: //[Text('hello')]
                courses.map((course) => _itemForCourse(course, context)).toList()
              ,)
              )
              );

            } else {
              return Center(child: Text('Loading Courses'));
            }
          }
        )
        ),
      );
  }
}