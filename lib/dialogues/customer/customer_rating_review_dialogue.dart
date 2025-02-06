import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';

class CustomerRatingReviewDialog {
  static void show(BuildContext context,{void Function()? onTap}) {
    showDialog(
      context: context,
      barrierColor: AppColors.primaryColor.withOpacity(0.5),
      barrierDismissible: true,
      builder: (_) => CustomerRatingReviewDialogWidget(onTap: onTap),
    );
  }
}

class CustomerRatingReviewDialogWidget extends StatelessWidget {
  void Function()? onTap;

  CustomerRatingReviewDialogWidget({this.onTap});


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
            padding: const EdgeInsets.symmetric( horizontal: 18,vertical: 10),
            decoration: BoxDecoration(
              // border: Border.all(color: AppColors.containerBorderColor),
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(30), // Set the border radius
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                addHeight(14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    backButton(onTap: (){Get.back();}),
                    addWidth(8),
                    addText600('Add Review and Ratings',fontSize: 18,color: AppColors.blackColor),
                    // Image.asset(AppAssets.closeIcon,height: 18,width: 18,color: AppColors.blackColor,),
                  ],
                ),
                addHeight(8),
                RatingBar.builder(
                  initialRating: 2.0,
                  unratedColor: AppColors.containerBorderColor,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  glow: false,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Image.asset(AppAssets.starIcon,height: 16,width: 16,color: const Color(0xffFF9F04)),
                  onRatingUpdate: (rating) {

                  },
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: addText500('Add review',fontSize: 13).marginOnly(bottom: 8,top: 16)),
                const CustomTextField(
                    fillColor: AppColors.whiteColor,
                    hintText: 'Enter Comment',maxLines: 4),

                addHeight(20),

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
