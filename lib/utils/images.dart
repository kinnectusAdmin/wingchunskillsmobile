import 'package:flutter/material.dart';

class Logo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/logo.png', width: 300, height: 300);
  }
}
Widget emptyUserProfileImage(Function onTap) {
  return GestureDetector(
    onTap: () => onTap(),
    child: Container(child: Icon(Icons.image, size: 100, color: Colors.white), decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.black),width: 200, height: 200)
  );
}