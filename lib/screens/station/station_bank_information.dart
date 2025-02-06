import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/controllers/car_station/station_bank_information_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';

import 'station_forgot_password_screen.dart';

class StationBankDetailScreen extends StatefulWidget {
  const StationBankDetailScreen({super.key});

  @override
  State<StationBankDetailScreen> createState() =>
      _StationBankDetailScreenState();
}

class _StationBankDetailScreenState extends State<StationBankDetailScreen> {

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
              children: [
                backButton(onTap: () {
                  Get.back();
                }),
                addWidth(60),
                addText600('Bank Information', fontSize: 18),


              ],
            ).marginSymmetric(horizontal: 20),
            addHeight(20),

            // Align(
            //     alignment: Alignment.center,
            //     child: Image.asset(AppAssets.newPasswordBg,width: 214,height: 182,)),
            // addHeight(24),

            Expanded(child: SingleChildScrollView(
              child: GetBuilder<StationBankInformationCtrl>(builder: (logic) {
                return Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addHeight(10),

                      addText500(
                          'Bank Name', fontSize: 14, color: AppColors.textColor1)
                          .marginOnly(bottom: 8),
                      CustomTextField(
                          controller: logic.bankNameCtrl,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(25),
                            TextInputFormatter.withFunction((oldValue, newValue) {
                              return newValue.copyWith(text: newValue.text.toUpperCase());})
                          ],
                          validator: MultiValidator([RequiredValidator(errorText: 'Bank Name is required.')]),
                          hintText: 'Bank Name'),
                      addHeight(16),

                      addText500('Account Holder Name', fontSize: 14,
                          color: AppColors.textColor1).marginOnly(bottom: 8),
                      CustomTextField(
                        controller: logic.accountHolderCtrl,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.characters,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(25),
                        ],
                        validator: MultiValidator([RequiredValidator(errorText: 'Account Holder Name is required.')]),
                        hintText: 'Account Holder Name',),
                      addHeight(16),

                      addText500('Account Number', fontSize: 14,
                          color: AppColors.textColor1).marginOnly(bottom: 8),
                      CustomTextField(
                          controller: logic.accountNumberCtrl,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: MultiValidator([RequiredValidator(errorText: 'Account Number is required.')]),
                          hintText: 'Account Number'),
                      addHeight(16),

                      addText500(
                          'IFSC Code', fontSize: 14, color: AppColors.textColor1)
                          .marginOnly(bottom: 8),
                      CustomTextField(
                          controller: logic.ifscCtrl,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(15),
    TextInputFormatter.withFunction((oldValue, newValue) {
    return newValue.copyWith(text: newValue.text.toUpperCase());})
                          ],
                          validator: MultiValidator([RequiredValidator(errorText: 'IFSC is required.')]),
                          hintText: 'IFSC Code'),
                      addHeight(16),


                      AppButton(
                          onButtonTap: () {
                            if(formKey.currentState?.validate()??false){

                            }
                          },
                          buttonColor: AppColors.primaryColor,
                          buttonText: 'Submit'),


                      addHeight(24),
                    ],
                  ),
                );
              }).marginSymmetric(horizontal: 20),
            ))


          ],
        ),
      ),
    );
  }
}
