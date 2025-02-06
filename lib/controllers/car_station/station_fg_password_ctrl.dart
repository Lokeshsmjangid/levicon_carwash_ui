import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StationForgotPasswordCtrl extends GetxController{
  String countryCode = '+91';
  TextEditingController mobileCtrl = TextEditingController();

  void onTextChanged(String value) {
    if (value.startsWith("0")) {
      // Remove the leading zero
      mobileCtrl.value = TextEditingValue(
        text: value.substring(1),
        selection: TextSelection.fromPosition(
          TextPosition(offset: value.length - 1),
        ),
      );
    }
  }
}