import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StationContactUsCtrl extends GetxController{

  String countryCode = '+91';
  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController mobileNumberCtrl = TextEditingController();
  TextEditingController commentCtrl = TextEditingController();

  void onTextChanged(String value) {
    if (value.startsWith("0")) {
      // Remove the leading zero
      mobileNumberCtrl.value = TextEditingValue(
        text: value.substring(1),
        selection: TextSelection.fromPosition(
          TextPosition(offset: value.length - 1),
        ),
      );
    }
  }



}