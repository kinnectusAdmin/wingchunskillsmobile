import 'package:flutter/material.dart';
import './widgets/sign_in.dart';
import 'widgets/courses.dart';
import './widgets/sign_up.dart';
import './widgets/forgot_password.dart';
import 'widgets/lessons.dart';
import './widgets/course_lesson.dart';
import './models/course.dart';
import './models/lesson.dart';
import './widgets/add_comment.dart';
import './widgets/profile.dart';
import './widgets/launch.dart';
import './widgets/date_selection.dart';

void routeToLaunch(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (builder) => Launch()));
}

void routeToSignIn(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (builder) => const SignIn()));
}
void routeToForgotPassword(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (builder) => const ForgotPassword()));
}
void routeToSignUp(BuildContext context) {
    // Navigator.push(context, MaterialPageRoute(builder: (builder) => const SignUp()));
}
void routeToCourses(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (builder) => Courses()));
}
void routeToLessons(Course course, BuildContext context) {
  print('route to lessons');
    Navigator.push(context, MaterialPageRoute(builder: (builder) => Lessons(course)));
}
void routeToLesson(Lesson lesson, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (builder) => CourseLesson(lesson)));
}

void routeToDiscussion(Lesson lesson, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (builder) => CourseLesson(lesson)));
}

void routeToAddComment(String title, BuildContext context) {
      Navigator.push(context, MaterialPageRoute(builder: (builder) => AddComment(title)));
}
void routeToProfile(BuildContext context) {
      Navigator.push(context, MaterialPageRoute(builder: (builder) => Profile()));
}
void routeToDatePicker(Function didSelectDate, BuildContext context) {
      Navigator.push(context, MaterialPageRoute(builder: (builder) => DateSelection(didSelectDate)));
}
