
class PasswordError {
  String message = '';
  
  PasswordError.lowerCase() {
    message = 'One lowercase value';
  }
  PasswordError.upperCase() {
    message = 'One uppercase value';
  }
  PasswordError.numeral() {
    message = 'One numeric value';
  }
  PasswordError.specialCharacter() {
    message = 'One special character';
  }
  PasswordError.minimumCount() {
    message = 'Eight characters';
  }
  static String genericError() {
    return 'Invalid password';
  }
  static List<String> all() {
    return [
      PasswordError.lowerCase(),
      PasswordError.upperCase(),
      PasswordError.minimumCount(),
      PasswordError.numeral(),
      PasswordError.specialCharacter()
    ]
    .map((error) => error.message)
    .toList();
  }
}