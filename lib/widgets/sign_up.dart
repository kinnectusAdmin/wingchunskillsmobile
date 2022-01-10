// import 'package:flutter/material.dart';
// import '/widgets/simple_app_bar.dart';
// import '../utils/button.dart';
// import '../models/sign_up_info.dart';
// import '../utils/validation.dart';
// import '../services/sign_up_service.dart';
// import '../router.dart';
// import './simple_app_bar.dart';
// import './password_requirements.dart';
// import './app_alert.dart';

// class SignUp extends StatefulWidget {

// const SignUp({Key? key}) : super(key: key);
// @override
//   _SignUpState createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {

//   SignUpInfo info = SignUpInfo();
//   GlobalKey<FormState> _formState =  GlobalKey<FormState>();

//   String? _nameValidation(String? name) => validateName(name);
//   String? _emailValidation(String? email) => validateEmail(email);
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   String? _passwordValidation(String? password ) => validatePassword(password);

//   void _didUpdateName(String? name) {
//    if(name != null) {
//       info.name = name;
//     }
//   }
//   void _didUpdatePassword(String? password) {
//    if(password != null) {
//       info.password = password;
//     }
//   }
//   void _didUpdateEmail(String? email) {
//     if(email != null) {
//       info.email = email;
//     }
//   }
//   void _didSelectSubmit(BuildContext context) {
//     if (validateSignUp(info)){
//         //Attempt Sign In with current credentials
//         var signInResult = signUpUser(info);
//         signInResult.then((result) {
//           //Store current user locally
//           //Navigate to Home
//           if (result.isValid()){
//             routeToCourses(context);
//           } else {
//             showAlert('Sign Up Error',result.error!,context);
//           }
//         });
//     } else {
//       print(info.name);
//       print(info.email);
//       print(_passwordController.text);
//       showAlert('Sign Up Error','Invalid Credentials. Try again please',context);
//     }
//   }

//   Widget _nameField() {
//     return
//     TextFormField(decoration: InputDecoration(hintText: 'Enter Name'), validator: _nameValidation, onChanged: _didUpdateName,);
//   }
//   Widget _emailField() {
//     return
//     TextFormField(controller: _emailController, decoration: InputDecoration(hintText: 'Enter Email'), validator: _emailValidation, onChanged: _didUpdateEmail,);
//   }
//   Widget _passwordField() {
//     return
//     TextFormField(controller: _passwordController, decoration: InputDecoration(hintText: 'Enter Password'),validator: _passwordValidation, onChanged: _didUpdatePassword);
//   }
//   Widget _submitButton(BuildContext context) {
//     return 
//     longButton('Sign Up',() => _didSelectSubmit(context));
//   }
  
//   Widget content(BuildContext context) {
//     return 
//     Padding(
//       padding: EdgeInsets.only(left: 20, right: 20),
//       child: Form(
//         key: _formState,
//         child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [ _nameField(),
//                             _emailField(),
//                             _passwordField(),
//                             PasswordRequirements(_passwordController),
//                             _submitButton(context)],
//               )
//       )
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return 
//     Scaffold(
//       appBar: simpleAppBarWithReturn('Sign In', context), 
//       backgroundColor: Colors.white, 
//       body: content(context)
//     );
//   }
// }