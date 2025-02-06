import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';

class ContactUSDialog {
  static void show(BuildContext context,{void Function()? onTap}) {
    showDialog(
      context: context,
      barrierColor: AppColors.primaryColor.withOpacity(0.5),
      barrierDismissible: true,
      builder: (_) => ContactUSDialogWidget(onTap: onTap),
    );
  }
}

class ContactUSDialogWidget extends StatelessWidget {
  void Function()? onTap;

  ContactUSDialogWidget({this.onTap});


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
              // border: Border.all(color: AppColors.containerBorderColor),
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(30), // Set the border radius
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                addHeight(20),
                Image.asset(AppAssets.profileReadyImage,height: 80,width: 80,).marginAll(15),

                addText600('Thank You for Getting in Touch!',textAlign:TextAlign.center,fontSize: 18,color: AppColors.blackColor).marginSymmetric(horizontal: 20),
                addText500('Your message has been successfully sent. Our team will review your request and get back to you shortly',
                    fontSize: 12,textAlign: TextAlign.center,color: AppColors.blackColor).marginSymmetric(horizontal: 20),

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
