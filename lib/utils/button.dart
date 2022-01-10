import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'package:flutter/cupertino.dart';

Widget textButton(String title, Color? color, Function onPressed) {
  return TextButton(child: Text(title, style: TextStyle(color: color),), onPressed: () => onPressed(),);
}

Widget longButton(String title, Function onPressed) {
  return 
  ElevatedButton(onPressed: () => onPressed(),
                 child: Text(title),
                 style: ElevatedButton.styleFrom(primary: primaryColor())
                 );
}

Widget backButton(BuildContext context) {
    return
    IconButton(icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white), onPressed: () => Navigator.pop(context),);
  }