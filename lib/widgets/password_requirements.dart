import 'package:flutter/material.dart';
import '../models/password_errors.dart';
import '../utils/validation.dart';

class PasswordRequirements extends StatefulWidget {

  TextEditingController _controller;

  PasswordRequirements(this._controller);

  @override
  PasswordRequirementsState createState() => PasswordRequirementsState();
}

class PasswordRequirementsState extends State<PasswordRequirements> {
  bool? isMeetsCount;
  bool? isMeetsUppercase;
  bool? isMeetsLowercase;
  bool? isMeetsSpecialChar;
  bool? isMeetsNumericaChar;

  void validate(String? password) {
    setState((){
    isMeetsCount = password != null ? validateCharacterCount(password) : null;
    isMeetsUppercase = password != null ? validateUpperCaseChar(password) : null;
    isMeetsLowercase = password != null ? validateLowerCaseChar(password) : null;
    isMeetsSpecialChar = password != null ? validateSpecialCharacter(password) : null;
    isMeetsNumericaChar = password != null ? validateNumericCharacter(password) : null;
    });
  }

  Widget requirement(PasswordError error, bool? isMet) {
    if (isMet != null) {
      return 
      Text(
          error.message,
          style: TextStyle(color: isMet ? Colors.green : Colors.grey, fontSize: 10),
          textAlign: TextAlign.center,
      );
    } else {
      return 
      Text(
          error.message,
          style: const TextStyle(color: Colors.grey, fontSize: 10),
          textAlign: TextAlign.center,
      );
    }
  }
  Widget minCountError() {
    return 
    requirement(PasswordError.minimumCount(), isMeetsCount);
  }
  Widget uppercaseError() {
    return
    requirement(PasswordError.upperCase(), isMeetsUppercase);
  }
  Widget lowercaseError() {
    return
    requirement(PasswordError.lowerCase(), isMeetsLowercase);
  }
  Widget specialCharError() {
    return
    requirement(PasswordError.specialCharacter(), isMeetsSpecialChar);
  }
  Widget numericalError() {
    return
    requirement(PasswordError.specialCharacter(), isMeetsNumericaChar);
  }
  @override
  Widget build(BuildContext context) {
    widget._controller.addListener((){
      validate(widget._controller.text);
    });
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10) ,
          child: Wrap(
                    spacing: 16,
                    children: [minCountError(), uppercaseError(), lowercaseError(), specialCharError(), numericalError()],
                  ),
        )
      ],
      );
  }
}