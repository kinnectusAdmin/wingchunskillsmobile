import 'package:flutter/material.dart';
import '../models/comment.dart';
import '../utils/functions.dart';

class CommentView extends StatelessWidget {
  final Comment comment;
  
  CommentView(this.comment);

  Widget avatar() {
    return
    ClipRRect(borderRadius: BorderRadius.circular(25), child: Image.network(comment.userURL, width: 50, height: 50, fit: BoxFit.fill));
  }
  Widget name() {
    return 
    Text(comment.userName, style: TextStyle(color: Colors.white));
  }
  Widget message() {
    return  
    Text(comment.comment, style: TextStyle(color: Colors.white));
  }
  Widget date() {
    String timeSinceMessage = ''/*timeSince(comment.date)*/;
    return
    Text(timeSinceMessage, textAlign: TextAlign.right, style: TextStyle(color: Colors.white));
  }
  
  @override
  Widget build(BuildContext context) {
    return 
      Column(
        children: [
          padded(Row(children: [avatar(), paddedLeft(message())])),
          padded(Row(children: [paddedLeft(name()), const Spacer(), paddedRight(date())]))
        ],
      );
  }
}