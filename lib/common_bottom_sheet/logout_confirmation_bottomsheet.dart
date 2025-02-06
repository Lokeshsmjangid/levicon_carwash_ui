import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart'; // Ensure you have GetX installed if you're using it

class LogoutConfirmationBottomSheet {
  static void show(BuildContext context, {VoidCallback? onLogout}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: AppColors.primaryColor.withOpacity(0.5),
      backgroundColor: Colors.transparent, // Make background transparent for blur effect
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.3,
          minChildSize: 0.3,
          maxChildSize: 0.8,
          builder: (BuildContext context, ScrollController scrollController) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Image.asset(AppAssets.logoutAccount, height: 60, width: 60),
                    const SizedBox(height: 4),
                    addText500('Are you sure you want to logout your account?', fontSize: 22, textAlign: TextAlign.center, height: 1.2),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: onLogout,
                          child: Container(
                            decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(25)),
                            child: addText500('Logout', fontSize: 14, color: AppColors.whiteColor).marginSymmetric(horizontal: 14, vertical: 4),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Get.back(); // Close the bottom sheet
                          },
                          child: Container(
                            decoration: BoxDecoration(color: AppColors.blackColor, borderRadius: BorderRadius.circular(25)),
                            child:
                            addText500('No', fontSize: 14, color: AppColors.whiteColor).marginSymmetric(horizontal: 14, vertical: 4),
                          ),
                        ),
                      ],
                    ).marginOnly(top: 10),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
