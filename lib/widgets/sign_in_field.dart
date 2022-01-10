import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class SignInField extends StatelessWidget {
  String _hint;
  TextEditingController _controller;
  Function(String) _onChanged;
  String? Function(String?) _validation;

  SignInField(this._hint, this._controller, this._onChanged, this._validation);
  
@override
  Widget build(BuildContext context) {
    return
    TextFormField(
      controller: _controller, 
      decoration: InputDecoration(hintText: _hint, hintStyle: TextStyle(color: Colors.white60), focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white38))), 
      onChanged: _onChanged,
      cursorColor: Colors.white, 
      style: TextStyle(color: Colors.white),
    );
  }
}