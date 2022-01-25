import 'package:flutter/material.dart';

class ProfileField extends StatelessWidget {
  String _hint;
  TextEditingController _controller;
  Function(String) _onSubmitted;
  String? _validation(String? text) {
    if (text != null) { return text; } else { return null; }
  }
  ProfileField(this._hint, this._controller, this._onSubmitted);
  
  
  @override
  Widget build(BuildContext context) {
    return 
    TextFormField(
      controller: _controller, 
      decoration:  InputDecoration(hintText: _hint, hintStyle: TextStyle(color: Colors.white60), focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))),
      validator: _validation, 
      onFieldSubmitted: _onSubmitted, 
      autocorrect: false,
      cursorColor: Colors.grey[200], 
      style: TextStyle(color: Colors.grey[200]),
    );
  }
}