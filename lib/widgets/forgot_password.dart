import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wingchunskills/widgets/sign_in_field.dart';
import '/widgets/simple_app_bar.dart';
import '../utils/colors.dart';
import '../utils/button.dart';
import '../utils/validation.dart';
import '../services/forgot_password_service.dart';
import './app_alert.dart';

class ForgotPassword extends StatefulWidget {

const ForgotPassword({Key? key}) : super(key: key);
@override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();

  String? _emailValidation(String? email) => validateEmail(email);
  
  void _displayAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierLabel: 'Ok',
      builder: (builder) => AlertDialog(title: Text('Check email for instructions'), actions: [acknowledgeAlert(context)],)
    );    
  }

  void _didAcknowledgeAlert(BuildContext context) {
    Navigator.pop(context, 'Ok');
  }
  void _didSelectSubmit(BuildContext context) {
    String email = _emailController.text;
    if (validateEmail(email) == null){
        //Attempt Sign In with current credentials
        sendPasswordRequest(email);
        //Display alert to check email
    } else {
      //Display Error
      print('error sending request');
    }
  }

  Widget acknowledgeAlert(BuildContext context) {
    return
    textButton('Ok', primaryColor(), () => _didAcknowledgeAlert(context));
  }
  Widget content(BuildContext context) {
    return 
    Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Form(
        key: _formState,
        child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignInField('Enter Email', _emailController, (_) => null, _emailValidation),
                   TextButton(
                    onPressed: () =>  showAlert('Reset Password Request Sent', 'Please check your email for further instructions', context),
                    child: Container(alignment: Alignment.center, color: primaryColor(), width: 150, height: 30, child: Text('Reset Password', style: TextStyle(color: Colors.white))),
                  )
                   ],
              )
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: simpleAppBarWithReturn('Forgot Password', context, Colors.black.withOpacity(0.9)), 
      body: Container(
        decoration: BoxDecoration(gradient: RadialGradient(colors: [Colors.black.withOpacity(0.8), Colors.black.withOpacity(0.9)])),
        child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: _formState,
                child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SignInField('Enter Email', _emailController, (_) => null, _emailValidation),
                          TextButton(
                            onPressed: () =>  showAlert('Reset Password Request Sent', 'Please check your email for further instructions', context),
                            child: Container(alignment: Alignment.center, color: primaryColor(), width: 150, height: 30, child: Text('Reset Password', style: TextStyle(color: Colors.white))),
                          )
                          ],
                      )
              )
            )
        )
      );
  }
}