import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/controllers/customer/customer_login_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';
import 'package:levicon_carwash/custom_widgets/custom_snakebar.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/app_routers.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/screens/about_us_screen.dart';

import 'customer_verify_otp.dart';

class CustomerLoginScreen extends StatefulWidget {
  const CustomerLoginScreen({super.key});

  @override
  State<CustomerLoginScreen> createState() => _CustomerLoginScreenState();
}

class _CustomerLoginScreenState extends State<CustomerLoginScreen> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.whiteColor,
      body: AppScreen(
        child: GetBuilder<CustomerLoginCtrl>(builder: (logic) {
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

                  addText500('Enter Phone Number', fontSize: 14,
                      color: AppColors.textColor1).marginOnly(bottom: 8),

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
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(AppAssets.indianFlag).marginOnly(
                            left: 14, right: 6, top: 4, bottom: 4),
                        addText500(logic.countryCode, fontSize: 14, color: AppColors
                            .textColor1),
                        const VerticalDivider(color: AppColors
                            .containerBorderColor, thickness: 1.0,)
                      ],
                    ),
                    hintText: 'XXXXXXXXXX',),
                  addHeight(16),
                  Row(
                    children: [

                      GestureDetector(
                        onTap: () {
                          if(logic.mobileCtrl.text.isNotEmpty){
                            logic.termsCondition = !logic.termsCondition;
                            logic.update();
                          } else{
                            CustomSnackBar().showErrorSnackBar(context,message: 'Enter your mobile number');
                          }
                        },
                        child: Container(
                          height: 18,
                          width: 18,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: logic.termsCondition
                                  ? AppColors.primaryColor
                                  : AppColors.textColor2
                          ),
                          child: logic.termsCondition
                              ? Center(child: Icon(
                            Icons.check, size: 16, color: AppColors.whiteColor,))
                              : null,
                        ),
                      ),
                      addWidth(6),
                      addText400('I agree to ', fontSize: 14, color: AppColors.textColor1),
                      InkWell(
                          onTap: (){
                            Get.to(()=>AboutUsScreen(barTitle: 'Terms & Conditions'));
                          },
                          child: addText500('Terms & Conditions', fontSize: 14, color: AppColors.textColor1, decoration: TextDecoration.underline)),
                    ],
                  ),

                  addHeight(20),
                  AppButton(
                      onButtonTap: logic.termsCondition ? () {
                        if(formKey.currentState!.validate()){
                          Get.toNamed(AppRoutes.verifyOtpCustomer,arguments: {
                            'country_code':logic.countryCode,
                            'mobile_number':logic.mobileCtrl.text
                          });
                        }

                      } : () {},
                      buttonColor: logic.termsCondition
                          ? AppColors.primaryColor
                          : AppColors.buttonDisableColor,
                      buttonText: 'Request OTP'),
                  addHeight(20),


                ],
              ).marginSymmetric(horizontal: 20),
            ),
          );
        }),
      ),
    );
  }
}
