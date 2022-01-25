import 'package:flutter/material.dart';
import 'package:wingchunskills/utils/functions.dart';
import '/services/local_database.dart';
import '../utils/images.dart';
import '../utils/button.dart';
import '../utils/colors.dart';
import '../router.dart';
import './long_button.dart';

class Launch extends StatelessWidget {

  void autoLoginAttempt(BuildContext context) async {
    try {
      final isLoggedIn = await hasCurrentUser();
      final id = await currentUserId();
        print('current user id: $id');
      if (isLoggedIn) {
        routeToCourses(context);
      }
    } catch(error) {
      print(error);
    }
  }
  @override
  Widget build(BuildContext context) {
    autoLoginAttempt(context);
     return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey[800]?.withOpacity(0.9), 
          body: Center(
          child: Stack(children: [
                  Image.asset('assets/images/landingPageImage.jpg', width: screenWidth(context), height: screenHeight(context), fit: BoxFit.fill),
                  Container(color: Colors.grey[800]?.withOpacity(0.9), width: screenWidth(context), height: screenHeight(context)),
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 100), child: Center(child: Logo())),
                      Padding(padding: EdgeInsets.all(20), child: LongButton('Sign In', Colors.grey[800], () => routeToSignIn(context)))
                      ]
                ,)
              ],)
          ), // This trailing comma makes auto-formatting nicer for build methods.
        )
      );
  }
}