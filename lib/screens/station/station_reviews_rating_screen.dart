import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/dialogues/car_station/contact_us_dialogue.dart';
import 'package:levicon_carwash/dialogues/car_station/password_change_done_dialogue.dart';
import 'package:levicon_carwash/dialogues/car_station/profile_creation_done_dialogue.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';

import 'station_forgot_password_screen.dart';

class StationReviewsRatingScreen extends StatefulWidget {
  const StationReviewsRatingScreen({super.key});

  @override
  State<StationReviewsRatingScreen> createState() => _StationReviewsRatingScreenState();
}

class _StationReviewsRatingScreenState extends State<StationReviewsRatingScreen> {


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

                addText600('Reviews and Ratings', fontSize: 18),

                backButton(isBackButton: false),


              ],
            ).marginSymmetric(horizontal: 20),
            addHeight(20),

            Expanded(child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addHeight(10),

                  Container(

                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.containerBorderColor),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  addText400('Total Rating',fontSize: 18,color: AppColors.blackColor),
                                  addHeight(8),
                                  Row(
                                    children: [
                                      Image.asset(AppAssets.starIcon,height: 14,width: 14).marginOnly(right: 4),
                                      addText500('5.9',fontSize: 16,color: AppColors.blackColor),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const VerticalDivider(color: AppColors.containerBorderColor,indent: 0,endIndent: 0.0,thickness: 1,),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  addText400('Total Reviews',fontSize: 18,color: AppColors.blackColor),
                                  addHeight(8),
                                  Row(
                                    children: [
                                      Image.asset(AppAssets.reviewsImage,height: 22,width: 22).marginOnly(right: 4),
                                      addText500('10k+',fontSize: 16,color: AppColors.blackColor),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


                  // Withdrawal History
                  addHeight(16),
                  addText500('All Reviews',fontSize: 16,color: AppColors.blackColor).marginOnly(bottom: 8),
                  ...List.generate(20, (index){
                    return build_text_tile(title: 'James Anderson');
                  })
                ],
              ).marginSymmetric(horizontal: 20),
            ))



          ],
        ),
      ),
    );
  }
  build_text_tile({ String? title,bool upperBorder = false,bool lowerBorder = false,void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primaryLightColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Row(
              children: [
            
                // Divider(height: 0,),
                Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        color: Color(0xffD0E1EA),
                        shape: BoxShape.circle
                    ),
                    child: Image.asset(AppAssets.personImage)),
                addWidth(10),
                addText500(title!.capitalize.toString(),fontSize: 14,color: AppColors.blackColor),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.starIcon,height: 13,width: 13).marginOnly(right: 4),
                      addText400('4.0',fontSize: 13,color: AppColors.blackColor),
                    ],
                  ).marginSymmetric(horizontal: 12,vertical: 2),
                )
              ],
            ),
            addHeight(8),
            addText400('Absolutely loved their service! The team was punctual, and they used eco-friendly products that left my car sparkling clean. ',
                fontSize: 12,color: AppColors.blackColor)
          ],
        ),
      ).marginOnly(bottom: 12),
    );

  }
}
