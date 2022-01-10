import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wingchunskills/models/experience_level.dart';
import '../models/user.dart';

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
bool isLandScape(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.landscape;
}
bool isPortrait(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.portrait;
}

void setLandscape() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
}
void setPortrait() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
String mockDescription() {
  return
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
}

Widget paddedLeft(Widget widget) {
  return Padding(padding: EdgeInsets.only(left: 10), child: widget);
}
Widget paddedRight(Widget widget) {
  return Padding(padding: EdgeInsets.only(right: 10), child: widget);
}
Widget paddedEdges(Widget widget) {
  return Padding(padding: EdgeInsets.only(left: 10, right: 10), child: widget);
}
Widget paddedTop(Widget widget) {
  return Padding(padding: EdgeInsets.only(top: 10), child: widget);
}
Widget padded(Widget widget) {
  return Padding(padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10), child: widget);
}
Widget paddedLeftTop(Widget widget) {
  return Padding(padding: EdgeInsets.only(left: 10, top: 10), child: widget);
}
Widget paddedTopRight(Widget widget) {
  return Padding(padding: EdgeInsets.only(top: 10, right: 10), child: widget);
}
String timeSince(DateTime date) {
  Duration difference = DateTime.now().difference(date);
    bool isJustNow = difference.inSeconds <= 60;
    bool useDate = difference.inDays > 3;
    bool isDaysAgo = difference.inDays > 1;
    bool isHoursAgo = difference.inHours > 1;
    bool isMinutesAgo = difference.inMinutes > 1;
    
    if (useDate) {
      return '$date.month/$date.day/$date.year';
    } else if (isDaysAgo) {
      int daysAgo = difference.inDays;
      return '$daysAgo ago';
    } else if (isHoursAgo) {
      int hoursAgo = difference.inHours;
      return '$hoursAgo ago';
    } else if (isMinutesAgo) {
      int minutesAgo = difference.inMinutes;
      return '$minutesAgo ago';
    } else if (isJustNow) {
      return 'Just Now';
    } else  {
      return '$date.month/$date.day/$date.year';
    }
}

int ageFromDate(DateTime date) {
    return -(date.difference(DateTime.now()).inDays / 365).toInt();
}

String renderExperienceLevel(ExperienceLevel level) {
    switch(level) {
      case ExperienceLevel.beginner:
      return 'Beginner';
      case ExperienceLevel.intermediate:
      return 'Intermediate';
      case ExperienceLevel.proficient:
      return 'Proficient';
      case ExperienceLevel.master:
      return 'Master';
    }
}

ExperienceLevel parseExp(String exp) {
  switch(exp) {
    case 'beginner':
      return ExperienceLevel.beginner;
    case 'intermediate':
      return ExperienceLevel.intermediate;
    case 'proficient':
      return ExperienceLevel.proficient;
    case 'master':
      return ExperienceLevel.master;
    default:
      return ExperienceLevel.beginner;
  }
}

Map<String, dynamic> mapUser(User user){
  return {
    'id': user.id,
    'firstName': user.firstName,
    'lastName': user.lastName,
    'email': user.email,
    'imageURL': user.imageURL,
    // 'dob': user.dob?.toUtc() ?? '',
    // 'experienceLevel' : user.experienceLevel,
    'kwoon': user.kwoon,
    'sifu': user.sifu,
    'lineage': user.lineage
  };
}
String unlessEmpty(String current,  String initial) {
  return current.isNotEmpty ? current : initial;
}
T unlessNull<T>(T current, T initial) {
  return current ?? initial;
}