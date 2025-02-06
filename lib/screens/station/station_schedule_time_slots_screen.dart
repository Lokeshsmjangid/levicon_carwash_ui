import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/controllers/car_station/station_schedule_time_slots_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/custom_snakebar.dart';
import 'package:levicon_carwash/dialogues/car_station/add_time_slot_dialogue.dart';
import 'package:levicon_carwash/dialogues/car_station/edit_time_slot_dialogue.dart';
import 'package:levicon_carwash/dialogues/car_station/reject_reason_dialogue.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';
import 'package:table_calendar/table_calendar.dart';

class StationScheduleTimeSlotScreen extends StatefulWidget {
  const StationScheduleTimeSlotScreen({super.key});

  @override
  State<StationScheduleTimeSlotScreen> createState() =>
      _StationBookingHistoryScreenState();
}

class _StationBookingHistoryScreenState
    extends State<StationScheduleTimeSlotScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          addHeight(52),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              backButton(onTap: () {
                Get.back();
              }),

              addText600('Schedule Time Slots', fontSize: 18),
              backButton(isBackButton: false),


            ],
          ).marginSymmetric(horizontal: 20),
          addHeight(20),
          Row(
            children: [
              addText400(
                  'Slots History', fontSize: 18, color: AppColors.blackColor),
              addWidth(14),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  AddTimeSlotDialog.show(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.containerBorderColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: addText500(
                      'Add New Slot', fontSize: 12, color: AppColors.blackColor)
                      .marginSymmetric(horizontal: 16, vertical: 4),
                ),
              ),

            ],
          ).marginSymmetric(horizontal: 20),
          addHeight(16),
          Expanded(
              child: GetBuilder<StationScheduleTimeSlotsCtrl>(builder: (logic) {
                return logic.timeScheduleList.isNotEmpty
                    ? SingleChildScrollView(
                  child: Column(
                    children: [
                  
                  
                  
                  
                      ...List.generate(logic.timeScheduleList.length, (index) {
                        return Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.containerBorderColor),
                              borderRadius: BorderRadius.circular(14)
                          ),
                          padding: const EdgeInsets.all(18),
                  
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      constraints: const BoxConstraints(
                                          maxWidth: 30),
                                      child: addText400(
                                          '${index + 1}.', fontSize: 18,
                                          color: AppColors.textColor3)),
                                  addWidth(6),
                                  Container(
                                      constraints: BoxConstraints(maxWidth: 140),
                                      child: addText500('${logic.timeScheduleList[index].day}',overflow: TextOverflow.ellipsis, maxLines: 1,fontSize: 16)),
                                  const Spacer(),
                                  buttonEditDelete(isEdit: true, onTap: () {
                                    EditTimeSlotDialog.show(context,
                                      editStartTime: logic.timeScheduleList[index].startTime.toString(),
                                      editEndTime: logic.timeScheduleList[index].endTime.toString(),
                                      editAtIndex: index
                                    );
                                  }),
                                  addWidth(8),
                                  buttonEditDelete(isEdit: false,onTap: (){
                                    logic.timeScheduleList.removeAt(index);
                                    logic.update();

                                    CustomSnackBar().showErrorSnackBar(context,message: 'Slot Removed Successfully');
                                  }),
                                ],
                              ),
                              addHeight(4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: const BoxConstraints(
                                        maxWidth: 104),
                                    child: Row(
                  
                                      children: [
                                        Image.asset(
                                            AppAssets.clockIcon, width: 20,
                                            height: 20),
                                        addWidth(4),
                                        addText500('${logic.convertTo12HourFormat(logic.timeScheduleList[index].startTime.toString())} /', fontSize: 15,
                                            color: AppColors.textColor3)
                                      ],
                                    ),
                                  ),
                                  addWidth(2),
                                  Container(
                                    constraints: const BoxConstraints(
                                        maxWidth: 92),
                                    child: Row(
                  
                                      children: [
                                        Image.asset(
                                            AppAssets.clockIcon, width: 20,
                                            height: 20),
                                        addWidth(4),
                                        addText500('${logic.convertTo12HourFormat(logic.timeScheduleList[index].endTime.toString())}', fontSize: 15,
                                            color: AppColors.textColor3)
                                      ],
                                    ),
                                  ),
                                ],
                              )
                  
                  
                            ],
                          ),
                        ).marginOnly(bottom: 8, top: index == 0 ? 14 : 0);
                      }),
                  
                      addHeight(20)
                    ],
                  ).marginSymmetric(horizontal: 20),
                )
                    : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        addText400('No Slots Found'),
                      ],
                    ).marginSymmetric(horizontal: 20);
              }))
        ],
      ),
    );
  }




}
