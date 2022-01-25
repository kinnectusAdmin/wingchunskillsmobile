class Lesson {
  int id = 0;
  String course = '';
  String title = '';
  String description = '';
  String imageURL = '';
  String videoURL = '';
  int index = 0;
  Lesson(this.id, this.title, this.course, this.description, this.imageURL, this.videoURL, this.index);

  Lesson.empty() {
    id = 0;
    course = '';
    title = '';
    description = '';
    imageURL = '';
    videoURL = '';
    index = 0;
  }
}