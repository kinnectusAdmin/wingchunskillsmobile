class Lesson {
  String id = '';
  String courseId = '';
  String title = '';
  String description = '';
  String imageURL = '';
  String videoURL = '';

  Lesson(this.id, this.courseId, this.title, this.description, this.imageURL, this.videoURL);

  Lesson.empty() {
    id = '';
    courseId = '';
    title = '';
    description = '';
    imageURL = '';
    videoURL = '';
  }

  static Map<String, String> lessonTitleMap() {
      return {
        '1':'Why You Should Learn',
        '2':'Challenges You Will Face: Footwork',
        '3':'Intercepting Hands & Timing',
        '4':'Letting Go & Followup Attack',
        '5':'Wing Chun: Footwork Coordination',
        '6':'Takedowns: Siezing & Holding',
        '7':'Fear of Hitting, Fear of Being Hit',
        '8':'Developing Sensitivity',
        '9':'Body Mechanics',
        '10':'Centerline Theory Pt. 1',
        '11':'Centerline Theory Pt. 2',
        '12':'Centerline Theory Pt. 3',
        '13':'Centerline Theory Pt. 4'
      };
  }
}