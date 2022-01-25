import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  String _title;
  Color? _color;
  Function _onPress;

  LongButton(this._title, this._color, this._onPress);

  @override
  Widget build(BuildContext context) {
    return 
    ElevatedButton(
      onPressed: () => _onPress(),
      child: Text(_title),
      style: ElevatedButton.styleFrom(primary: _color)
    );
  }
}