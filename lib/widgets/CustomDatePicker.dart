import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  Function onChange;

  CustomDatePicker({required this.onChange});

  final defaultDatePickerStyle = new InputDecoration(
    border: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(20.0),
    ),
    enabledBorder: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(20.0),
    ),
    focusedBorder: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(20.0),
    ),
    errorBorder: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(20.0),
      borderSide: new BorderSide(color: Colors.red, width: 2),
    ),

    contentPadding:
        EdgeInsets.fromLTRB(20, 15, 0, 15), // add padding to adjust text
    isDense: true,
  );

  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      fieldHintText: "Date",
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      onChanged: (value) {
        onChange(value);
      },
      decoration: defaultDatePickerStyle,
    );
  }
}
