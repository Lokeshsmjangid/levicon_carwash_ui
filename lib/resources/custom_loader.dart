
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'app_assets.dart';
import 'app_color.dart';


// Loader using getx
  showLoader(bool show) {
  if (show) {
    Get.dialog(
        barrierDismissible: false,
        WillPopScope(
          onWillPop: () async {
            // Return false to prevent the dialog from closing on back button press
            return false;
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                    shape: BoxShape.circle
                  ),
                  child: ClipRRect(child: Lottie.asset('assets/car-wash (6).json'))),
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  // color: AppColors.primaryColor,
                  // borderRadius: BorderRadius.circular(4.0),
                  shape: BoxShape.circle,
                  // image: DecorationImage(image: AssetImage(AppAssets.commonLogo)),
                ),
                child: CircularProgressIndicator(color: AppColors.primaryColor,strokeWidth: 2,).marginAll(1),
              ),
            ],
          ),
        ));
  } else {
    Get.back();
  }
}


