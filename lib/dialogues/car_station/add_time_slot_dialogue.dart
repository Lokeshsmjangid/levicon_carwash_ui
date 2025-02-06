/*
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:levicon_carwash/controllers/car_station/station_schedule_time_slots_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/custom_snakebar.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';

class AddTimeSlotDialog {
  static void show(BuildContext context,{void Function()? onTap}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => AddTimeSlotDialogWidget(onTap: onTap),
    );
  }
}

class AddTimeSlotDialogWidget extends StatefulWidget {
  void Function()? onTap;

  AddTimeSlotDialogWidget({this.onTap});

  @override
  State<AddTimeSlotDialogWidget> createState() => _AddTimeSlotDialogWidgetState();
}

class _AddTimeSlotDialogWidgetState extends State<AddTimeSlotDialogWidget> {

  final formKey = GlobalKey<FormState>();
  int selectedDayIndex = 0;
  List avabilityDay = ['all days', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];

  TextEditingController openTimeCtrl = TextEditingController();
  TextEditingController closeTimeCtrl = TextEditingController();


  String? startTime;
  String? endTime;
  Future<void> selectTime(BuildContext context,{bool isOpenTime = false}) async {
    final TimeOfDay? picked = await showTimePicker(
      helpText: isOpenTime?'Select Opening Time':isOpenTime==false?'Select Closing Time':'Select Time',
      context: context,
      initialTime: TimeOfDay.now(), // Set the initial time
      initialEntryMode: TimePickerEntryMode.dialOnly,
    );
    if (picked != null) {
      // Do something with the selected time
      print('picked time: ${picked}');


      if(isOpenTime){

        openTimeCtrl.text = '${picked.format(context)}'; // to show in textfield
        startTime = '${picked.hour}:${picked.minute}'; // to send in api
      } else {

        closeTimeCtrl.text = '${picked.format(context)}'; // to show in textfield
        endTime = '${picked.hour}:${picked.minute}'; // to send in api

      }
      setState(() {});
    }
  }

  String getDayType(int selectedDayIndex) {
    switch (selectedDayIndex) {
      case 7:
        return "Sunday";
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 0:
        return "All Days";
      default:
        return "Invalid day!";
    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true, // false if disable device button
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor.withOpacity(0.28), // Set blur tint to red
            BlendMode.screen, // Adjust blending mode for red tint
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
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
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addHeight(14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          addText600('Add New Slot',fontSize: 18,color: AppColors.blackColor),
                          GestureDetector(
                              onTap: (){
                                Get.back();
                              },
                              child: Image.asset(AppAssets.closeIcon,height: 18,width: 18,color: AppColors.blackColor,)),
                        ],
                      ), addHeight(4),


                      addText400('Working Days',fontSize: 14,color: AppColors.textColor3).marginOnly(bottom: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          build_days_button(day: 'all days',index: 0,selectedDayIndex: selectedDayIndex,onTap: (){
                            selectedDayIndex = 0;setState(() {});
                          }),
                          build_days_button(day: 'mon',index: 1,selectedDayIndex: selectedDayIndex,onTap: (){selectedDayIndex = 1;setState(() {});}),
                          build_days_button(day: 'tue',index: 2,selectedDayIndex: selectedDayIndex,onTap: (){selectedDayIndex = 2;setState(() {});}),
                          build_days_button(day: 'wed',index: 3,selectedDayIndex: selectedDayIndex,onTap: (){selectedDayIndex = 3;setState(() {});}),
                        ],
                      ),
                      addHeight(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          build_days_button(day: 'thu',index: 4,selectedDayIndex: selectedDayIndex,onTap: (){selectedDayIndex = 4;setState(() {});}),
                          build_days_button(day: 'fri',index: 5,selectedDayIndex: selectedDayIndex,onTap: (){selectedDayIndex = 5;setState(() {});}),
                          build_days_button(day: 'sat',index: 6,selectedDayIndex: selectedDayIndex,onTap: (){selectedDayIndex = 6;setState(() {});}),
                          build_days_button(day: 'sun',index: 7,selectedDayIndex: selectedDayIndex,onTap: (){selectedDayIndex = 7;setState(() {});}),
                        ],
                      ),
                      addHeight(10),

                      addText400('Opening & Closing Time',fontSize: 14,color: AppColors.textColor3).marginOnly(bottom: 6),
                      CustomTextField(
                        hintText: 'Enter Open Time',
                        controller: openTimeCtrl,
                        readOnly: true,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Opening Time is required')
                        ]),
                        onTap: (){
                          selectTime(context,isOpenTime: true);
                        },
                      ),

                      Align(
                          alignment: Alignment.center
                          ,child: addText400('To',fontSize: 14,color: AppColors.textColor3).marginOnly(bottom: 6,top: 6)),
                      CustomTextField(
                        hintText: 'Enter Close Time',
                        controller: closeTimeCtrl,
                        readOnly: true,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Closing Time is required')
                        ]),
                        onTap: (){
                          selectTime(context,isOpenTime: false);

                        },
                      ),addHeight(10),

                      addHeight(14),
                      AppButton(buttonText: 'Add',onButtonTap: (){
                        if(formKey.currentState?.validate()??false){
                          // print('object:::$day');
                          Get.back();
                          Get.find<StationScheduleTimeSlotsCtrl>().timeScheduleList.add(ScheduleTimeSlot(
                              day: getDayType(selectedDayIndex),
                              startTime: startTime,
                              endTime: endTime));
                          Get.find<StationScheduleTimeSlotsCtrl>().update();

                        }
                      }),
                      addHeight(14),
                    ],
                  ),
                ),
              ),
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
}

*/

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/controllers/car_station/station_schedule_time_slots_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';

class AddTimeSlotDialog {
  static void show(BuildContext context,{void Function()? onTap}) {
    showDialog(
      context: context,
      barrierColor: AppColors.primaryColor.withOpacity(0.5),
      barrierDismissible: true,
      builder: (_) => AddTimeSlotDialogWidget(onTap: onTap),
    );
  }
}

class AddTimeSlotDialogWidget extends StatefulWidget {
  void Function()? onTap;

  AddTimeSlotDialogWidget({this.onTap});

  @override
  State<AddTimeSlotDialogWidget> createState() => _AddTimeSlotDialogWidgetState();
}

class _AddTimeSlotDialogWidgetState extends State<AddTimeSlotDialogWidget> {
  final formKey = GlobalKey<FormState>();

  List<String> availabilityDays = ['All Days', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  Set<int> selectedDays = {}; // Store selected day indices

  TextEditingController openTimeCtrl = TextEditingController();
  TextEditingController closeTimeCtrl = TextEditingController();

  String? startTime;
  String? endTime;

  Future<void> selectTime(BuildContext context, {bool isOpenTime = false}) async {
    final TimeOfDay? picked = await showTimePicker(
      helpText: isOpenTime ? 'Select Opening Time' : 'Select Closing Time',
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dialOnly,
    );

    if (picked != null) {
      if (isOpenTime) {
        openTimeCtrl.text = picked.format(context);
        startTime = '${picked.hour}:${picked.minute}';
      } else {
        closeTimeCtrl.text = picked.format(context);
        endTime = '${picked.hour}:${picked.minute}';
      }
      setState(() {});
    }
  }

  void toggleDaySelection(int index) {
    setState(() {
      if (index == 0) {
        // Toggle All Days selection
        if (selectedDays.contains(0)) {
          selectedDays.clear(); // Deselect all
        } else {
          selectedDays.addAll(List.generate(8, (i) => i)); // Select all
        }
      } else {
        if (selectedDays.contains(index)) {
          selectedDays.remove(index);
        } else {
          selectedDays.add(index);
        }
        // If any individual day is deselected, remove "All Days"
        if (selectedDays.length < 8) {
          selectedDays.remove(0);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Dialog(
              backgroundColor: Colors.transparent,
              surfaceTintColor: AppColors.whiteColor,
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                    padding: const EdgeInsets.symmetric( horizontal: 18,vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.containerBorderColor),
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(30), // Set the border radius
                    ),
                          child: Form(
                            key: formKey,
                            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [addHeight(14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addText600('Add New Slot',fontSize: 18,color: AppColors.blackColor),
                      GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: Image.asset(AppAssets.closeIcon,height: 18,width: 18,color: AppColors.blackColor,)),
                    ],
                  ), addHeight(4),


                  addText400('Working Days', fontSize: 14, color: AppColors.textColor3),
                  addHeight(6),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) {
                      return buildDayButton(
                        day: availabilityDays[index],
                        index: index,
                        isSelected: selectedDays.contains(index),
                        onTap: () => toggleDaySelection(index),
                      );
                    }),
                  ),
                  addHeight(8), // Spacing between rows
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) {
                      return buildDayButton(
                        day: availabilityDays[index + 4], // Next set of 4 items
                        index: index + 4,
                        isSelected: selectedDays.contains(index + 4),
                        onTap: () => toggleDaySelection(index + 4),
                      );
                    }),
                  ),

                  addHeight(12),

                  addText400('Opening & Closing Time',fontSize: 14,color: AppColors.textColor3).marginOnly(bottom: 6),
                  CustomTextField(
                    hintText: 'Enter Open Time',
                    controller: openTimeCtrl,
                    readOnly: true,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Opening Time is required')
                    ]),
                    onTap: (){
                      selectTime(context,isOpenTime: true);
                    },
                  ),

                  Align(
                      alignment: Alignment.center
                      ,child: addText400('To',fontSize: 14,color: AppColors.textColor3).marginOnly(bottom: 6,top: 6)),
                  CustomTextField(
                    hintText: 'Enter Close Time',
                    controller: closeTimeCtrl,
                    readOnly: true,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Closing Time is required')
                    ]),
                    onTap: (){
                      selectTime(context,isOpenTime: false);

                    },
                  ),
                  addHeight(24),
                  AppButton(
                    buttonText: 'Add',
                    onButtonTap: () {
                      if (formKey.currentState?.validate() ?? false) {
                        Get.back();
                        Get.find<StationScheduleTimeSlotsCtrl>().timeScheduleList.add(ScheduleTimeSlot(
                          day: selectedDays.map((i) => availabilityDays[i]).join(", "), // Store multiple days
                          startTime: startTime,
                          endTime: endTime,
                        ));
                        Get.find<StationScheduleTimeSlotsCtrl>().update();
                      }
                    },
                  ),
                  addHeight(14),
                ],
                            ),
                          ),
                        ),
              ),
      ),
    );
  }

  Widget buildDayButton({required String day, required int index, required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        decoration: BoxDecoration(
            color: isSelected?AppColors.primaryColor:AppColors.whiteColor,
            borderRadius: BorderRadius.circular(100),
            border: isSelected?Border.all(color: AppColors.primaryColor):Border.all(color: AppColors.containerBorderColor)
        ),
        child: addText400(
          day,
          fontSize: 13,textAlign: TextAlign.center,
          color: isSelected ? Colors.white : AppColors.textColor1.withOpacity(0.8),
        ).marginSymmetric(horizontal: 8,vertical: 4),
      ),
    );
  }
}
