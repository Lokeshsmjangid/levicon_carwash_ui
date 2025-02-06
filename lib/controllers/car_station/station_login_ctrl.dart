import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StationLoginCtrl extends GetxController{
  String countryCode = '+91';
  TextEditingController mobileCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();


  bool rememberMe = false;
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

  bool obscurePass = true;
  onTapSuffix(){
    obscurePass = !obscurePass;
    update();
  }



}