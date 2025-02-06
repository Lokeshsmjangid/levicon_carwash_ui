import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/resources/utils.dart';

class StationFgPasswordOtpCtrl extends GetxController{
  String? countryCode;
  String? mobileNumber;
  bool isFillOtp = false;
  TextEditingController pinController = TextEditingController();
  FocusNode? pinFocus;

  @override
  void onInit() {
    // TODO: implement onInit
    resendCode();
    super.onInit();
    if(Get.arguments!=null){
      countryCode = Get.arguments['country_code'];
      mobileNumber = Get.arguments['mobile_number'];
    }
    leviconPrint(message: 'Otp Screen: $countryCode and $mobileNumber');
  }

  Timer? timer;
  int seconds = 0;
  bool timerActive = false;

  @override
  void dispose() {
    super.dispose();
  }


  @override
  void onClose() {
    timer?.cancel();
  }

  void startTimer() {
    const duration = Duration(seconds: 1);
    timer = Timer.periodic(duration, (Timer timer) {

      // print("working----->$seconds");
      if (seconds < 1) {
        timer.cancel();
        timerActive = false;
      } else {
        seconds -= 1;
      }
      update();
    });
  }
  void resendCode() {
    // Replace this with your logic to resend the code
    // Reset the timer to the desired duration
    // setState(() {
    seconds = 59; // Change this to your desired duration in seconds
    timerActive = true;
    update();

    startTimer();
  }

}