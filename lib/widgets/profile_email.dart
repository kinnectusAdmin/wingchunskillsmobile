import 'package:flutter/material.dart';

class ProfileEmail extends StatelessWidget {
  final String _email;
  ProfileEmail(this._email);

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          Text('Email', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)), 
          Text(_email, style: TextStyle(color: Colors.grey[200]))
          ]
        ),
    );
  }
}