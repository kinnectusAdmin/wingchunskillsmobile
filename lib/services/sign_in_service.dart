import 'package:wingchunskills/models/experience_level.dart';
import '../models/sign_in_info.dart';
import '../models/user.dart';
import '../services/local_database.dart';
import '../services/remote_database.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/functions.dart';
import '../models/user_auth_result.dart';
import 'web_request.dart';
class SignInResult {
  User? user;
  String? error;

  bool isValid() => user != null && error == null;

  SignInResult(this.user, this.error);
}
//Sign in with backend which will verify user via wix and create user if necessary
Future<SignInResult> signInUser(SignInInfo? info) async {
  print(info);
  if (info != null) {
    Map<String, String> body = {
      'email': info.email.toLowerCase(),
      'password': info.password
    };
    Map<String, String> headers = {
      'Content-Type': 'application/json'
    };
    print(body);
    try {
      var url = WebRequest.login().url();
      var response = await http.post(url, headers: headers, body: jsonEncode(body));
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201){
        var result = UserAuthResult.fromJson(jsonDecode(response.body));
        print(result.result);
        var user = result.user();
        print('user: $user');
        saveCurrentUser(user);
        return SignInResult(user, null); 
      } else {
        return SignInResult(null, 'Error Signing In');
      }
    } catch (err) {
      return SignInResult(null, err.toString());
    }
  }
  return SignInResult(null, 'error signing in');
}


