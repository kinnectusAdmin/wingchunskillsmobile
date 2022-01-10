import 'package:flutter/material.dart';
import '../models/lesson.dart';
import '../models/comment.dart';
import '../services/comments_service.dart';
import '../widgets/comment.dart';
import '../utils/functions.dart';

class Comments extends StatefulWidget {

  Lesson _lesson;

  Comments(this._lesson); 

  @override
  CommentsState createState() => CommentsState();
}
class CommentsState extends State<Comments> {
  
  late List<Comment> comments;
  late Future<List<Comment>> initializeCommentsFuture;

  @override
  initState() {
    initializeCommentsFuture = fetchComments(widget._lesson.id);
    super.initState();
  }

  List<CommentView> commentsList(List<Comment> comments ) {
    return 
      comments.map((comment) => CommentView(comment)).toList();
  }

  @override
  Widget build(BuildContext context) {
   
    return
    FutureBuilder(
      future: initializeCommentsFuture, 
      builder: (context, snapshot) {
        if (snapshot.hasData){
          return 
          Container(height: screenHeight(context) - 300 - kToolbarHeight - AppBar().preferredSize.height, 
                    child: ListView(
                            children: commentsList(snapshot.data as List<Comment>)
                          )
          );
        } else {
          return const Spacer();
        }
      }
    );
  }
}