
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import '../models/user.dart';
import '../utils/functions.dart';
import '../models/user_auth_result.dart';
import 'dart:convert';
import './local_database.dart';
import '../models/update_result.dart';

Future<String?> uploadImage(XFile image) async {

  Dio dio = new Dio();
  FormData formData = FormData.fromMap({
        "image":
            await MultipartFile.fromFile(image.path, filename:image.name),
  });
  const uploadURL = 'https://wingchunskills.herokuapp.com/api/image/post';
  try {
    var response = await dio.post(uploadURL, data: formData, options: Options(
      method: 'POST',
      responseType: ResponseType.json // or ResponseType.JSON
      ));
      print(response.data);
      return response.data['path'];
  } catch(err) {
    print(err.toString());
    return null;
  }
}

Future<UpdateResult<User>> updateUser(User user) async {
  
    Map<String, dynamic> body = mapUser(user);
    Map<String, String> headers = {
      'Content-Type': 'application/json'
    };
    int id = user.id;
    try {
      var url = Uri.parse('https://wingchunskills.herokuapp.com/api/users/$id');
      var response = await http.put(url, headers: headers, body: jsonEncode(body));
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201){
        var result = UserAuthResult.fromJson(jsonDecode(response.body));
        print(result.result);
        var user = result.user();
        print('user: $user');
        saveCurrentUser(user);
        return UpdateResult(user, null); 
      } else {
        return UpdateResult(null, 'Error Signing In');
      }
    } catch (err) {
      return UpdateResult(null, err.toString());
    }
}
Future<UpdateResult<User>> updateUserProperty(Map<String, String> update, int id) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json'
    };
    try {
      var url = Uri.parse('https://wingchunskills.herokuapp.com/api/users/$id');
      var response = await http.put(url, headers: headers, body: jsonEncode(update));
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201){
        var result = UserAuthResult.fromJson(jsonDecode(response.body));
        print(result.result);
        var user = result.user();
        print('user: $user');
        saveCurrentUser(user);
        return UpdateResult(user, null); 
      } else {
        return UpdateResult(null, 'Error Signing In');
      }
    } catch (err) {
      return UpdateResult(null, err.toString());
    }
}

Future<User?> fetchUser(String email) async {
    try {
      var url = Uri.parse('https://wingchunskills.herokuapp.com/api/users?email=$email');
      var response = await http.get(url);
      if (response.statusCode == 200){
        var user = UserAuthResult.fromJson(jsonDecode(response.body)).user();
        saveCurrentUser(user);
        return user;
      } else {
        return null;
      }
    } catch (err) {
      return null;
    }
}
Future<User?> fetchCurrentUser() async {
    try {
      var localUser = await provideCurrentUser();
      String email = localUser.email;
      var url = Uri.parse('https://wingchunskills.herokuapp.com/api/users?email=$email');
      var response = await http.get(url);
      print(response.statusCode);
              print(response.body);

      if (response.statusCode == 200) {
        var user = UserAuthResult.fromJson(jsonDecode(response.body)).user();
        saveCurrentUser(user);
        return user;
      } else {
        print('has different response code');
        return null;
      }
    } catch (err) {
      print(err.toString());
      return null;
    }
}
Future<bool> deleteAccount() async {
  try {
    var id = await currentUserId();
    if (id != null) {
       var url = Uri.parse('https://wingchunskills.herokuapp.com/api/users?=$id');
       var result = await http.delete(url);

      if (result.statusCode != 404 || result.statusCode != 500) {
        return true;
      } else {
         return false;
      }
    } else {
      return false;
    }
  } catch (err) {
    print(err.toString());
    return false;
  }
}