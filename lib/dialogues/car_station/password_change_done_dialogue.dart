import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';

class PasswordChangeDoneDialog {
  static void show(BuildContext context,{void Function()? onTap}) {
    showDialog(
      context: context,
      barrierColor: AppColors.primaryColor.withOpacity(0.5),
      barrierDismissible: true,
      builder: (_) => PasswordChangeDoneDialogWidget(onTap: onTap),
    );
  }
}

class PasswordChangeDoneDialogWidget extends StatelessWidget {
  void Function()? onTap;

  PasswordChangeDoneDialogWidget({this.onTap});


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true, // false if disable device button
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

                addText500('Password Changed Successfully',textAlign:TextAlign.center,fontSize: 20,color: AppColors.blackColor).marginSymmetric(horizontal: 20),
                // addText500('Thank you for completing your profile. You’re all set to book your first car wash with Levicon!',
                //     fontSize: 14,textAlign: TextAlign.center,color: AppColors.textColor1).marginSymmetric(horizontal: 20),

                addHeight(10),
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
        constraints: const BoxConstraints(maxHeight: 40,maxWidth: 150),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(100)),
        child: Center(child: addText500('Done',fontSize: 18,color: AppColors.whiteColor)),
      ),
    );
  }
}
