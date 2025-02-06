import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart'; // Ensure you have GetX installed if you're using it

class DeleteAccountConfirmationBottomSheet {
  static void show(BuildContext context, {VoidCallback? onDelete}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: AppColors.primaryColor.withOpacity(0.5),
      backgroundColor: Colors.transparent,
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
                    addHeight(20),
                    Image.asset(AppAssets.deleteVehicle,height: 60,width: 60,),
                    addHeight(4),
                    addText500('Are you sure  you want to delete your vehicle?', fontSize: 22,textAlign: TextAlign.center,height: 1.2),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: onDelete,
                          child: Container(
                            decoration: BoxDecoration(color: AppColors.primaryColor,borderRadius: BorderRadius.circular(25)),
                            child: addText500('Delete',fontSize: 14,color: AppColors.whiteColor).marginSymmetric(horizontal: 14,vertical: 4),
                          ),
                        ),addWidth(10),
                        GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: Container(

                            decoration: BoxDecoration(color: AppColors.blackColor,borderRadius: BorderRadius.circular(25)),
                            child: addText500('No',fontSize: 14,color: AppColors.whiteColor).marginSymmetric(horizontal: 14,vertical: 4),
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






