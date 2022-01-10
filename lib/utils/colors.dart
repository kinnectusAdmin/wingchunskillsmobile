import 'package:flutter/material.dart';

Color? primaryColor() {
  return Colors.red[900];
}

BoxDecoration backgroundDecoration() {
  return 
  BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.black87, Colors.black45],
      begin:  Alignment.bottomCenter,
      end: Alignment.topCenter
      )
  );
}

Color? blackColor(double opacity){
  return Color.fromRGBO(0, 0, 0, opacity);
}
Color? whiteColor({double opacity = 1.0}){
  return Color.fromRGBO(255, 255, 255, opacity);
}
Color? greyColor(double opacity){
  return Colors.grey[800]?.withOpacity(opacity);
}

