import 'package:flutter/material.dart';
import './profile_field.dart';

class ProfileInput extends StatelessWidget {
  String _title;
  String _fieldHint;
  TextEditingController _controller;
  Function(String) _onDidUpdate;

  ProfileInput(this._title, this._fieldHint, this._controller, this._onDidUpdate);

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: 
          [
            Text(_title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)), 
            ProfileField(_fieldHint, _controller, _onDidUpdate)
          ]
        ),
    );
  }
}