import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:levicon_carwash/resources/utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_routers.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';
import 'package:levicon_carwash/controllers/car_station/station_fg_password_otp_ctrl.dart';

class StationForgotPasswordOtpScreen extends StatefulWidget {
  const StationForgotPasswordOtpScreen({super.key});

  @override
  State<StationForgotPasswordOtpScreen> createState() =>
      _VerifyOtpCustomerState();
}

class _VerifyOtpCustomerState extends State<StationForgotPasswordOtpScreen> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: AppScreen(
        child: GetBuilder<StationFgPasswordOtpCtrl>(builder: (logic) {
          return SingleChildScrollView(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addHeight(78),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    backButton(onTap: () {
                      Get.back();
                    }),
                    addWidth(10),
                    addText500('Forgot Your Password?', fontSize: 18,
                        color: AppColors.blackColor),
                  ],
                ),
                addText400(
                    'OTP has been sent to +91 XXXXX XXX59.', fontSize: 14,
                    color: AppColors.textColor1),

                addHeight(26),
                Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                        AppAssets.verifyOTPImg, width: 214, height: 182)),
                addHeight(24),

                addText500(
                    'Enter Otp', fontSize: 14, color: AppColors.textColor1)
                    .marginOnly(bottom: 8),

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
                    controller: logic.pinController,
                    animationType: AnimationType.fade,
                    autoDismissKeyboard: true,
                    autoFocus: true,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(4),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly
                    ],
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
                        logic.isFillOtp = value.length == 4; // Update state based on input length
                      });
                    },
                    beforeTextPaste: (text) {
                      return true; // Allow pasting text
                    },
                  ),
                ),
                /*Stack(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          border: Border.all(
                              color: AppColors.containerBorderColor),
                          color: AppColors.containerBorderColor.withOpacity(
                              0.20)
                      ),
                      child: Pinput(
                        focusNode: pinFocus,
                        controller: pinController,
                        onCompleted: (pin) {
                          if (pinController.length > 3) {
                            isFillOtp = true;
                          }
                          setState(() {});
                          leviconPrint(message: '\n{\nOTP-->$pin<--\n}\n');
                        },
                        onChanged: (val) {
                          if (pinController.length > 3) {
                            isFillOtp = true;
                          }
                          else {
                            isFillOtp = false;
                          }
                          setState(() {});
                        },
                        enabled: true,
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(4),
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        closeKeyboardWhenCompleted: true,
                        defaultPinTheme: PinTheme(
                          margin: EdgeInsets.all(0.0),
                          padding: EdgeInsets.all(0.0),
                          width: MediaQuery
                              .sizeOf(context)
                              .width / 4,
                          height: 48,
                          textStyle: TextStyle(fontSize: 20,
                              color: Color.fromRGBO(30, 60, 87, 1),
                              // color: Colors.red,
                              fontWeight: FontWeight.w600),
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                        left: MediaQuery
                            .sizeOf(context)
                            .width / 4,
                        child: Container(height: 52, width: 1, color: AppColors
                            .containerBorderColor)),

                    Positioned(
                        left: MediaQuery
                            .sizeOf(context)
                            .width / 2.2,
                        child: Container(height: 52, width: 1, color: AppColors
                            .containerBorderColor)),

                    Positioned(
                        right: MediaQuery
                            .sizeOf(context)
                            .width / 4,
                        child: Container(height: 52, width: 1, color: AppColors
                            .containerBorderColor)),
                  ],
                ),*/
                addHeight(20),

                AppButton(
                    buttonColor: logic.isFillOtp ? AppColors.primaryColor : AppColors
                        .buttonDisableColor,

                    onButtonTap: logic.isFillOtp ? () {


                      leviconPrint(message: 'countryCode:${logic.countryCode} and mobile number: ${logic.mobileNumber}');

                      Get.toNamed(AppRoutes.stationCreateNewPasswordScreen,
                          arguments: {'country_code': logic.countryCode,'mobile_number': logic.mobileNumber});
                    } : () {},
                    buttonText: 'Verify OTP'),
                addHeight(24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    addText500('Didn’t receive the OTP? ', fontSize: 15,
                        color: AppColors.textColor1),
                    addText500(
                        '00:${logic.seconds}s', fontSize: 15, color: AppColors.primaryColor),
                  ],
                ),
                Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: (){
                        if(logic.timerActive==false){

                          logic.seconds = 59; // Change this to your desired duration in seconds
                          logic.timerActive = true;
                          logic.update();
                          logic.startTimer();
                        }
                      },
                      child: Container(
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: addText500(
                              'Resend OTP',
                              fontSize: 15,
                              color: logic.timerActive==false
                                  ? AppColors.primaryColor
                                  : AppColors.buttonDisableColor).marginSymmetric(
                              horizontal: 8, vertical: 4)),
                    )),
                addHeight(20),
              ],
            ).marginSymmetric(horizontal: 20),
          );
        }),
      ),
    );
  }
}
