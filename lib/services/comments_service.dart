import 'dart:convert';
import './local_database.dart';
import '../models/comment.dart';
import 'package:http/http.dart' as http;
import './web_request.dart';
import './comments_result.dart';

Future<List<Comment>> fetchComments(int lessonId) async {
  var url = WebRequest.fetchComments(lessonId).url();
  try {
    var result = await http.get(url);
    if (result.statusCode == 200 || result.statusCode == 201) {
      print('got comments');
      var comments = CommentsResult.fromJson(jsonDecode(result.body));
      return comments.list();
    } else {
      print('got no comments');
      return [];
    }
  } catch (err) {
    print('got error');
    return [];
  }
}

Future<List<Comment>> observeComments(String lessonID) async {
    
    return [];
}
void addComment(String comment, int lessonId) async {
  var url = WebRequest.addComment().url();
  try {
    var user = await provideCurrentUser();
    Map<String, dynamic> body = {
      'comment': comment,
      'lessonId': lessonId,
      'userName': user.firstName,
      'userImageURL': user.imageURL
    };
    Map<String, String> headers = {
      'Content-Type': 'application/json'
    };
    var result = await http.post(url, headers: headers, body: jsonEncode(body));
    if (result.statusCode == 200 || result.statusCode == 201) {
      print('uploaded comment');
    } else {
      print('error posting comment');
    }
  } catch (err) {

  }
}