import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/controllers/car_station/station_fg_password_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/app_routers.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';

import 'station_forgot_password_otp_screen.dart';

class StationForgotPasswordScreen extends StatefulWidget {
  const StationForgotPasswordScreen({super.key});

  @override
  State<StationForgotPasswordScreen> createState() => _VerifyOtpCustomerState();
}

class _VerifyOtpCustomerState extends State<StationForgotPasswordScreen> {

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: AppScreen(
        child: GetBuilder<StationForgotPasswordCtrl>(builder: (logic) {
          return Form(
            key: formKey,
            child: SingleChildScrollView(
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
                  addText500(
                      'Enter your registered mobile number below, and we’ll send you an OTP to reset your password.',
                      fontSize: 13, color: AppColors.textColor1),

                  addHeight(26),
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                          AppAssets.verifyOTPImg, width: 214, height: 182)),
                  addHeight(24),

                  addText500(
                      'Mobile Number', fontSize: 14, color: AppColors.textColor1)
                      .marginOnly(bottom: 8),
                  CustomTextField(
                    controller: logic.mobileCtrl,
                    keyboardType: TextInputType.phone,
                    onChanged: logic.onTextChanged,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Mobile number is required.'),
                      MinLengthValidator(10, errorText: 'Mobile number must be 10 digits long.')]),
                    prefixIcon: Image.asset(AppAssets.indianFlag).marginOnly(left: 14, right: 10, top: 4, bottom: 4),
                    hintText: 'Enter Mobile Number'),

                  addHeight(20),

                  AppButton(
                      buttonColor: AppColors.primaryColor,
                      onButtonTap: () {
                        if(formKey.currentState!.validate()){

                          Get.toNamed(AppRoutes.stationForgotPasswordOtpScreen,
                              arguments: {'country_code': logic.countryCode,'mobile_number': logic.mobileCtrl.text});
                        }
                      },
                      buttonText: 'Request OTP'),
                  addHeight(24),
                ],
              ).marginSymmetric(horizontal: 20),
            ),
          );
        }),
      ),
    );
  }
}
