import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerVerifyOtpCtrl extends GetxController{
  bool isFillOtp = false;
  TextEditingController pinController = TextEditingController();

  Timer? timer;
  int seconds = 0;
  bool timerActive = false;

  String? countryCode;
  String? mobileNumber;

  @override
  void onInit() {
    // TODO: implement onInit
    resendCode();
    super.onInit();
    if(Get.arguments!=null){
      countryCode = Get.arguments['country_code'];
      mobileNumber = maskMobileNumber(Get.arguments['mobile_number']);
    }
  }

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

  String maskMobileNumber(String mobile) {
    if (mobile.length != 10) return mobile; // Ensure it's a valid 10-digit number
    return 'XXXXX XXX${mobile.substring(8)}';
  }

}