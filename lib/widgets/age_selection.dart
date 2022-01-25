import 'package:flutter/material.dart';
import '../utils/functions.dart';
import '../router.dart';
import './long_button.dart';

class AgeSelection extends StatelessWidget {
  DateTime? _age;
  Function _didSelectDate;

  AgeSelection(this._age, this._didSelectDate);

  void _didSelectDisplayDateSelection(BuildContext context) {
    routeToDatePicker(_didSelectDate, context);
  }

  @override
  Widget build(BuildContext context) {
    if(_age != null){
      var number = ageFromDate(_age!);
      print('age: $_age');
      print(number);
      var presentation = number > 0 ? '$number years old' : 'Select your Birthday';
      return 
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: 
            [
              Text('Age', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)), 
              LongButton(presentation, Colors.grey[800],() => _didSelectDisplayDateSelection(context))
              ]
          ),
        );
    } else {
      return Spacer();
    }
  }
}