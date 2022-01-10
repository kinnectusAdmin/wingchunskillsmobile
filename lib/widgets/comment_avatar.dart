import 'package:flutter/material.dart';

class CommentAvatar extends StatelessWidget {
  String _imageUrl = '';
  CommentAvatar(this._imageUrl);

  @override
  Widget build(BuildContext context) {
    if (_imageUrl.isNotEmpty) {
        return    
        ClipRRect(borderRadius: BorderRadius.circular(25), child: Image.network(_imageUrl, width: 50, height: 50, fit: BoxFit.fill));
      } else {
        return CircleAvatar(backgroundColor: Colors.black,);
      }
  }
}