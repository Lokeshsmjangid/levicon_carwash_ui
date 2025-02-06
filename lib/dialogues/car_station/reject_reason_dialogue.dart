import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';

class RejectReasonDialog {
  static void show(BuildContext context,{void Function()? onTap}) {
    showDialog(
      context: context,
      barrierColor: AppColors.primaryColor.withOpacity(0.5),
      barrierDismissible: true,
      builder: (_) => RejectReasonDialogWidget(onTap: onTap),
    );
  }
}

class RejectReasonDialogWidget extends StatelessWidget {
  void Function()? onTap;

  RejectReasonDialogWidget({this.onTap});


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true, // false if disable device button
      /*child: Dialog(
        backgroundColor: Colors.transparent,
        surfaceTintColor: AppColors.whiteColor,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.symmetric( horizontal: 18,vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.containerBorderColor),
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(30), // Set the border radius
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              addHeight(14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  addText600('Reject Reason',fontSize: 18,color: AppColors.blackColor),
                  Image.asset(AppAssets.closeIcon,height: 18,width: 18,color: AppColors.blackColor,),
                ],
              ),
              CustomTextField(hintText: 'Enter Reason',maxLines: 6,).marginSymmetric(vertical: 16),

              AppButton(buttonText: 'Submit'),
              addHeight(14),
            ],
          ),
        ),
      ),*/
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          backgroundColor: Colors.transparent,
          surfaceTintColor: AppColors.whiteColor,
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.symmetric( horizontal: 18,vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.containerBorderColor),
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(30), // Set the border radius
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                addHeight(14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addText600('Reject Reason',fontSize: 18,color: AppColors.blackColor),
                    GestureDetector(
                        onTap: (){Get.back();},
                        child: Image.asset(AppAssets.closeIcon,height: 18,width: 18,color: AppColors.blackColor,)),
                  ],
                ),
                CustomTextField(hintText: 'Enter Reason',maxLines: 6,).marginSymmetric(vertical: 16),

                AppButton(buttonText: 'Submit'),
                addHeight(14),
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
