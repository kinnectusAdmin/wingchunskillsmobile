import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:wingchunskills/widgets/simple_app_bar.dart';
import '../utils/dark_radial_decoration.dart';

class DateSelection extends StatelessWidget {
  Function _didSelectDate;
  DateSelection(this._didSelectDate);
  void _onDidSelectDate(DateRangePickerSelectionChangedArgs args){
    var date = args.value as DateTime;
    if (date != null) {
      print('executing...');
      _didSelectDate(date);
    } else {
      print('date is null');
    }
  }
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: simpleAppBarWithReturn('Select A Date', context, Colors.black.withOpacity(0.9)),
        backgroundColor: Colors.white,
        body: Container(
          decoration: darkRadialGradient(), 
          child: SfDateRangePicker(
            monthViewSettings: DateRangePickerMonthViewSettings(viewHeaderStyle: DateRangePickerViewHeaderStyle(textStyle: TextStyle(color: Colors.grey[200])),),
            onSelectionChanged: _onDidSelectDate,
            selectionColor: Colors.grey[200],
            selectionTextStyle: TextStyle(color: Colors.black87),
            headerStyle: DateRangePickerHeaderStyle(textStyle: TextStyle(color: Colors.grey[200])),
            yearCellStyle: DateRangePickerYearCellStyle(
              textStyle: TextStyle(color: Colors.grey[200]),
              todayTextStyle: TextStyle(color: Colors.red[900]),
              todayCellDecoration: BoxDecoration(
               color: Colors.black12,
               border: Border.all(color: Colors.grey,
                    width: 1),
               shape: BoxShape.circle),
              ),
            monthCellStyle: DateRangePickerMonthCellStyle(
              textStyle: TextStyle(color: Colors.grey[200]),
              todayTextStyle: TextStyle(color: Colors.red[900]),
              todayCellDecoration: BoxDecoration(
               color: Colors.black12,
               border: Border.all(color: Colors.grey,
                    width: 1),
               shape: BoxShape.circle),
         )
              ),
            )
          );
  }
}