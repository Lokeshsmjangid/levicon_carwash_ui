import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/controllers/car_station/station_login_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/custom_snakebar.dart';
import 'station_create_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'station_forgot_password_screen.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/screens/deshboard_screen.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';


class StationLoginScreen extends StatefulWidget {
  const StationLoginScreen({super.key});

  @override
  State<StationLoginScreen> createState() => _CustomerLoginScreenState();
}

class _CustomerLoginScreenState extends State<StationLoginScreen> {

  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.whiteColor,
      body: AppScreen(
        child: GetBuilder<StationLoginCtrl>(builder: (logic) {
          return Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addHeight(78),
                  addText500('Login Account', fontSize: 18),
                  addHeight(26),

                  Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        AppAssets.loginImg, width: 214, height: 182,)),
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
                      RequiredValidator(errorText: 'Mobile number is required.'),MinLengthValidator(10, errorText: 'Mobile number must be 10 digits long.'),]),
                    prefixIcon: Image.asset(AppAssets.indianFlag).marginOnly(
                        left: 14, right: 10, top: 4, bottom: 4),
                    hintText: 'Enter Mobile Number',),
                  addHeight(16),

                  addText500(
                      'Password', fontSize: 14, color: AppColors.textColor1)
                      .marginOnly(bottom: 8),
                  CustomTextField(
                    controller: logic.passwordCtrl,
                    keyboardType: TextInputType.text,
                    obscureText: logic.obscurePass,
                    prefixIcon: Image.asset(
                        AppAssets.passwordLockIcon, width: 19, height: 22).marginOnly(left: 22, right: 18, top: 4, bottom: 4),
                    suffixIcon: GestureDetector(
                      onTap: (){
            logic.onTapSuffix();
            },
              child: Image.asset(logic.obscurePass?AppAssets.eyeCloseIcon:AppAssets.eyeOpenIcon, width: 29, height: 18).marginOnly(left: 22, right: 18, top: 4, bottom: 4),
                    ),
                    hintText: 'Enter Password',
                    validator: MultiValidator([RequiredValidator(errorText: 'Password is required.')]),
                  ),
                  addHeight(16),
                  Row(
                    children: [

                      GestureDetector(
                        onTap: () {
                          logic.rememberMe = !logic.rememberMe;
                          logic.update();
                        },
                        child: Container(
                          height: 18,
                          width: 18,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: logic.rememberMe
                                  ? AppColors.primaryColor
                                  : AppColors.textColor2
                          ),
                          child: logic.rememberMe
                              ? const Center(child: Icon(
                            Icons.check, size: 16, color: AppColors.whiteColor,))
                              : null,
                        ),
                      ),
                      addWidth(6),
                      addText400('Remember me', fontSize: 14,
                          color: AppColors.textColor1),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            Get.to(() => const StationForgotPasswordScreen());
                          },
                          child: addText400(
                              'Forgot Password?', fontSize: 14, color: AppColors
                              .primaryColor)),
                    ],
                  ),

                  addHeight(20),
                  AppButton(
                      onButtonTap: () {
                        if(formKey.currentState!.validate()){
                          Get.offAll(() => DashBoardScreen());
                        }
                      },
                      buttonColor: AppColors.primaryColor,
                      buttonText: 'Login'),
                  // addHeight(70),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //
                  //     addText400('Don’t have an account? ',fontSize: 14,color: AppColors.textColor1),
                  //     addText600('Sign up',fontSize: 16,color: AppColors.primaryColor),
                  //   ],
                  // ),

                  addHeight(56),


                ],
              ).marginSymmetric(horizontal: 20),
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

              addText400('Don’t have an account? ', fontSize: 14,
                  color: AppColors.textColor1),
              GestureDetector(
                  onTap: () {
                    Get.to(() => StationSignUpScreen());
                  },
                  child: addText600(
                      'Sign up', fontSize: 16, color: AppColors.primaryColor)),
            ],
          ),
        ),
      ),
    );
  }
}
