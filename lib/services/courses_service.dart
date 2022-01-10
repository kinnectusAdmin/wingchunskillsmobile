import '../models/course.dart';

Future<List<Course>> fetchCourses() async {
  return 
    [
      Course.lectureCourse(),
      Course.trainingCourse()
    ].toList();
}