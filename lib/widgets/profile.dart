import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wingchunskills/utils/dark_radial_decoration.dart';
import 'package:wingchunskills/widgets/app_alert.dart';
import '../models/experience_level.dart';
import '/widgets/simple_app_bar.dart';
import './simple_app_bar.dart';
import '../models/lesson.dart';
import 'lesson_card.dart';
import '../models/user.dart';
import '../services/local_database.dart';
import '../utils/functions.dart';
import '../router.dart';
import '../widgets/experience_level.dart';
import '../services/remote_database.dart';
import '../widgets/user_profile_image.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../utils/functions.dart';
import './profile_input.dart';
import './log_out_button.dart';
import './delete_account_button.dart';
import './age_selection.dart';
import './profile_email.dart';

class Profile extends StatefulWidget {
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {

  late Future<User?> futureUser;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _sifuController = TextEditingController();
  final TextEditingController _kwoonController = TextEditingController();
  final TextEditingController _lineageController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();

  bool isUploading = false;
  User currentUser = User.mockTrainee();
  void _didUpdateFirstName(String? firstName) {
    if (firstName != null) {
      currentUser.firstName = firstName;
      updateHandler('firstName', firstName);
    }
  }
  void _didUpdateLastName(String? lastName) {
    if (lastName != null) {
      currentUser.lastName = lastName;
      updateHandler('lastName', lastName);
    }
  }
  void updateHandler(String field, String data) async {
    try {
        var updateResult = await updateUserProperty({field: data }, currentUser.id);
        var error = updateResult.error;
        var user = updateResult.data;
        if (error == null && user != null) {
          currentUser = user;
        }
      } catch (err){
        print(err.toString());
    }
  }
  void _didUpdateSifu(String? sifu) {
    if (sifu != null) {
      currentUser.sifu = sifu;
      updateHandler('sifu', sifu);
    }
  }
  void _didUpdateKwoon(String? kwoon) {
    if (kwoon != null) {
      currentUser.kwoon = kwoon;
      updateHandler('kwoon', kwoon);
    }
  }
  void _didUpdateLineage(String? lineage) {
    if (lineage != null) {
      currentUser.lineage = lineage;
      updateHandler('lineage', lineage);
    }
  }
  void _didSelectDate(DateTime date) {
    print(date);
    setState(() {
      currentUser.dob = date;
    }); 
    updateHandler('dob', date.toIso8601String());
  }
  
  @override
  initState() {
    futureUser = fetchCurrentUser();
    super.initState();
  }
  
  void _setExperienceLevel(ExperienceLevel level){
    setState(() {
      currentUser.experienceLevel = level;
    });
  }
  void didSelectImagePicker() async {
    
    try {
      XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null){
        setState((){
          isUploading = true;
        });
        try {
          var url = await uploadImage(image);
          if (url != null) {
            setState(() {
              this.currentUser.imageURL = url;
              isUploading = false;
            });
            var currentUser = await provideCurrentUser();
            currentUser.imageURL = url;
            var updateResult = updateUser(currentUser).then((result){
                print(result.data);
                print(result.error);
            }).catchError((error){
              print(error.toString());
            });
          }
        } catch(err){
          print(err.toString());
        }
      } else {
        print('no image');
      }
    } catch (err) {
      print(err.toString());
    }
  }
  
  Widget lessonsList(List<Lesson> lessons, BuildContext context){
    return
    ListView(children: lessons.map((lesson) => LessonCard(lesson)).toList());
  }
  void setFields(User user) {
    _firstNameController.text = user.firstName;
    _lastNameController.text = user.lastName;
    _kwoonController.text = user.kwoon;
    _sifuController.text = user.sifu;
    _lineageController.text = user.lineage;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: simpleAppBarWithReturn('Profile', context, Colors.black.withOpacity(0.9)), 
        body: Container(
          decoration: darkRadialGradient(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                FutureBuilder(
                      future: futureUser,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          currentUser = snapshot.data as User;
                          print(currentUser);
                          String imageURL = currentUser.imageURL;
                          setFields(currentUser);
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Center(child: UserProfileImage(imageURL.isNotEmpty ? imageURL : imageURL, didSelectImagePicker, isUploading)),
                            ProfileInput('First Name', 'Enter Your First Name', _firstNameController, _didUpdateFirstName),
                            ProfileInput('Last Name', 'Enter Your Last Name', _lastNameController, _didUpdateLastName),
                            ProfileEmail(currentUser.email),
                            AgeSelection(currentUser.dob, _didSelectDate),
                            ExperienceLevelSelection(currentUser.experienceLevel, _setExperienceLevel),
                            ProfileInput('Kwoon (Martial Arts School)', 'Enter Your Kwoon', _kwoonController, _didUpdateKwoon),
                            ProfileInput('Sifu (Teacher)', 'Enter your sifus name', _sifuController, _didUpdateSifu),
                            ProfileInput('Lineage', 'Enter Your Lineage', _lineageController, _didUpdateLineage),
                            Center(child: LogOutButton()),
                            Center(child: DeleteAccountButton())
                            ],);
                        } else {
                          return Container();
                        }
                      })                
                ]
              ),
          )
        )
      ),
    );
  }
}


