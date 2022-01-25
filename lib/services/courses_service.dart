import 'dart:convert';

import '../models/course.dart';
import './web_request.dart';
import 'package:http/http.dart' as http;

Future<List<Course>> fetchCourses() async {
  print('fetching...');
  try {
    var url = WebRequest.fetchCourses().url();
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201){
      var courses = CoursesResult.fromJson(jsonDecode(response.body));
      return courses.list();
    } else {
      return [];
    }
  } catch (err) {
    print(err.toString());
    return [];
  }
}

class CoursesResult {
  List<dynamic> result;
  List<Course> list() {
    return
    result.map((body) {
      int id = body['id'];
      String title = body['title'];
      String imageURL = body['imageURL'];
      return Course(id, title, imageURL);
    }).toList();
  }
  CoursesResult({required this.result});
  factory CoursesResult.fromJson(Map<String, dynamic> json) {
    return CoursesResult(
      result: json['courses'],
    );
  }
}