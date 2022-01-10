import 'package:wingchunskills/utils/functions.dart';

import './user.dart';
import './experience_level.dart';

class UserAuthResult {
  Map<String,dynamic> result;
  User user() {
    var id = result['id'] ?? '';
    var firstName = result['firstName'] ?? '';
    var lastName = result['lastName'] ?? '';
    var email = result['email'] ?? '';
    var imageURL = result['imageURL'] ?? '';
    var fetchedDate = result['dob'] ?? '';
    var dob = fetchedDate.isNotEmpty ? DateTime.parse(fetchedDate) : DateTime.now();
    var fetchedExp = result['experienceLevel'] ?? '';
    var expLevel = fetchedExp.isNotEmpty ? parseExp(fetchedExp) : ExperienceLevel.beginner;
    var kwoon = result['kwoon'] ?? '';
    var sifu = result['sifu'] ?? '';
    var lineage = result['lineage'] ?? '';
    return User(id, 
                firstName, 
                lastName, 
                email, 
                imageURL, 
                dob, 
                expLevel, 
                kwoon,
                sifu,
                lineage
              );
  }
  UserAuthResult({
    required this.result,
  });

  factory UserAuthResult.fromJson(Map<String, dynamic> json) {
    return UserAuthResult(
      result: json['user'],
    );
  }
}