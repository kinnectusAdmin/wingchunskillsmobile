import 'package:flutter/material.dart';
import 'package:wingchunskills/utils/colors.dart';
import '/widgets/simple_app_bar.dart';
import './simple_app_bar.dart';
import '../models/course.dart';
import '../models/lesson.dart';
import 'lesson_card.dart';
import '../services/lessons_service.dart';
import '../utils/dark_radial_decoration.dart';

class Lessons extends StatefulWidget {

  final Course _course;

  Lessons(this._course);
  
  @override
  LessonsState createState() => LessonsState();
}

class LessonsState extends State<Lessons> {

  late Future<List<Lesson>> _lessonsRequest;
  
  @override
  initState() {
    super.initState();
    _lessonsRequest = fetchLessons(widget._course.id);
  }

  Widget lessonsList(List<Lesson> lessons, BuildContext context){
    return
    ListView(children: lessons.map((lesson) => LessonCard(lesson)).toList());
  }
  Widget lessonsListBuilder() {
    return
    FutureBuilder<List<Lesson>>(
      future: _lessonsRequest,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final list = snapshot.data;
          if (list != null) {
            return lessonsList(list, context);
          } else {
            return CircularProgressIndicator();
          }
        } else {
          return const Text('Error Fetching Data Try Again Later');
        }
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: simpleAppBarWithReturn(widget._course.title, context, Colors.black.withOpacity(0.9)), 
        body: Container(
          decoration: darkRadialGradient(), 
          child: Center(child: lessonsListBuilder()
          )
        )
      ),
    );
  }
}