import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/controllers/car_station/station_create_new_password_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';
import 'package:levicon_carwash/custom_widgets/custom_snakebar.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/dialogues/car_station/password_change_done_dialogue.dart';
import 'package:levicon_carwash/dialogues/car_station/profile_creation_done_dialogue.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';

import 'station_forgot_password_screen.dart';

class StationCreateNewPasswordScreen extends StatefulWidget {
  const StationCreateNewPasswordScreen({super.key});

  @override
  State<StationCreateNewPasswordScreen> createState() =>
      _CustomerLoginScreenState();
}

class _CustomerLoginScreenState extends State<StationCreateNewPasswordScreen> {


  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.whiteColor,
      body: AppScreen(
        child: GetBuilder<StationCreateNewPasswordCtrl>(builder: (logic) {
          return Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addHeight(78),
                  addText500('Create a New Password to Secure Your Account.',
                      fontSize: 18),
                  addText500(
                      'Set a new password to keep your account safe. Ensure it\'s unique and easy for you to remember.',
                      fontSize: 13, color: AppColors.textColor1),

                  addHeight(26),

                  Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        AppAssets.newPasswordBg, width: 214, height: 182,)),
                  addHeight(24),

                  addText500('Enter New Password', fontSize: 14,
                      color: AppColors.textColor1).marginOnly(bottom: 8),
                  CustomTextField(
                    controller: logic.newPassCtrl,
                    keyboardType: TextInputType.text,
                    obscureText: logic.newPassObscure,
                    prefixIcon: Image.asset(
                        AppAssets.passwordLockIcon, width: 19, height: 22).marginOnly(left: 22, right: 18, top: 4, bottom: 4),
                    suffixIcon: GestureDetector(
                      onTap: (){
                        logic.onSuffixTap(isNewPass: true);
                      },
                      child: Image.asset(logic.newPassObscure?AppAssets.eyeCloseIcon:AppAssets.eyeOpenIcon, width: 29, height: 18).marginOnly(
                          left: 22, right: 18, top: 4, bottom: 4),
                    ),
                    hintText: 'Enter New Password',
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'New Password is required.'),
                      MinLengthValidator(6, errorText: 'New Password must be 6 digits long.'),
                    ]),
                  ),
                  addHeight(16),

                  addText500('Re-Enter New Password', fontSize: 14,
                      color: AppColors.textColor1).marginOnly(bottom: 8),
                  CustomTextField(
                    controller: logic.reNewPassCtrl,
                    keyboardType: TextInputType.text,
                    obscureText: logic.reNewPassObscure,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Confirm New Password is required.'),
                      MinLengthValidator(6, errorText: 'Confirm New Password must be 6 digits long.')],),
                    prefixIcon: Image.asset(
                        AppAssets.passwordLockIcon, width: 19, height: 22).marginOnly(left: 22, right: 18, top: 4, bottom: 4),
                    suffixIcon: GestureDetector(
                        onTap: (){
                          logic.onSuffixTap(isNewPass: false);
                        },
                        child: Image.asset(logic.reNewPassObscure?AppAssets.eyeCloseIcon:AppAssets.eyeOpenIcon, width: 29, height: 18).marginOnly(left: 22, right: 18, top: 4, bottom: 4)),
                    hintText: 'Re-Enter New Password'),
                  addHeight(20),

                  AppButton(
                      onButtonTap: () {
                        if(formKey.currentState!.validate()){
                          if(logic.newPassCtrl.text != logic.reNewPassCtrl.text){
                            CustomSnackBar().showErrorSnackBar(context,message: 'Passwords do not match');
                          } else{
                            Future.microtask(() {
                              PasswordChangeDoneDialog.show(context,onTap: (){
                                Get.back();
                              });
                            });
                          }
                        }
                      },
                      buttonColor: AppColors.primaryColor,
                      buttonText: 'Submit'),


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
