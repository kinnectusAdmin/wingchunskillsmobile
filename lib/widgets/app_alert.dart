
import 'package:flutter/material.dart';
import '/utils/button.dart';
import '../utils/colors.dart';
import './simple_app_bar.dart';

void showAlert(String title, String message,BuildContext context){
   showDialog<String>(
       context: context,
       builder: (BuildContext context) => AlertDialog(
         title: Text(title),
         content: Text(message),
         actions: <Widget>[
           TextButton(
             onPressed: () => Navigator.pop(context, 'OK'),
             child: const Text('OK'),
           ),
         ],
       ),
     );
}
void showAlertWithActions(String title, String message,BuildContext context, Function? onPressed){
   showDialog<String>(
       context: context,
       builder: (BuildContext context) => AlertDialog(
         title: Text(title),
         content: Text(message),
         actions: <Widget>[
           TextButton(
             onPressed: () { if (onPressed != null) { onPressed();}; Navigator.pop(context, 'OK');},
             child: const Text('OK'),
           ),
           TextButton(
             onPressed: () => Navigator.pop(context, 'OK'),
             child: const Text('Cancel'),
           ),
         ],
       ),
     );
}
