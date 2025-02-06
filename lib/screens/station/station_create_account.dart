import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/common_bottom_sheet/station_choose_profile_picture_bottom_sheet.dart';
import 'package:levicon_carwash/controllers/car_station/station_signup_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';
import 'package:levicon_carwash/custom_widgets/custom_snakebar.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/dialogues/car_station/signup_verify_otp_dialogue.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';

class StationSignUpScreen extends StatefulWidget {
  const StationSignUpScreen({super.key});

  @override
  State<StationSignUpScreen> createState() => _CustomerLoginScreenState();
}

class _CustomerLoginScreenState extends State<StationSignUpScreen> {

  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.whiteColor,
      body: AppScreen(
        child: GetBuilder<StationSignupCtrl>(builder: (logic) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addHeight(78),
                  addText500('Create Your Account', fontSize: 18).marginSymmetric(
                      horizontal: 20),
                  addText500(
                      'Sign up to book carwash services easily and manage your preferences. Fill in the details below to get started!',
                      fontSize: 13, color: AppColors.textColor1).marginSymmetric(
                      horizontal: 20),


                  // Align(
                  //     alignment: Alignment.center,
                  //     child: Image.asset(AppAssets.newPasswordBg,width: 214,height: 182,)),
                  // addHeight(24),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addHeight(26),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: (){
                            ChooseProfilePictureBottomSheet.show(context, 'StationCreateAccount');
                          },
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: logic.selectedImage != null
                                      ? FileImage(File(logic.selectedImage!
                                      .path)) // Use FileImage for file input
                                      : AssetImage(
                                      AppAssets.profilePicture) as ImageProvider,
                                  // Use AssetImage for default
                                  fit: BoxFit.cover,
                                )
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(1000),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Container(
                                color: AppColors.primaryColor.withOpacity(0.6),
                                child: Center(
                                    child: Image.asset(AppAssets.uploadIcon,
                                      color: AppColors.whiteColor,
                                      height: 30,
                                      width: 30,)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      addHeight(30),

                      addText500('Car Station Name ', fontSize: 14,
                          color: AppColors.textColor1).marginOnly(bottom: 8),
                      CustomTextField(
                        controller: logic.stationNameCtrl,
                        keyboardType: TextInputType.text,
                        prefixIcon: Image.asset(
                            AppAssets.textFieldUserIcon, width: 19, height: 22).marginOnly(left: 22, right: 18, top: 4, bottom: 4),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(25),
                          ],
                        validator: MultiValidator([
                            RequiredValidator(errorText: 'Station Name is required.'),
                          ]),
                        hintText: 'Enter Station Name'),
                      addHeight(16),

                      addText500('Station Address', fontSize: 14, color: AppColors.textColor1).marginOnly(bottom: 8),
                      CustomTextField(
                        controller: logic.stationAddressCtrl,
                        keyboardType: TextInputType.text,
                        prefixIcon: Image.asset(
                            AppAssets.textFieldLocaionIcon, width: 24, height: 19).marginOnly(left: 22, right: 12, top: 4, bottom: 4),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(80),
                        ],
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Address is required.')]),
                        hintText: 'Enter Address',),
                      addHeight(16),

                      addText500('Do You Have GST?', fontSize: 14, color: AppColors.textColor1).marginOnly(bottom: 8),
                      Container(
                        height: 48,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          border: Border.all(
                            color: AppColors.containerBorderColor,
                          ),
                          boxShadow: [boxShadowTextField()],
                          // color: AppColors.whiteColor,
                        ),
                        child: Row(
                          children: [
                            build_pickUp_button(pickOption: logic.pickOption,button: 'yes', onTap: () {
                              logic.pickOption = 'yes';
                              logic.update();
                              // setState(() {});
                            }),
                            addWidth(24),
                            build_pickUp_button(pickOption: logic.pickOption,button: 'no', onTap: () {
                              logic.pickOption = 'no';
                              logic.update();
                              // setState(() {});
                            })
                          ],
                        ),

                      ),
                      addHeight(16),

                      if(logic.pickOption=='yes')
                      addText500('GST (Optional)', fontSize: 14, color: AppColors.textColor1).marginOnly(bottom: 8),
                      if(logic.pickOption=='yes')
                      CustomTextField(
                        controller: logic.stationGstNumberCtrl,
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(30),
                        ],
                        prefixIcon: Image.asset(
                            AppAssets.textFieldGstIcon, width: 19, height: 22).marginOnly(left: 22, right: 18, top: 4, bottom: 4),

                        hintText: 'Enter GST Number',),
                      if(logic.pickOption=='yes')
                      addHeight(16),


                      addText500('Owner Name (Optional)', fontSize: 14,
                          color: AppColors.textColor1).marginOnly(bottom: 8),
                      CustomTextField(
                        controller: logic.stationOwnerNameCtrl,
                        keyboardType: TextInputType.text,
                        prefixIcon: Image.asset(
                            AppAssets.textFieldUserIcon, width: 19, height: 22).marginOnly(left: 22, right: 18, top: 4, bottom: 4),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(25),
                        ],
                       /* validator: MultiValidator([
                          RequiredValidator(errorText: 'Owner Name is required.')]),*/
                        hintText: 'Enter Full Name',),
                      addHeight(16),

                      addText500('Email Address (Optional)', fontSize: 14, color: AppColors.textColor1).marginOnly(bottom: 8),
                      CustomTextField(
                        controller: logic.stationEmailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Image.asset(
                            AppAssets.textFieldMailIcon, width: 24, height: 19).marginOnly(left: 22, right: 12, top: 4, bottom: 4),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50),
                        ],
                        /*validator: MultiValidator([
                          RequiredValidator(errorText: 'Email is required.'),
                          EmailValidator(errorText: 'Enter valid email.')]),*/
                        hintText: 'Enter Email Address',),
                      addHeight(16),

                      addText500('Mobile Number', fontSize: 14, color: AppColors.textColor1).marginOnly(bottom: 8),
                      CustomTextField(
                        controller: logic.stationMobileNumberCtrl,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Mobile number is required.'),MinLengthValidator(10, errorText: 'Mobile number must be 10 digits long.'),]),
                        prefixIcon: Image.asset(AppAssets.indianFlag).marginOnly(
                            left: 14, right: 10, top: 4, bottom: 4),
                        hintText: 'Enter Mobile Number',),
                      addHeight(16),

                      addText500('Enter Password', fontSize: 14, color: AppColors.textColor1).marginOnly(bottom: 8),
                      CustomTextField(
                        controller: logic.stationPassCtrl,
                        keyboardType: TextInputType.text,
                        prefixIcon: Image.asset(
                            AppAssets.passwordLockIcon, width: 19, height: 22).marginOnly(left: 22, right: 18, top: 4, bottom: 4),

                        obscureText: logic.passObscure,
                        suffixIcon: GestureDetector(
                            onTap: (){
                              logic.onSuffixTap(isPass: true);
                            },
                            child: Image.asset(logic.passObscure==true?AppAssets.eyeCloseIcon:AppAssets.eyeOpenIcon, width: 29, height: 18).marginOnly(left: 22, right: 18, top: 4, bottom: 4)),
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Password is required.'),
                          MinLengthValidator(6, errorText: 'New Password must be 6 digits long.'),
                        ]),
                        hintText: 'Enter Password',),
                      addHeight(16),

                      addText500('Confirm password', fontSize: 14,
                          color: AppColors.textColor1).marginOnly(bottom: 8),
                      CustomTextField(
                        controller: logic.stationConfirmPassCtrl,
                        keyboardType: TextInputType.text,
                        prefixIcon: Image.asset(AppAssets.passwordLockIcon, width: 19, height: 22).marginOnly(left: 22, right: 18, top: 4, bottom: 4),
                        obscureText: logic.confirmPassObscure,
                        suffixIcon: GestureDetector(
                            onTap: (){
                              logic.onSuffixTap(isPass: false);
                            },
                            child: Image.asset(logic.confirmPassObscure==true?AppAssets.eyeCloseIcon:AppAssets.eyeOpenIcon, width: 29, height: 18).marginOnly(left: 22, right: 18, top: 4, bottom: 4)),
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Confirm Password is required.'),
                          MinLengthValidator(6, errorText: 'Confirm Password must be 6 digits long.'),
                        ]),
                        hintText: 'Enter Password',),
                      addHeight(20),

                      AppButton(
                          onButtonTap: () {
                            FocusScope.of(context).unfocus();
                            if(formKey.currentState?.validate()??false){
                              if(logic.stationPassCtrl.text != logic.stationConfirmPassCtrl.text){
                                CustomSnackBar().showErrorSnackBar(context,message: 'Passwords do not match');
                              }
                              else{
                              Future.microtask(() {
                                SignupVerifyOtpDialogue.show(context);
                              });}
                            }
                          },
                          buttonColor: AppColors.primaryColor,
                          buttonText: 'Register'),


                      addHeight(48),
                    ],
                  ).marginSymmetric(horizontal: 20)


                ],
              ),
            ),
          );
        }),
      ),
      bottomSheet: Container(
        height: 48,
        color: AppColors.whiteColor,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              addText400('You have an account? ', fontSize: 14,
                  color: AppColors.textColor1),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: addText600(
                      'Sign In', fontSize: 16, color: AppColors.primaryColor)),
            ],
          ),
        ),
      ),
    );
  }

  build_pickUp_button({String? pickOption, String? button, void Function()? onTap}) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                color: pickOption == button ? AppColors.primaryColor : AppColors
                    .whiteColor,
                shape: BoxShape.circle,
                border: Border.all(color: pickOption == button
                    ? AppColors.primaryLightColor
                    : AppColors.containerBorderColor)
            ),
          ),
        ), addWidth(8),
        addText500(
            '${button?.capitalize}', fontSize: 14, color: AppColors.textColor1)
      ],
    );
  }
}
