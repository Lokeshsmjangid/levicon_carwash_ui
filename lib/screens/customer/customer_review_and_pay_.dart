import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/dialogues/car_station/contact_us_dialogue.dart';
import 'package:levicon_carwash/dialogues/customer/customer_booking_success_dialogue.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';


class CustomerReviewPayScreen extends StatefulWidget {
  const CustomerReviewPayScreen({super.key});

  @override
  State<CustomerReviewPayScreen> createState() => _CustomerReviewPayScreenState();
}

class _CustomerReviewPayScreenState extends State<CustomerReviewPayScreen> {






  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        // resizeToAvoidBottomInset: true,
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
                  // addWidth(60),
                  addText600('Review & Pay', fontSize: 18),
                  backButton(isBackButton: false),



                ],
              ).marginSymmetric(horizontal: 20),
              addHeight(4),

              Expanded(
                  child: SingleChildScrollView(
                child: Column(

                  children: [
                    addHeight(10),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          // image: DecorationImage(image: AssetImage(AppAssets.profilePicture))
                        ),
                        child: Image.asset(AppAssets.profilePicture),
                      ),
                    ),
                    addHeight(20),

                    addText500('Shine Bright Auto', fontSize: 18,
                        color: AppColors.blackColor),
                    addWidth(14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            AppAssets.locationNewIcon, width: 20, height: 20),
                        addWidth(4),
                        addText400('Pune, India', fontSize: 13,
                            color: AppColors.textColor1)
                      ],
                    ),


                    addHeight(24),

                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.containerBorderColor),
                          borderRadius: BorderRadius.circular(14)
                      ),
                      padding: const EdgeInsets.all(14),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          addText500('Date and Time', fontSize: 15,
                              color: AppColors.textColor1).marginOnly(
                              bottom: 4),
                          Row(
                            children: [
                              Row(

                                children: [
                                  Image.asset(AppAssets.calenderIcon, width: 20,
                                      height: 20),
                                  addWidth(4),
                                  addText500('02/02/2025', fontSize: 15,
                                      color: AppColors.textColor3)
                                ],
                              ),
                              addWidth(16),
                              Row(

                                children: [
                                  Image.asset(AppAssets.clockIcon, width: 20,
                                      height: 20),
                                  addWidth(4),
                                  addText500('12:50am', fontSize: 15,
                                      color: AppColors.textColor3)
                                ],
                              ),
                            ],
                          ),

                          // location
                          addHeight(16),
                          addText500('Location', fontSize: 15,
                              color: AppColors.textColor1).marginOnly(
                              bottom: 4),
                          Row(
                            children: [
                              Image.asset(AppAssets.locationIcon, width: 20,
                                  height: 20),
                              addWidth(4),
                              addText500('Banglore', fontSize: 15,
                                  color: AppColors.textColor3)
                            ],
                          ),

                          // Services

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                addHeight(16),
                                addText500('Service', fontSize: 15,
                                    color: AppColors.textColor1).marginOnly(
                                    bottom: 4),
                                Row(
                                  children: [
                                    Image.asset(AppAssets.basicWashIcon, width: 20,
                                        height: 20),
                                    addWidth(4),
                                    addText500('Basic wash', fontSize: 15,
                                        color: AppColors.textColor3)
                                  ],
                                ),
                              ],
                            ),




                        ],
                      ),
                    ).marginSymmetric(horizontal: 20),

                    addHeight(16),


                    // payment
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.containerBorderColor),
                          borderRadius: BorderRadius.circular(14)
                      ),
                      padding: const EdgeInsets.all(14),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          addText500('Charges', fontSize: 15,
                              color: AppColors.blackColor).marginOnly(
                              bottom: 12),

                          build_text_tile(title: 'Subtotal Charges',subtitle: '₹2000'),
                          addHeight(8),
                          build_text_tile(title: 'Platform Charges(10% )',subtitle: '₹200'),
                          addHeight(8),
                          build_text_tile(title: 'Gst(18%)',subtitle: '₹300'),
                          addHeight(10),

                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.primaryLightColor,
                                borderRadius: BorderRadius.circular(500)
                            ),
                            padding: const EdgeInsets.only(left: 14,right: 14,top: 6,bottom: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                addText500('Total Amount', fontSize: 15, color: AppColors.textColor1),
                                addText500('₹2500', fontSize: 15, color: AppColors.textColor1)
                              ],
                            ),

                          ),
                        ],
                      ),
                    ).marginSymmetric(horizontal: 20),




                    addHeight(70),

                  ],
                ),
              )),





            ],
          ),
        ),
        bottomSheet: Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(color:AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10000)
          ),
          padding: const EdgeInsets.only(left: 24,right: 24),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  addText500('Total Amount', fontSize: 15, color: AppColors.whiteColor,height: 0),
                  addText500('₹2500', fontSize: 18, color: AppColors.whiteColor,height: 0)
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: (){
                  CustomerBookingSuccessDialog.show(context,onTap: (){
                    Get.back();
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(500)
                  ),
                  child: addText500('Checkout',fontSize: 15,color: AppColors.primaryColor).marginSymmetric(horizontal: 16,vertical: 10),
                ),
              )
            ],
          ),
        ),

      ),
    );
  }


  build_text_tile({String? title,String? subtitle,void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          addText400(title!.capitalize.toString(),fontSize: 14,color: AppColors.textColor1),
          Spacer(),
          addText400(subtitle!.capitalize.toString(),fontSize: 14,color: AppColors.textColor1)
        ],
      ),
    );

  }
}
