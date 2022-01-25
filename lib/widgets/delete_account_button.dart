import 'package:flutter/material.dart';
import 'package:wingchunskills/widgets/app_alert.dart';
import '../router.dart';
import '../services/local_database.dart';
import './long_button.dart';
import '../services/remote_database.dart';

class DeleteAccountButton extends StatelessWidget {
  
  
  void dismiss(BuildContext context) {
    deleteAccount().then((_) {
      logout().then((_){
        routeToLaunch(context);
      }); 
    });
  }
  void _onSelect(BuildContext context) {
      showAlertWithActions('Are you sure?', 'Deleting your account is a permanent operation but also requires deleting your account on the Wing Chun Skills website.', context, () => dismiss(context));
  }
  @override
  Widget build(BuildContext context) {
    return 
    LongButton('Delete Account', Colors.grey[800], () => _onSelect(context));
  }
}