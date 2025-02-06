import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/common_bottom_sheet/station_choose_profile_picture_bottom_sheet.dart';
import 'package:levicon_carwash/controllers/customer/customer_profile_creation_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/dialogues/customer/profile_creation_complete_dialogue.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/app_routers.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';

class CustomerProfileCreation extends StatefulWidget {
  const CustomerProfileCreation({super.key});

  @override
  State<CustomerProfileCreation> createState() =>
      _CustomerProfileCreationState();
}

class _CustomerProfileCreationState extends State<CustomerProfileCreation> {

  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: AppScreen(
        child: GetBuilder<CustomerProfileCreationCtrl>(builder: (logic) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addHeight(78),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addText500('Complete your profile', fontSize: 18,
                          color: AppColors.blackColor),
                      addText400(
                          'Let’s set up your profile to ensure a smoother booking experience.',
                          fontSize: 14, color: AppColors.textColor1),

                    ],
                  ),
                  addHeight(16),
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset(AppAssets.profileCreationCustomerBG, width: 214, height: 182)),
                  addHeight(24),

                  addText500('First Name', fontSize: 14, color: AppColors.textColor1).marginOnly(bottom: 8),
                  CustomTextField(
                    hintText: 'Enter First Name',
                    hintColor: AppColors.textFieldHintColor,
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                      LengthLimitingTextInputFormatter(25),
                    ],
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'First name is required.')
                    ]),
                  ),
                  addHeight(16),

                  addText500('Last Name', fontSize: 14, color: AppColors.textColor1).marginOnly(bottom: 8),
                  CustomTextField(
                    hintText: 'Enter Last Name',
                    hintColor: AppColors.textFieldHintColor,
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                      LengthLimitingTextInputFormatter(25),
                    ],
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Last name is required.')
                    ]),
                  ),
                  addHeight(16),

                  addText500('Email', fontSize: 14, color: AppColors.textColor1).marginOnly(bottom: 8),
                  CustomTextField(
                    hintText: 'Enter Email Address',
                    hintColor: AppColors.textFieldHintColor,
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(30),
                    ],
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Email address is required.'),
                      EmailValidator(errorText: 'Enter valid email.'),
                    ]),
                  ),
                  addHeight(16),


                  addText500('Upload Profile Photo', fontSize: 14,
                      color: AppColors.textColor1).marginOnly(bottom: 8),
                  if(logic.selectedImage!=null)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Stack(
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                                // shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: AppColors.redColor1),
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
                            child: null,
                          ),
                          Positioned(
                              top: 4,
                              right: 4,
                              child: GestureDetector(
                                  onTap: (){
                                    logic.selectedImage = null;
                                    logic.update();
                                  },
                                  child: Icon(Icons.cancel,color: AppColors.primaryColor)))
                        ],
                      ),
                    ).marginOnly(bottom: 8),

                  if(logic.selectedImage == null)
                  uploadButton(onTap: () {
                    ChooseProfilePictureBottomSheet.show(context, 'CustomerProfileCreation');
                  }),
                  addHeight(16),


                  AppButton(
                    buttonColor: AppColors.primaryColor,
                    buttonText: 'Submit', onButtonTap: () {
                    if(formKey.currentState?.validate()??false){
                      ProfileCreationSuccessDialog.show(context, onTap: () {
                        Get.offAllNamed(AppRoutes.addVehicleDetailCustomerScreen);

                        // Get.offAllNamed(AppRoutes.addVehicleCustomerScreen,
                        //     arguments: {'showSkip': true});
                      });
                    }
                  },),
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
