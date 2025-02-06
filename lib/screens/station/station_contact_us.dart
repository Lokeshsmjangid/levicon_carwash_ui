import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/controllers/car_station/station_contact_us_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/dialogues/car_station/contact_us_dialogue.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';

import 'station_forgot_password_screen.dart';

class StationContactUsScreen extends StatefulWidget {
  const StationContactUsScreen({super.key});

  @override
  State<StationContactUsScreen> createState() => _StationContactUsScreenState();
}

class _StationContactUsScreenState extends State<StationContactUsScreen> {

  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.whiteColor,
      body: AppScreen(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            addHeight(52),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                backButton(onTap: () {
                  Get.back();
                }),

                addText600('Contact Us', fontSize: 18),
                backButton(isBackButton: false),


              ],
            ).marginSymmetric(horizontal: 20),
            addHeight(20),
            addText500('Get in Touch', fontSize: 18).marginSymmetric(
                horizontal: 20),

            // Align(
            //     alignment: Alignment.center,
            //     child: Image.asset(AppAssets.newPasswordBg,width: 214,height: 182,)),
            // addHeight(24),

            Expanded(child: GetBuilder<StationContactUsCtrl>(builder: (logic) {
              return SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addHeight(10),

                      addText500(
                          'First Name', fontSize: 14, color: AppColors.textColor1)
                          .marginOnly(bottom: 8),
                      CustomTextField(
                        controller: logic.firstNameCtrl,
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                            LengthLimitingTextInputFormatter(40),
                          ],
                        validator: MultiValidator([RequiredValidator(errorText: 'First Name is required.')]),
                        hintText: 'Enter First Name',),
                      addHeight(16),

                      addText500(
                          'Last Name', fontSize: 14, color: AppColors.textColor1)
                          .marginOnly(bottom: 8),
                      CustomTextField(
                        controller: logic.lastNameCtrl,
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(40),
                        ],
                        validator: MultiValidator([RequiredValidator(errorText: 'Last Name is required.')]),
                        hintText: 'Enter Last Name',),
                      addHeight(16),

                      addText500(
                          'Email Id', fontSize: 14, color: AppColors.textColor1)
                          .marginOnly(bottom: 8),
                      CustomTextField(
                        keyboardType: TextInputType.emailAddress,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(40),
                        ],
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Email is required.'),
                        EmailValidator(errorText: 'Enter valid email')
                        ]),
                        hintText: 'Enter Your Email',),
                      addHeight(16),

                      addText500('Phone Number', fontSize: 14,
                          color: AppColors.textColor1).marginOnly(bottom: 8),
                      CustomTextField(
                        controller: logic.mobileNumberCtrl,
                        keyboardType: TextInputType.phone,
                        onChanged: logic.onTextChanged,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Mobile number is required.'),
                          MinLengthValidator(10, errorText: 'Mobile number must be 10 digits long.'),]),
                        prefixIcon: Image.asset(AppAssets.indianFlag).marginOnly(
                            left: 14, right: 10, top: 4, bottom: 4),
                        hintText: 'Enter Mobile Number',),
                      addHeight(16),

                      addText500(
                          'Message', fontSize: 14, color: AppColors.textColor1)
                          .marginOnly(bottom: 8),
                      CustomTextField(
                        controller: logic.commentCtrl,
                        keyboardType: TextInputType.text,
                        hintText: '',
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Message is required.')
                        ]),
                        maxLines: 5,
                      ),
                      addHeight(16),


                      AppButton(
                          onButtonTap: () {
                            if(formKey.currentState?.validate()??false){
                              Future.microtask(() {
                                ContactUSDialog.show(context, onTap: () {
                                  Get.back();
                                });
                              });
                            }
                          },
                          buttonColor: AppColors.primaryColor,
                          buttonText: 'Submit'),


                      addHeight(24),
                    ],
                  ).marginSymmetric(horizontal: 20),
                ),
              );
            }))


          ],
        ),
      ),
    );
  }
}
