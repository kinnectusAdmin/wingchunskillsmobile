import '../models/password_errors.dart';
import '../models/sign_in_info.dart';
import '../models/sign_up_info.dart';

bool validateSignIn(SignInInfo info) {
  return validateEmail(info.email) == null;
}
bool validateSignUp(SignUpInfo info) {
  return validateName(info.name) == null && validateEmail(info.email) == null && validatePassword(info.password) == null;
}
String? validateName(String? name) {
  if (name != null) {
    bool isValid = name.isNotEmpty;
    return isValid ? null : 'Invalid Name';
  } else {
    return null;
  }
}
String? validateEmail(String? email) {
  if (email != null) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return emailValid ? null : 'Invalid Email';
  } else {
    return null;
  }
}
String? validatePassword(String? password ){
  
  if (password != null) {
    if (password.isEmpty) {
      return null;
    }
    String? hasEnoughCharacters = minimumCharacterCount(password);
    String? hasSpecialCharacter = specialCharacter(password);
    String? hasNumeral = numericCharacter(password);
    String? hasUpperCase = upperCaseCharacter(password);
    String? hasLowerCase = lowerCaseCharacter(password);
    return  evaluateErrors([hasEnoughCharacters,
                            hasSpecialCharacter,
                            hasNumeral,
                            hasUpperCase,
                            hasLowerCase]);
  } else {
    return null;
  }
}
bool _isSpecificError = false;
bool validateCharacterCount(String text) => text.length >= 8;
String? minimumCharacterCount(String text) {
  return validateCharacterCount(text) ? null : _isSpecificError ? PasswordError.minimumCount().message : PasswordError.genericError();
}
bool validateSpecialCharacter(String text) => text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
String? specialCharacter(String text) {
  return validateSpecialCharacter(text) ? null :
  _isSpecificError ? PasswordError.specialCharacter().message : PasswordError.genericError();
}
bool validateNumericCharacter(String text) => text.contains(RegExp(r'[0-9]'));
String? numericCharacter(String text) {
  return validateSpecialCharacter(text) ? null :
  _isSpecificError ? PasswordError.numeral().message : PasswordError.genericError();
}
bool validateUpperCaseChar(String text) => text.contains(RegExp(r'[A-Z]'));
String? upperCaseCharacter(String text) {
  return validateUpperCaseChar(text) ? null :
  _isSpecificError ? PasswordError.upperCase().message : PasswordError.genericError();
}
bool validateLowerCaseChar(String text) => text.contains(RegExp(r'[a-z]'));
String? lowerCaseCharacter(String text) {
  return validateLowerCaseChar(text) ? null :
  _isSpecificError ? PasswordError.lowerCase().message : PasswordError.genericError();
}

String? evaluateErrors(List<String?> errors) {
  return errors.any((element) => element != null) ? 'Error' : null;
}
