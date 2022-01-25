import '../models/lesson.dart';
import '../services/remote_database.dart';
import '../utils/functions.dart';
import 'package:http/http.dart' as http;
import './web_request.dart';
import 'dart:convert';

Future<List<Lesson>> fetchLessons(int courseId) async {
  try {
    var url = WebRequest.fetchLessons(courseId).url();
    print(url.path);
    var response = await http.get(url);
    var status = response.statusCode;
    print('lessons: response sttatus: $status');
    var body = jsonDecode(response.body);
    print('body: $body');
    if (response.statusCode == 200 || response.statusCode == 201){
      var lessons = LessonsResult.fromJson(jsonDecode(response.body));
      print(lessons.list().length);
      return lessons.list();
    } else {
      print('error getting lessons');
      return [];
    }
  } catch (err) {
    print(err.toString());
    return [];
  }
}

class LessonsResult {
  List<dynamic> result;
  List<Lesson> list() {
    return
    result.map((body) {
      int id = body['id'];
      String title = body['title'];
      String course = body['course'];
      String description = body['description'];
      String imageURL = body['imageURL'];
      String videoURL = body['videoURL'];
      int index = body['index'];
      return Lesson(id, title, course, description, imageURL, videoURL, index);
    }).toList();
  }
  LessonsResult({required this.result});
  factory LessonsResult.fromJson(Map<String, dynamic> json) {
    return LessonsResult(
      result: json['lessons'],
    );
  }
}