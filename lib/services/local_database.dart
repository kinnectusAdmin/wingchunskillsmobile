import 'package:shared_preferences/shared_preferences.dart';
import 'package:wingchunskills/models/experience_level.dart';
import '../models/user.dart';
import '../utils/functions.dart';

  class LocalDatabaseKeys {
    static String currentUserId = 'current_user_id_key';
    static String currentUserFirstName = 'current_user_first_name_key';
    static String currentUserLastName = 'current_user_last_name_key';
    static String currentUserEmail = 'current_user_email_key';
    static String currentUserImageURL = 'current_user_image_key';
    static String currentUserDob = 'current_user_dob_key';
    static String currentUserExperienceLevel = 'current_user_expLevel_key';
    static String currentUserKwoon = 'current_user_kwoon_key';
    static String currentUserSifu = 'current_user_sifu_key';
    static String currentUserLineage = 'current_user_lineage_key';
    static List<String> allKeys() {
      return [
        currentUserId,
        currentUserFirstName,
        currentUserLastName,
        currentUserEmail,
        currentUserImageURL,
        currentUserDob,
        currentUserExperienceLevel,
        currentUserKwoon,
        currentUserSifu,
        currentUserLineage
      ];
    }
  }
  Future<bool> hasCurrentUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = LocalDatabaseKeys.currentUserId;
      final id = prefs.getInt(key);
      return id != null;
    }catch(error) {
      return false;
    }
  }
  Future<int?> currentUserId() async {
    try{
      final prefs = await SharedPreferences.getInstance();
      final key = LocalDatabaseKeys.currentUserId;
      final id = prefs.getInt(key);
      return id;
    } catch(error) {
      print('did not find id');
      print(error);
      return null;
    }
  }
  Future<String> currentUserFirstName() async {
    try  {
      final prefs = await SharedPreferences.getInstance();
      final key = LocalDatabaseKeys.currentUserFirstName;
      final name = prefs.getString(key);
      return name ?? '';
    } catch(err) {
      return '';
    }
  }
  Future<String> currentUserLastName() async {
    try  {
      final prefs = await SharedPreferences.getInstance();
      final key = LocalDatabaseKeys.currentUserLastName;
      final name = prefs.getString(key);
      return name ?? '';
    } catch(err) {
      return '';
    }
  }
  Future<String> currentUserEmail() async {
    try  {
      final prefs = await SharedPreferences.getInstance();
      final key = LocalDatabaseKeys.currentUserEmail;
      final email = prefs.getString(key);
      return email ?? '';
    } catch(err) {
      return '';
    }
  }
  Future<String> currentUserImageURL() async {
    try  {
      final prefs = await SharedPreferences.getInstance();
      final key = LocalDatabaseKeys.currentUserImageURL;
      final url = prefs.getString(key);
      return url ?? '';
    } catch(err) {
      return '';
    }
  }
  Future<DateTime?> currentUserDOB() async {
    try  {
      final prefs = await SharedPreferences.getInstance();
      final key = LocalDatabaseKeys.currentUserDob;
      final dob = prefs.getString(key);
      return DateTime.parse(dob ?? '');
    } catch(err) {
      return null;
    }
  }
  Future<ExperienceLevel> currentUserExperienceLevel() async {
    try  {
      final prefs = await SharedPreferences.getInstance();
      final key = LocalDatabaseKeys.currentUserExperienceLevel;
      final exp = prefs.getString(key);
      return parseExp(exp ?? '');
    } catch(err) {
      return ExperienceLevel.beginner;
    }
  }
  Future<String> currentUserSifu() async {
    try  {
      final prefs = await SharedPreferences.getInstance();
      final key = LocalDatabaseKeys.currentUserSifu;
      final sifu = prefs.getString(key);
      return sifu ?? '';
    } catch(err) {
      return '';
    }
  }
  Future<String> currentUserKwoon() async {
    try  {
      final prefs = await SharedPreferences.getInstance();
      final key = LocalDatabaseKeys.currentUserKwoon;
      final kwoon = prefs.getString(key);
      return kwoon ?? '';
    } catch(err) {
      return '';
    }
  }
  Future<String> currentUserLineage() async {
    try  {
      final prefs = await SharedPreferences.getInstance();
      final key = LocalDatabaseKeys.currentUserLineage;
      final lineage = prefs.getString(key);
      return lineage ?? '';
    } catch(err) {
      return '';
    }
  }
  
  void saveCurrentUser(User user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var dob = user.dob;
      var dobText = dob != null ? dob.toString() : '';
      await prefs.setInt(LocalDatabaseKeys.currentUserFirstName, user.id);
      await prefs.setString(LocalDatabaseKeys.currentUserFirstName, user.firstName); 
      await prefs.setString(LocalDatabaseKeys.currentUserLastName, user.lastName);
      await prefs.setString(LocalDatabaseKeys.currentUserEmail, user.email);
      await prefs.setString(LocalDatabaseKeys.currentUserImageURL, user.imageURL);
      await prefs.setString(LocalDatabaseKeys.currentUserDob, dobText);
      await prefs.setString(LocalDatabaseKeys.currentUserExperienceLevel, user.experienceLevel.toString());
      await prefs.setString(LocalDatabaseKeys.currentUserKwoon, user.kwoon);
      await prefs.setString(LocalDatabaseKeys.currentUserSifu, user.sifu);
      await prefs.setString(LocalDatabaseKeys.currentUserLineage, user.lineage);
    } catch(error) {
      print(error);
    }
  }

  Future<User> provideCurrentUser() async {
    try {
        var id = await currentUserId() ?? 0;
        var firstName = await currentUserFirstName();
        var lastName = await currentUserLastName();
        var email = await currentUserEmail();
        var imageURL = await currentUserImageURL();
        var dob = await currentUserDOB();
        var expLevel = await currentUserExperienceLevel();
        var sifu = await currentUserSifu();
        var kwoon = await currentUserKwoon();
        var lineage = await currentUserLineage();
        return User(id, firstName, lastName, email, imageURL, dob, expLevel, sifu, kwoon, lineage);
    } catch(error) {
      print('did not find user');
      print(error);
      return User.mockTrainee();
    }
  }

  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      LocalDatabaseKeys.allKeys().forEach((key) {
        prefs.remove(key);
      });
    } catch (error){
      print(error.toString());
    }
  }