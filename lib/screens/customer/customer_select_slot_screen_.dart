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

import 'customer_review_and_pay_.dart';


class CustomerSelectSlotScreen extends StatefulWidget {
  const CustomerSelectSlotScreen({super.key});

  @override
  State<CustomerSelectSlotScreen> createState() => _CustomerSelectSlotScreenState();
}

class _CustomerSelectSlotScreenState extends State<CustomerSelectSlotScreen> {
  String pickOption = 'delivery';
  String? selectedTimeSlot; // for single selection
  List timeSlots = [
  '08:00 AM',
  '09:00 AM',
  '10:00 AM',
  '11:00 AM',
  '12:00 PM',
  '01:00 PM',
  '02:00 PM',
  '03:00 PM',
  '04:00 PM',
  '05:00 PM',
  '06:00 PM',
  '07:00 PM',
  '08:00 PM',
  ];
  Set<String> selectedTimeSlots = {}; // for multiple selection


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
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
                  addText600('Select Slot', fontSize: 18),
                  backButton(isBackButton: false),



                ],
              ).marginSymmetric(horizontal: 20),
              addHeight(20),

              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    addHeight(10),

                    addText500('Pickup Options', fontSize: 14,
                        color: AppColors.blackColor).marginSymmetric(horizontal: 20),
                    addHeight(8),
                    Container(
                      height: 48,
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        border: Border.all(
                          color: AppColors.containerBorderColor,
                        ),
                        boxShadow: [boxShadowTextField()],
                        // color: AppColors.whiteColor,
                      ),
                      child: Row(
                        children: [
                          build_pickUp_button(button: 'self',onTap: (){
                            pickOption='self';setState(() {});
                          }),
                          addWidth(24),
                          build_pickUp_button(button: 'delivery',onTap: (){pickOption='delivery';setState(() {});})
                        ],
                      ),

                    ).marginSymmetric(horizontal: 20),


                    addHeight(8),
                    Container(
                      height: 48,
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        border: Border.all(
                          color: AppColors.containerBorderColor,
                        ),
                        boxShadow: [boxShadowTextField()],
                        // color: AppColors.whiteColor,
                      ),
                      child: Row(
                        children: [

                              addText600('Service at Friends house -',fontSize: 13,color: AppColors.blackColor),

                          addText400('rajhome',fontSize: 13,color: AppColors.blackColor)
                        ],
                      ),

                    ).marginSymmetric(horizontal: 20),
                    addHeight(20),


                    addText500('Select the start time for book service',fontSize: 16,color: AppColors.blackColor).marginSymmetric(horizontal: 20),
                    addText400('Your service will take approximately 55 minutes',fontSize: 12,color: AppColors.blackColor).marginSymmetric(horizontal: 20),

                      addHeight(10),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height*0.5,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // Number of columns
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                            childAspectRatio: 2.5, // Aspect ratio for the time slot buttons
                          ),
                          itemCount: timeSlots.length,
                          itemBuilder: (context, index) {
                            final timeSlot = timeSlots[index];
                            final isSelected = timeSlot == selectedTimeSlot; // for single selection
                            // final isSelected = selectedTimeSlots.contains(timeSlot); // for multiple selection

                            return GestureDetector(
                              onTap: () {
                                setState(() { // for single selection
                                  selectedTimeSlot = timeSlot;
                                });

                                // setState(() {  for multiple selection
                                //   if (isSelected) {
                                //     selectedTimeSlots.remove(timeSlot); // Deselect if already selected
                                //   } else {
                                //     selectedTimeSlots.add(timeSlot); // Select if not selected
                                //   }
                                // });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: isSelected ? AppColors.primaryColor : null,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: AppColors.containerBorderColor,
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    boxShadow()
                                  ],
                                ),
                                child: addText500(
                                  timeSlot,
                                  fontSize: 15,
                                  color: isSelected ? AppColors.whiteColor : AppColors.blackColor,
                                ),
                              ),
                            );
                          },
                        ),
                      ).marginSymmetric(horizontal: 20),

                    addHeight(20),
                    AppButton(buttonText: 'Book',onButtonTap: (){
                      Get.to(()=>const CustomerReviewPayScreen());
                    },).marginSymmetric(horizontal: 20)
                  ],
                ),
              )),





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
          const Spacer(),
          addText400(subtitle!.capitalize.toString(),fontSize: 14,color: AppColors.textColor1)
        ],
      ),
    );

  }

  build_pickUp_button({String? button,void Function()? onTap}) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                color: pickOption==button?AppColors.primaryColor:AppColors.whiteColor,
                shape: BoxShape.circle,
                border: Border.all(color: pickOption==button?AppColors.primaryLightColor:AppColors.containerBorderColor)
            ),
          ),
        ),addWidth(8),
        addText500('${button?.capitalize}',fontSize: 14,color: AppColors.textColor1)
      ],
    );
  }
}
