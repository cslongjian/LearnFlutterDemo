import 'package:flutter/material.dart';
import 'package:flutter_dart_syntax/datepicker_widget/date_picker_constants.dart';
import 'package:flutter_dart_syntax/datepicker_widget/widget/date_picker_widget.dart';

import 'package:flutter/cupertino.dart';

class TestDatePicker extends StatelessWidget {
  TestDatePicker(
      {this.minDateTime,
      this.maxDateTime,
      this.initialDateTime,
      this.onChange,
      this.onCancel,
      this.onConfirm});

  final DateTime minDateTime;
  final DateTime maxDateTime;
  final DateTime initialDateTime;

  final DateValueCallback onConfirm;
  final DateValueCallback onChange;
  final DateVoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.center,
            child: Align(alignment: Alignment.center, child: _buildCenter())));
//    ),);
  }

  Widget _buildCenter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DatePickerWidget(
          minDateTime: DateTime(1900, 1),
          maxDateTime: DateTime(2900, 1),
          initialDateTime: DateTime.now(),
        ),
      ],
    );
  }
}
