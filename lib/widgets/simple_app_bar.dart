import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/button.dart';

AppBar simpleAppBar(String title, Color? color) {
  return 
  AppBar(
    elevation: 0, 
    title: Text(title, style: TextStyle(color: primaryColor()),), 
    backgroundColor: color ?? Colors.transparent, 
    shadowColor: Colors.white,
  );
}
AppBar simpleAppBarWithLeftAction(String title, Widget leading, Color? color) {
  return 
  AppBar(
    elevation: 0, 
    title: Text(title, style: TextStyle(color: Colors.white),), 
    backgroundColor: color ?? Colors.transparent, 
    shadowColor: Colors.white,
    leading: leading,
  );
}
AppBar simpleAppBarWithReturn(String title, BuildContext context, Color? color) {
  return 
  AppBar(
    elevation: 0, 
    title: Text(title, style: TextStyle(color: Colors.white)), 
    leading: backButton(context), 
    backgroundColor: color ?? Colors.transparent, 
    shadowColor: Colors.white,
  );
}
AppBar darkAppBarWithReturn(String title, BuildContext context, Color? color) {
  return 
  AppBar(
    elevation: 0, 
    title: Text(title, style: TextStyle(color: primaryColor())), 
    leading: backButton(context), 
    backgroundColor: color ?? Colors.transparent, 
    shadowColor: Colors.black45,
    toolbarHeight: MediaQuery.of(context).orientation == Orientation.landscape ? 0 : kToolbarHeight,
  );
}