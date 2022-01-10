import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:wingchunskills/widgets/simple_app_bar.dart';

class DateSelection extends StatelessWidget {
  Function _didSelectDate;
  DateSelection(this._didSelectDate);
  void _onDidSelectDate(DateRangePickerSelectionChangedArgs args){
    var date = args.value as DateTime;
    if (date != null) {
      _didSelectDate(date);
    }
  }
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: simpleAppBarWithReturn('Select A Date', context, null),
        backgroundColor: Colors.white,
        body: SfDateRangePicker(onSelectionChanged: _onDidSelectDate)
        );
  }
}