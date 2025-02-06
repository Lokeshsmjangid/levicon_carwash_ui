import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/controllers/car_station/station_schedule_time_slots_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/custom_dropdown.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';

class AddManageServicesDialog {
  static void show(BuildContext context,{void Function()? onTap}) {
    showDialog(
      context: context,
      barrierColor: AppColors.primaryColor.withOpacity(0.5),
      barrierDismissible: true,
      builder: (_) => AddManageServicesDialogWidget(onTap: onTap),
    );
  }
}

class AddManageServicesDialogWidget extends StatefulWidget {
  void Function()? onTap;

  AddManageServicesDialogWidget({this.onTap});

  @override
  State<AddManageServicesDialogWidget> createState() => _AddManageServicesDialogWidgetState();
}

class _AddManageServicesDialogWidgetState extends State<AddManageServicesDialogWidget> {
  int selectedDayIndex = 0;

  String selectedService = 'Detailing';
  String pickOption = 'self';
  List serviceList = ['Detailing', 'Basic wash'];



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
              border: Border.all(color: AppColors.containerBorderColor),
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(30), // Set the border radius
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addHeight(14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addText600('Add Service',fontSize: 18,color: AppColors.blackColor),
                    GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Image.asset(AppAssets.closeIcon,height: 18,width: 18,color: AppColors.blackColor,)),
                  ],
                ), addHeight(4),


                addText400('Pickup Options',fontSize: 14,color: AppColors.textColor3).marginOnly(bottom: 6),
                Container(
                  height: 48,
                  width: MediaQuery.of(context).size.width,
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

                ),


                addText400('Service',fontSize: 14,color: AppColors.textColor3).marginOnly(bottom: 6),
                CustomDropdownButton2(
                    // searchController: logic.yrSearchCtrl,
                    // search controller
                    hintText: 'Select service',
                    searchHintText: 'Search year',
                    items: serviceList??[],
                    // pass your list here
                    value: selectedService,
                    // initial value
                    displayText: (item) => '$item',
                    onChanged: (val) {
                      selectedService = val;
                      setState(() {});

                      // logic.fetchVehicleModalByBrandId(brand_Id: logic.selectedVehicleBrand?.id,isEditVehicle: false);
                    }
                ),

                addText400('Duration',fontSize: 14,color: AppColors.textColor3).marginOnly(bottom: 6,top: 6),
                CustomTextField(

                  prefixIcon: Image.asset(AppAssets.durationClockIcon).marginAll(13),
                  hintText: 'Enter Duration',),addHeight(10),

                addText400('Amount',fontSize: 14,color: AppColors.textColor3).marginOnly(bottom: 6,top: 6),
                CustomTextField(
                  keyboardType: TextInputType.number,
                  prefixIcon: addText400('₹',fontSize: 16,color: AppColors.primaryColor).marginOnly(left: 20),
                  hintText: 'Enter Amount',),addHeight(10),

                addHeight(14),
                AppButton(buttonText: 'Add'),
                addHeight(14),
              ],
            ),
          ),
        ),
      ),
    );
  }

  build_days_button({void Function()? onTap,String? day,int? index, int? selectedDayIndex}) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
          width: 70,
          decoration: BoxDecoration(
              color: selectedDayIndex==index?AppColors.primaryColor:AppColors.whiteColor,
              borderRadius: BorderRadius.circular(100),
              border: selectedDayIndex==index?null:Border.all(color: AppColors.containerBorderColor)
          ),
          child: addText400("$day".capitalize.toString(),
              maxLines: 1,textAlign: TextAlign.center,fontSize: 13,color:selectedDayIndex == index?Colors.white: AppColors.textColor1.withOpacity(0.8)).marginSymmetric(horizontal: 8,vertical: 4)),
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

