import './experience_level.dart';

class User {
  int id = 0;
  String firstName = '';
  String lastName = '';
  String email = '';
  String imageURL = '';
  DateTime? dob = DateTime.now();
  ExperienceLevel experienceLevel = ExperienceLevel.beginner;
  String kwoon = '';
  String sifu = '';
  String lineage = '';

  User( this.id, 
        this.firstName, 
        this.lastName, 
        this.email, 
        this.imageURL, 
        this.dob, 
        this.experienceLevel,
        this.kwoon,
        this.sifu,
        this.lineage
      );

  User.mockTrainee() {
    id = 0;
    firstName = 'Mock';
    lastName = 'User';
    email = 'mock_user@mockUser.com';
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['firstName'],
      json['lastName'],
      json['email'], 
      json['imageURL'],
      json['dob'],
      json['experienceLevel'],
      json['kwoon'],
      json['sifu'],
      json['lineage']
    );
  }
}
