import 'package:flutter/material.dart';
import 'package:wingchunskills/utils/images.dart';
import '../services/remote_database.dart';

class UserProfileImage extends StatelessWidget {

  String imageURL = '';
  Function onTap;
  bool isUploading = false;

  UserProfileImage(this.imageURL, this.onTap, this.isUploading);

  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
        onTap: () => onTap(),
        child:
        isUploading ? Container(child: const CircularProgressIndicator(color: Colors.black), width: 200, height: 200) : 
        imageURL.isNotEmpty? ClipRRect(borderRadius: BorderRadius.circular(100), child: Image.network(imageURL, width: 200, height: 200, fit: BoxFit.cover))
        :
        emptyUserProfileImage(onTap)
    );
  }
}