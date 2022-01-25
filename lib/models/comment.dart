class Comment {
  int lessonId = 0;
  DateTime date = DateTime.now();
  String comment;
  String userName;
  String userURL;

  Comment(this.lessonId, this.comment,this.userName, this.userURL);
}