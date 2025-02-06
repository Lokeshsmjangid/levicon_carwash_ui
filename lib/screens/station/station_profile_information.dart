import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:levicon_carwash/common_bottom_sheet/station_choose_profile_picture_bottom_sheet.dart';
import 'package:levicon_carwash/controllers/car_station/station_profile_information_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';


class StationProfileInformationScreen extends StatefulWidget {
  const StationProfileInformationScreen({super.key});

  @override
  State<StationProfileInformationScreen> createState() =>
      _StationProfileInformationScreenState();
}

class _StationProfileInformationScreenState
    extends State<StationProfileInformationScreen> {

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
                addText600('Profile Information', fontSize: 18),
                backButton(isBackButton: false),


              ],
            ).marginSymmetric(horizontal: 20),
            addHeight(20),

            // Align(
            //     alignment: Alignment.center,
            //     child: Image.asset(AppAssets.newPasswordBg,width: 214,height: 182,)),
            // addHeight(24),

            Expanded(child: GetBuilder<StationProfileInformationCtrl>(builder: (logic) {
              return SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addHeight(10),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: (){ChooseProfilePictureBottomSheet.show(context, 'StationProfileInfo');},
                          child: Container(
                            height: 150,
                            width: 150,
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

                      addText500('Car Station Name', fontSize: 14,
                          color: AppColors.textColor1).marginOnly(bottom: 8),
                      CustomTextField(
                          controller: logic.stationNameCtrl,
                          keyboardType: TextInputType.text,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(40),
                          ],
                          validator: MultiValidator([RequiredValidator(errorText: 'Station Name is required.')]),
                          hintText: 'Enter Station'),
                      addHeight(16),

                      addText500('Station Address', fontSize: 14,
                          color: AppColors.textColor1).marginOnly(bottom: 8),
                      CustomTextField(
                        controller: logic.stationAddressCtrl,
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(40),
                        ],
                        validator: MultiValidator([RequiredValidator(errorText: 'Station Address is required.')]),
                        hintText: 'Enter Address',),
                      addHeight(16),

                      addText500('GST  (Optional)', fontSize: 14,
                          color: AppColors.textColor1).marginOnly(bottom: 8),
                      CustomTextField(
                          controller: logic.stationGstCtrl,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20),
                          ],
                          // validator: MultiValidator([RequiredValidator(errorText: 'GST Number is required.')]),
                          hintText: 'Enter GST Number'),
                      addHeight(16),

                      addText500('Owner Name (Optional)', fontSize: 14,
                          color: AppColors.textColor1).marginOnly(bottom: 8),
                      CustomTextField(
                          controller: logic.stationOwnerCtrl,
                          keyboardType: TextInputType.text,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(30),
                          ],
                          // validator: MultiValidator([RequiredValidator(errorText: 'GST Number is required.')]),
                          hintText: 'Enter Owner Name'),
                      addHeight(16),

                      addText500('Email Address (Optional)', fontSize: 14,
                          color: AppColors.textColor1).marginOnly(bottom: 8),
                      CustomTextField(
                          controller: logic.stationEmailCtrl,
                          keyboardType: TextInputType.emailAddress,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(40),
                          ],
                          hintText: 'Enter Email Address'),
                      addHeight(16),

                      addText500('Mobile Number', fontSize: 14,
                          color: AppColors.textColor1).marginOnly(bottom: 8),
                      CustomTextField(
                          controller: logic.stationMobileCtrl,
                          keyboardType: TextInputType.phone,
                          fillColor: AppColors.textColor3.withOpacity(0.18),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          readOnly: true,
                          onChanged: logic.onTextChanged,
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Mobile number is required.'),
                            MinLengthValidator(10, errorText: 'Mobile number must be 10 digits long.'),]),
                          hintText: 'Enter Mobile number'),
                      addHeight(16),

                      addText500(
                          'Password', fontSize: 14, color: AppColors.textColor1)
                          .marginOnly(bottom: 8),
                      CustomTextField(
                        controller: logic.stationPasswordCtrl,
                        keyboardType: TextInputType.text,
                        hintText: 'Enter Password',
                        obscureText: logic.visiblePassword,
                        readOnly: true,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(40),
                        ],
                        suffixIcon: GestureDetector(
                            onTap: logic.onTapPasswordSuffix,
                            child: Image.asset(logic.visiblePassword?AppAssets.eyeCloseIcon:AppAssets.eyeOpenIcon).marginAll(
                                12)),
                      ),
                      addHeight(16),

                      AppButton(
                          onButtonTap: () {
                            if(formKey.currentState?.validate()??false){}

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
