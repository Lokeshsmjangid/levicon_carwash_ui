import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';

class ProfileCreationDoneDialog {
  static void show(BuildContext context,{void Function()? onTap}) {
    showDialog(
      context: context,
      barrierColor: AppColors.primaryColor.withOpacity(0.5),
      barrierDismissible: false,
      builder: (_) => ProfileCreationDoneDialogWidget(onTap: onTap),
    );
  }
}

class ProfileCreationDoneDialogWidget extends StatelessWidget {
  void Function()? onTap;

  ProfileCreationDoneDialogWidget({this.onTap});


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // false if disable device button
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          backgroundColor: Colors.transparent,
          surfaceTintColor: AppColors.whiteColor,
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.symmetric( horizontal: 10,vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.containerBorderColor),
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(30), // Set the border radius
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                addHeight(20),
                Image.asset(AppAssets.profileReadyImage,height: 80,width: 80,).marginAll(15),

                addText500('We Have Received Your Profile!',textAlign:TextAlign.center,fontSize: 20,color: AppColors.blackColor).marginSymmetric(horizontal: 20),
                addText500('Thank you for submitting your profile. Our team is reviewing it, and you will be notified once your profile is either approved or rejected. This process typically takes 24-48 hours.',
                    fontSize: 14,textAlign: TextAlign.center,color: AppColors.textColor1).marginSymmetric(horizontal: 20),

                addHeight(16),
                doneButton(onTap: onTap),


                addHeight(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
  doneButton({void Function()? onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 40,maxWidth: 100),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(100)),
        child: Center(child: addText500('Done',fontSize: 18,color: AppColors.whiteColor)),
      ),
    );
  }
}
