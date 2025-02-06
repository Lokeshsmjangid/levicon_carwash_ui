import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/controllers/car_station/station_schedule_time_slots_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/app_routers.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:pinput/pinput.dart';

import 'profile_creation_done_dialogue.dart';

class SignupVerifyOtpDialogue {
  static void show(BuildContext context,{void Function()? onTap}) {
    showDialog(
      context: context,
      barrierColor: AppColors.primaryColor.withOpacity(0.5),
      barrierDismissible: true,
      builder: (_) => SignupVerifyOtpDialogueWidget(onTap: onTap),
    );
  }
}

class SignupVerifyOtpDialogueWidget extends StatefulWidget {
  void Function()? onTap;

  SignupVerifyOtpDialogueWidget({this.onTap});

  @override
  State<SignupVerifyOtpDialogueWidget> createState() => _SignupVerifyOtpDialogueWidgetState();
}

class _SignupVerifyOtpDialogueWidgetState extends State<SignupVerifyOtpDialogueWidget> {


  bool isFillOtp = false;
  TextEditingController pinController = TextEditingController();
  Timer? timer;
  int seconds = 0;
  bool timerActive = false;

  @override
  void initState() {
    // TODO: implement initState
    resendCode();
    super.initState();
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
      setState(() {});
    });
  }
  void resendCode() {
    // Replace this with your logic to resend the code
    // Reset the timer to the desired duration
    // setState(() {
    seconds = 59; // Change this to your desired duration in seconds
    timerActive = true;
    setState(() {});

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true, // false if disable device button
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          backgroundColor: Colors.transparent,
          surfaceTintColor: AppColors.whiteColor,
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.symmetric( horizontal: 18,vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.containerBorderColor),
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(16), // Set the border radius
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addHeight(14),
                Align(
                    alignment: Alignment.center,
                    child: Image.asset(AppAssets.otpPopUpImage,height: 90,width: 90,)),

                addHeight(10),
                Align(
                    alignment: Alignment.center,
                    child: addText500('OTP Verification',color: AppColors.blackColor,fontSize: 20)),
                Align(
                    alignment: Alignment.center,
                    child: addText500('OTP has been sent to +91 XXXXX XXXXX.',color: AppColors.textColor1,
                        fontSize: 14,textAlign: TextAlign.center)),
                addHeight(16),

                addText500('Enter Otp',color: AppColors.textColor1,fontSize: 13),
                addHeight(10),
                Container(
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      border: Border.all(color: AppColors.containerBorderColor),
                      color: AppColors.containerBorderColor.withOpacity(0.20)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: PinCodeTextField(
                    textStyle: TextStyle(color: Color.fromRGBO(30, 60, 87, 1),),
                    length: 4,
                    enablePinAutofill: true,
                    appContext: context,
                    controller: pinController,
                    animationType: AnimationType.fade,
                    autoDismissKeyboard: true,
                    autoFocus: true,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    pinTheme: PinTheme(
                      borderWidth: 1.0,
                      borderRadius: BorderRadius.circular(1000),
                      inactiveBorderWidth: 1.0,
                      activeBorderWidth: 1.0,
                      errorBorderWidth: 1.0,
                      disabledBorderWidth: 1.0,
                      shape: PinCodeFieldShape.underline,
                      fieldHeight: 52,
                      fieldWidth: 52,
                      inactiveFillColor: Colors.red,
                      activeFillColor: Colors.transparent, // Change this as needed
                      // Customize colors for different states
                      inactiveColor: AppColors.containerBorderColor.withOpacity(0.40),
                      activeColor: AppColors.primaryColor, // Active color when focused
                      // errorColor: Colors.red, // Color when there's an error
                    ),
                    separatorBuilder: (context, index) => Container(height: 52,width: 1,color: AppColors.containerBorderColor), // Space between fields
                    animationDuration: const Duration(milliseconds: 300),
                    cursorColor: AppColors.primaryColor,
                    backgroundColor: Colors.transparent, // Background color of the field
                    onCompleted: (v) {
                      // Handle completion of PIN entry
                      print("Completed PIN entry: $v");
                    },
                    onChanged: (value) {
                      setState(() {
                        isFillOtp = value.length == 4; // Update state based on input length
                      });
                    },
                    beforeTextPaste: (text) {
                      return true; // Allow pasting text
                    },
                  ),
                ),

               /* Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            border: Border.all(color: AppColors.containerBorderColor),
                            color: AppColors.containerBorderColor.withOpacity(0.20)
                        ),
                        child: Pinput(
                          onCompleted: (pin) => print(pin),
                          // mainAxisAlignment: MainAxisAlignment.center,
                          enabled: true,
                          closeKeyboardWhenCompleted: true,
                          defaultPinTheme: PinTheme(
                            margin: EdgeInsets.all(0.0),
                            padding: EdgeInsets.all(0.0),
                            width: 48,
                            height: 48,
                            textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          left: 52,
                          child: Container(height: 48,width: 1,color: AppColors.containerBorderColor)),

                      Positioned(
                          left: 108,
                          child: Container(height: 48,width: 1,color: AppColors.containerBorderColor)),

                      Positioned(
                          right:52,
                          child: Container(height: 48,width: 1,color: AppColors.containerBorderColor)),
                    ],
                  ),
                ),*/




                addHeight(24),
                AppButton(
                  buttonColor: isFillOtp ? AppColors.primaryColor : AppColors
                      .buttonDisableColor,
                  buttonText: 'Continue',onButtonTap: isFillOtp?(){
                  Get.back();
                  ProfileCreationDoneDialog.show(context,onTap: (){
                    Get.back();
                    Get.back();
                    Get.toNamed(AppRoutes.stationLoginScreen);
                  });
                }:(){}),
                addHeight(14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    addText500('Didn’t receive the OTP? ',fontSize: 15,color: AppColors.blackColor.withOpacity(0.8)),
                    addText500('00:${seconds}s',fontSize: 15,color: AppColors.primaryColor)],
                ),

                Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                        onTap: (){
                          if(timerActive==false){

                            seconds = 59; // Change this to your desired duration in seconds
                            timerActive = true;
                            setState(() {});
                            startTimer();
                          }
                        },
                        child: addText500('Resend OTP',fontSize: 15,color:timerActive==false
                            ? AppColors.primaryColor
                            : AppColors.primaryColor.withOpacity(0.6)))),
                addHeight(14),
              ],
            ),
          ),
        ),
      ),

      /*child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor.withOpacity(0.28), // Set blur tint to red
            BlendMode.screen, // Adjust blending mode for red tint
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Dialog(
              backgroundColor: Colors.transparent,
              surfaceTintColor: AppColors.whiteColor,
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric( horizontal: 18,vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.containerBorderColor),
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(16), // Set the border radius
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addHeight(14),
                    Align(
                        alignment: Alignment.center,
                        child: Image.asset(AppAssets.otpPopUpImage,height: 90,width: 90,)),

                    addHeight(10),
                    Align(
                        alignment: Alignment.center,
                        child: addText500('OTP Verification',color: AppColors.blackColor,fontSize: 20)),
                    Align(
                        alignment: Alignment.center,
                        child: addText500('OTP has been sent to +91 XXXXX XXXXX.',color: AppColors.textColor1,
                            fontSize: 14,textAlign: TextAlign.center)),
                    addHeight(16),

                    addText500('Enter Otp',color: AppColors.textColor1,fontSize: 13),
                    addHeight(10),

                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Container(
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              border: Border.all(color: AppColors.containerBorderColor),
                              color: AppColors.containerBorderColor.withOpacity(0.20)
                          ),
                          child: Pinput(
                            onCompleted: (pin) => print(pin),
                            // mainAxisAlignment: MainAxisAlignment.center,
                            enabled: true,
                            closeKeyboardWhenCompleted: true,
                            defaultPinTheme: PinTheme(
                              margin: EdgeInsets.all(0.0),
                              padding: EdgeInsets.all(0.0),
                              width: 48,
                              height: 48,
                              textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 52,
                            child: Container(height: 48,width: 1,color: AppColors.containerBorderColor)),

                        Positioned(
                          left: 108,
                            child: Container(height: 48,width: 1,color: AppColors.containerBorderColor)),

                        Positioned(
                          right:52,
                            child: Container(height: 48,width: 1,color: AppColors.containerBorderColor)),
                      ],
                    ),
                  ),




                    addHeight(24),
                    AppButton(buttonText: 'Continue',onButtonTap: (){
                      Get.back();
                      ProfileCreationDoneDialog.show(context,onTap: (){
                        Get.back();
                      });
                    },),
                    addHeight(14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        addText500('Didn’t receive the OTP? ',fontSize: 15,color: AppColors.blackColor.withOpacity(0.8)),
                        addText500('00:58s',fontSize: 15,color: AppColors.primaryColor)

                      ],
                    ),

                    Align(
                        alignment: Alignment.center,
                        child: addText500('Resend OTP',fontSize: 15,color: AppColors.primaryColor.withOpacity(0.6))),
                    addHeight(14),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),*/
    );
  }


  build_days_button({void Function()? onTap,String? day,int? index, int? selectedDayIndex}) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
          decoration: BoxDecoration(
              color: selectedDayIndex==index?AppColors.primaryColor:AppColors.whiteColor,
              borderRadius: BorderRadius.circular(100),
              border: selectedDayIndex==index?null:Border.all(color: AppColors.containerBorderColor)
          ),
          child: addText400("$day".capitalize.toString(),
              maxLines: 1,textAlign: TextAlign.center,fontSize: 13,color:selectedDayIndex == index?Colors.white: AppColors.textColor1.withOpacity(0.8)).marginSymmetric(horizontal: 8,vertical: 4)),
    );
  }
}
