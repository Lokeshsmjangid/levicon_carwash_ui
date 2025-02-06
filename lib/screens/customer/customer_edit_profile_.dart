import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/common_bottom_sheet/station_choose_profile_picture_bottom_sheet.dart';
import 'package:levicon_carwash/controllers/customer/customer_edit_profile_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';
import 'package:levicon_carwash/custom_widgets/custom_snakebar.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/dialogues/car_station/contact_us_dialogue.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/custom_loader.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';


class CustomerEditProfileScreen extends StatefulWidget {
  const CustomerEditProfileScreen({super.key});

  @override
  State<CustomerEditProfileScreen> createState() =>
      _CustomerEditProfileScreenState();
}

class _CustomerEditProfileScreenState extends State<CustomerEditProfileScreen> {

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
                // addWidth(60),
                addText600('Edit Profile', fontSize: 18),
                backButton(isBackButton: false),


              ],
            ).marginSymmetric(horizontal: 20),
            addHeight(20),

            // Align(
            //     alignment: Alignment.center,
            //     child: Image.asset(AppAssets.newPasswordBg,width: 214,height: 182,)),
            // addHeight(24),

            Expanded(child: GetBuilder<CustomerEditProfileCtrl>(builder: (logic) {
              return SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addHeight(10),
                      Align(
                        alignment: Alignment.center,
                        child:  GestureDetector(
                          onTap: (){ChooseProfilePictureBottomSheet.show(context, 'CustomerEditProfile');},
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

                      addText500(
                          'Name', fontSize: 14, color: AppColors.textColor1)
                          .marginOnly(bottom: 8),
                      CustomTextField(
                          controller: logic.customerNameCtrl,
                          keyboardType: TextInputType.text,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(25),
                          ],
                          validator: MultiValidator([RequiredValidator(errorText: 'Name is required.')]),
                          hintText: 'Enter Name'),
                      addHeight(16),

                      addText500('Mobile number', fontSize: 14,
                          color: AppColors.textColor1).marginOnly(bottom: 8),
                      CustomTextField(
                          controller: logic.customerMobileCtrl,
                          keyboardType: TextInputType.phone,
                          readOnly: true,
                          fillColor: AppColors.textColor3.withOpacity(0.18),
                          hintText: 'Enter Mobile number'),
                      addHeight(16),

                      addText500('Email', fontSize: 14, color: AppColors.textColor1).marginOnly(bottom: 8),
                      CustomTextField(
                          controller: logic.customerEmailCtrl,
                          keyboardType: TextInputType.emailAddress,
                          readOnly: true,
                          fillColor: AppColors.textColor3.withOpacity(0.18),
                          hintText: 'Enter Email Address'),

                      addHeight(16),

                      AppButton(
                          onButtonTap: () {
                            if(formKey.currentState?.validate()??false){
                              showLoader(true);
                              Future.delayed(Duration(milliseconds: 1500),(){
                                CustomSnackBar().showSuccessSnackBar(context,message: 'Profile Edit Successfully.');
                                showLoader(false);
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
