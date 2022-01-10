
class Course {
  String id = '';
  String title = '';
  String imageURL = '';

  Course.lectureCourse() {
    id = '1';
    title = 'Lecture Series';
    imageURL = 'assets/images/lectureCourse.png';
  }

  Course.trainingCourse() {
    id = '2';
    title = 'Combat Training Series';
    imageURL = 'assets/images/trainingCourse.png';
  }
}
