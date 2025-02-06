import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:levicon_carwash/controllers/car_station/station_schedule_time_slots_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/custom_snakebar.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';

class EditTimeSlotDialog {
  static void show(BuildContext context,{void Function()? onTap,String? editStartTime,String? editEndTime,int? editAtIndex}) {
    showDialog(
      context: context,
      barrierColor: AppColors.primaryColor.withOpacity(0.5),
      barrierDismissible: true,
      builder: (_) => EditTimeSlotDialogWidget(onTap: onTap,editStartTime: editStartTime,editEndTime: editEndTime, editAtIndex: editAtIndex),
    );
  }
}

class EditTimeSlotDialogWidget extends StatefulWidget {
  void Function()? onTap;
  int? editAtIndex;
  String? editStartTime;
  String? editEndTime;

  EditTimeSlotDialogWidget({this.onTap,this.editStartTime,this.editEndTime,this.editAtIndex});

  @override
  State<EditTimeSlotDialogWidget> createState() => _EditTimeSlotDialogWidgetState();
}

class _EditTimeSlotDialogWidgetState extends State<EditTimeSlotDialogWidget> {

  final formKey = GlobalKey<FormState>();
  int selectedDayIndex = 0;
  List avabilityDay = ['all days', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];
  TextEditingController openTimeCtrl = TextEditingController();
  TextEditingController closeTimeCtrl = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    startTime = widget.editStartTime!;
    endTime = widget.editEndTime!;
    openTimeCtrl.text = convertTo12HourFormat(widget.editStartTime!);
    closeTimeCtrl.text = convertTo12HourFormat(widget.editEndTime!);
  }

  String convertTo12HourFormat(String time) {
    // Parse the time string into a DateTime object
    DateTime dateTime = DateFormat("HH:mm").parse(time);
    // Format it into a 12-hour format with AM/PM
    return DateFormat.jm().format(dateTime);
  }

  int getHourAndMinute({String? time, bool getHour = false }) {


    // Split the time string by ":"
    List<String> timeParts = time!.split(":");

    // Convert parts to integers
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);

    print("Hour: $hour");   // Output: 17
    print("Minute: $minute"); // Output: 3

    return getHour?hour:minute;

  }


  String? startTime;
  String? endTime;
  Future<void> selectTime(BuildContext context,{bool isOpenTime = false}) async {
    final TimeOfDay? picked = await showTimePicker(
      helpText: isOpenTime?'Select Opening Time':isOpenTime==false?'Select Closing Time':'Select Time',
      context: context,
      initialTime: TimeOfDay(hour: getHourAndMinute(time: isOpenTime?widget.editStartTime:widget.editEndTime,getHour: true),
          minute: getHourAndMinute(time:isOpenTime?widget.editStartTime:widget.editEndTime,getHour: false)), // Set the initial time
      // initialTime: TimeOfDay(hour: ,minute: ), // Set the initial time
      initialEntryMode: TimePickerEntryMode.dialOnly,
    );
    if (picked != null) {
      // Do something with the selected time
      print('Selected time: ${picked.hour}:${picked.minute}');
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
                      addText600('Edit',fontSize: 18,color: AppColors.blackColor),
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
                    controller: openTimeCtrl,
                    hintText: 'Enter Open Time',
                    readOnly: true,
                    onTap: (){selectTime(context,isOpenTime: true);},
                  ),

                  Align(
                  alignment: Alignment.center
                  ,child: addText400('To',fontSize: 14,color: AppColors.textColor3).marginOnly(bottom: 6,top: 6)),
                  CustomTextField(
                    controller: closeTimeCtrl,
                    hintText: 'Enter Close Time',
                    readOnly: true,
                    onTap: (){selectTime(context,isOpenTime: false);},
                  ),addHeight(10),

                  addHeight(14),
                  AppButton(buttonText: 'Update',onButtonTap: (){
                    if(formKey.currentState?.validate()??false){

                      Get.back();
                      Get.find<StationScheduleTimeSlotsCtrl>().timeScheduleList[widget.editAtIndex!.toInt()].startTime = startTime;
                      Get.find<StationScheduleTimeSlotsCtrl>().timeScheduleList[widget.editAtIndex!.toInt()].endTime = endTime;
                      Get.find<StationScheduleTimeSlotsCtrl>().update();
                      CustomSnackBar().showSuccessSnackBar(context,message: 'Time Slot Edited Successfully.');
                    }
                  },),
                  addHeight(14),
                ],
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
