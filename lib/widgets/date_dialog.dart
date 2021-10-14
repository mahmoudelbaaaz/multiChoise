import 'package:flutter/material.dart';
import 'package:multi_choise_app/resources/size.dart';
import 'package:date_time_picker/date_time_picker.dart';

class DateDialog extends StatefulWidget {
  @override
  _DateDialogState createState() => _DateDialogState();
}

class _DateDialogState extends State<DateDialog> {
  DateTime _now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(child: DatePicker(false));
  }






  Widget DatePicker(bool isTime) {
    return Row(
            children: [
              Container(
                width: 66,
                height: 55,
                child: DateTimePicker(
                  type: DateTimePickerType.dateTime,
                  dateMask: 'd',
                  initialValue: _now.toString(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  icon: Icon(Icons.arrow_drop_down),
                  dateLabelText: 'Date',
                  timeLabelText: "Hour",
                  selectableDayPredicate: (date) {
                    // Disable weekend days to select from the calendar
                    // if (date.weekday == 6 || date.weekday == 7) {
                    //   return false;
                    // }

                    return true;
                  },
                  onChanged: (val) {
                    setState(() {

                    });

                  },
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  onSaved: (val) => print(val),
                ),
              ),

            ],
          );

  }












}
