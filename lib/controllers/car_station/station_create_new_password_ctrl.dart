import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/resources/utils.dart';

class StationCreateNewPasswordCtrl extends GetxController{
  String? countryCode;
  String? mobileNumber;

  TextEditingController newPassCtrl = TextEditingController();
  TextEditingController reNewPassCtrl = TextEditingController();



  bool newPassObscure = true;
  bool reNewPassObscure = true;
  onSuffixTap({bool isNewPass = false}){
    if(isNewPass){
      newPassObscure = !newPassObscure;
      update();
    }else{
      reNewPassObscure = !reNewPassObscure;
      update();
    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(Get.arguments!=null){
      countryCode = Get.arguments['country_code'];
      mobileNumber = Get.arguments['mobile_number'];
    }

    leviconPrint(message: 'StationCreateNewPassword: $countryCode and $mobileNumber');

  }}