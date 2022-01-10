import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wingchunskills/models/experience_level.dart';
import '../models/experience_level.dart';
import '../utils/functions.dart';

class ExperienceLevelSelection extends StatelessWidget {
  Function setExperience;
  ExperienceLevel selectedLevel;
  ExperienceLevelSelection(this.selectedLevel, this.setExperience);

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Experience Level', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)), 
          Container(
            width: screenWidth(context),
            height: 60,
            child:
            ListView(
              scrollDirection: Axis.horizontal,
              children: ExperienceLevel.values.map((level){
                return paddedTopRight(Container(decoration: BoxDecoration(color: level != selectedLevel ? Colors.grey[100] : Colors.grey[700], borderRadius: BorderRadius.circular(8)), child: TextButton(child: Text(renderExperienceLevel(level), style: TextStyle(color: selectedLevel != level ? Colors.black : Colors.white)), onPressed: () => setExperience(level),), width: 150, height: 50,));
              }).toList(),
            )
          ),
        ],
      ),
    );
  }
}