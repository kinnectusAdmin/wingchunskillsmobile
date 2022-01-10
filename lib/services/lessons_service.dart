import '../models/lesson.dart';
import '../services/remote_database.dart';
import '../utils/functions.dart';

Future<List<Lesson>> fetchLessons(String courseId) async {
  return
  Lesson.lessonTitleMap()
  .entries
  .map((element) {
    final id = element.key;
    return
    Lesson(id,
          courseId, 
          element.value, 
          mockDescription(),
          'assets/images/lecture$id.png',
          'assets/videos/lecture$id.mp4');
  }).toList();
}