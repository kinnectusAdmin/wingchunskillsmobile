import 'package:flutter/material.dart';
import 'package:wingchunskills/utils/dark_radial_decoration.dart';
import './simple_app_bar.dart';
import '../utils/functions.dart';
import '../services/local_database.dart';
import '../services/comments_service.dart';
import './comment_avatar.dart';
import '../models/user.dart';

class AddComment extends StatefulWidget { 

  final String _title;

  AddComment(this._title);

  @override
  AddCommentState createState() => AddCommentState();
}

class AddCommentState extends State<AddComment> {
  TextEditingController _commentController = TextEditingController();
  late Future<User> _userInfoFuture;
  String _imageURL = '';
  String _name = '';
  void fetchInfo() async {
     try {
      var info = await provideCurrentUser();
      setState(() {
        _imageURL = info?.imageURL ?? '';
        _name = info?.firstName ?? '';
      });
      } catch(err) {
        print(err.toString());
      }
  }
  @override
  void initState() {
    fetchInfo();
    super.initState();
  }

  void _didSelectSend(BuildContext context) {
      addComment(_commentController.text);
      Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.grey[200], child: Icon(Icons.send_sharp, color: Colors.black87), onPressed: () => _didSelectSend(context)),
      appBar: simpleAppBarWithReturn(widget._title, context, Colors.black.withOpacity(0.9)),
      body: Container(
            decoration: darkRadialGradient(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(maxLines: (300/ 20).toInt(), controller: _commentController, decoration: InputDecoration(focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey[200]!)), hintText: 'Enter your comment', hintStyle: TextStyle(color: Colors.grey[200])), cursorColor: Colors.grey[200],),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: 
                  Row(children: [
                          CommentAvatar(_imageURL), 
                          Padding(padding: EdgeInsets.only(left: 10), child: Text(_name, style: TextStyle(color: Colors.grey[200])))
                    ])
                )
              ],
            ),
          ),
    );
  }
}