import 'package:flutter/material.dart';
import 'package:wingchunskills/widgets/comment_avatar.dart';
import '../models/comment.dart';
import '../utils/functions.dart';

class CommentView extends StatelessWidget {
  final Comment comment;
  
  CommentView(this.comment);

  @override
  Widget build(BuildContext context) {
    return 
      Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10), 
            child: Row(
              children: [
                CommentAvatar(comment.userURL),
                Padding(padding: EdgeInsets.only(left: 20), child: Text(comment.comment, style: TextStyle(color: Colors.white)))
                ]
            )
          ),
          Padding(
            padding: EdgeInsets.all(10), 
            child: 
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 10), child: Text(comment.userName, style: TextStyle(color: Colors.white))), 
                const Spacer(), 
                // Padding(padding: EdgeInsets.only(right: 10), child:Text(timeSince(comment.date), textAlign: TextAlign.right, style: TextStyle(color: Colors.white)))
                ]
              )
            )
        ],
      );
  }
}