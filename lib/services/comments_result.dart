import '../models/comment.dart';
class CommentsResult {

  List<dynamic> result;
  List<Comment> list() {
    return
    result.map((body) {
      int lessonId = body['lessonId'];
      String comment = body['comment'];
      String imageURL = body['userImageURL'];
      String userName = body['userName'];
      return Comment(lessonId, comment, userName, imageURL);
    }).toList();
  }
  CommentsResult({required this.result});
  factory CommentsResult.fromJson(Map<String, dynamic> json) {
    return CommentsResult(
      result: json['comments'],
    );
  }
}