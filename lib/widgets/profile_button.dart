import 'package:flutter/material.dart';
import '../router.dart';

class ProfileButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return IconButton(color: Colors.black, icon: Icon(Icons.account_circle, color: Colors.white), onPressed: () => routeToProfile(context),);
  }
}