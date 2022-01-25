import 'package:flutter/material.dart';
import '/utils/colors.dart';
import '../utils/button.dart';
import '../models/sign_in_info.dart';
import '../utils/validation.dart';
import '../services/sign_in_service.dart';
import '../router.dart';
import './simple_app_bar.dart';
import 'app_alert.dart';
import './sign_in_field.dart';
import './long_button.dart';
import '../utils/functions.dart';

class SignIn extends StatefulWidget {

const SignIn({Key? key}) : super(key: key);
@override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  
  SignInInfo info = SignInInfo();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  
  void _didSelectSubmit(BuildContext context) {
    print('did select sign in');
    if (validateSignIn(info)) {
      print('is valid info');
        //Attempt Sign In with current credentials
        signInUser(info).then((result) {
          print(result);
          //Navigate to Home
          if (result.error == null) {
            routeToCourses(context);
          } else {
           showAlert('Sign in Error', result.error! ,context);
          }
        }).catchError((error){
          print(error);
        });
    } else {
      showAlert('Sign in Error','Invalid Credentials. Try again please',context);
    }
  }
  void _didUpdatePassword(String? password) {
   if(password != null) {
      info.password = password;
    }
  }
  void _didUpdateEmail(String? email) {
    if(email != null) {
      info.email = email;
    }
  }
  
  @override
  Widget build(BuildContext context) {
      return
      MaterialApp(
        home: Scaffold(
          appBar: simpleAppBarWithReturn('Sign In', context, Colors.black.withOpacity(0.9)),
          body: Container(
            decoration: BoxDecoration(gradient: RadialGradient(colors: [Colors.black.withOpacity(0.8), Colors.black.withOpacity(0.9)])),
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: _formState,
                child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                                    SignInField('Enter Email', _emailController, _didUpdateEmail, validateEmail),
                                    SignInField('Enter Password', _passwordController, _didUpdatePassword, (_) => null),
                                    Padding(
                                      padding: EdgeInsets.only(top: 12), 
                                      child: Row(children: [Spacer(),Expanded(child: textButton('Forgot Password?', Colors.white, () => routeToForgotPassword(context))),],)
                                      ,),
                                    LongButton('Sign In', Colors.grey[800], () => _didSelectSubmit(context))
                                  ],
                      )
              )
            ),
          )
        ),
      );
  }
}