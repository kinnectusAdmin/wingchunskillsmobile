import 'package:flutter/material.dart';
import '../router.dart';
import '../services/local_database.dart';
import './long_button.dart';

class LogOutButton extends StatelessWidget {

  void _onSelect(BuildContext context) {
      logout().then((_) {
          routeToLaunch(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return 
    LongButton('Log Out', Colors.grey[800], () => _onSelect(context));
  }
}