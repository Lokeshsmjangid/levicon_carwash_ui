import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/custom_snakebar.dart';
import 'package:levicon_carwash/dialogues/car_station/add_manage_services_dialogue.dart';
import 'package:levicon_carwash/dialogues/car_station/add_time_slot_dialogue.dart';
import 'package:levicon_carwash/dialogues/car_station/edit_manage_services_dialogue.dart';
import 'package:levicon_carwash/dialogues/car_station/edit_time_slot_dialogue.dart';
import 'package:levicon_carwash/dialogues/car_station/reject_reason_dialogue.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/custom_loader.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';
import 'package:table_calendar/table_calendar.dart';

class StationManageServiceScreen extends StatefulWidget {
  const StationManageServiceScreen({super.key});

  @override
  State<StationManageServiceScreen> createState() => _StationBookingHistoryScreenState();
}

class _StationBookingHistoryScreenState extends State<StationManageServiceScreen> {

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
              backButton(onTap: (){Get.back();}),
              addText600('Manage Services',fontSize: 18),
              backButton(isBackButton:false),



            ],
          ).marginSymmetric(horizontal: 20),
          addHeight(20),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                
                ...List.generate(3, (index){
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF2F5F7),
                        // border: Border.all(color: AppColors.containerBorderColor),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    padding: const EdgeInsets.all(18),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                                constraints: const BoxConstraints(maxWidth: 30),
                                child: Image.asset(index==0 || index==2?AppAssets.detailingIcon:AppAssets.basicWashIcon,width: 24,height: 24,)),
                            addWidth(10),
                            addText500(index==0 || index==2?'detailing'.capitalize.toString(): 'Basic wash'.capitalize.toString(),fontSize: 16),
                            const Spacer(),
                            buttonEditDelete(
                                isEdit: true, onTap: (){EditManageServicesDialog.show(context);}),

                            addWidth(8),
                            buttonEditDelete(isEdit: false,onTap: (){
                              showLoader(true);
                              Future.delayed(Duration(milliseconds: 1500),(){
                                CustomSnackBar().showSuccessSnackBar(context,message: 'Service Delete Successfully.');
                                showLoader(false);
                              });
                            }),
                          ],
                        ),
                        addHeight(4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              constraints: const BoxConstraints(maxWidth: 60),
                              child: Row(

                                children: [
                                  addText500('₹',fontSize: 15,color: AppColors.blackColor),
                                  addWidth(4),
                                  addText500('2000',fontSize: 15,color: AppColors.blackColor)
                                ],
                              ),
                            ),
                            addWidth(2),
                            Container(
                              constraints: const BoxConstraints(maxWidth: 92),
                              child: Row(

                                children: [
                                  Image.asset(AppAssets.durationClockIcon,width: 20,height: 20),
                                  addWidth(4),
                                  addText500('55 min',fontSize: 15,color: AppColors.textColor1)
                                ],
                              ),
                            ),
                          ],
                        )


                      ],
                    ),
                  ).marginOnly(bottom:12,top: index==0?14:0);
                }),

                addHeight(8),
                AppButton(buttonText: 'Add New Service',onButtonTap: (){
                  AddManageServicesDialog.show(context);
                },),
                
                addHeight(24)
              ],
            ).marginSymmetric(horizontal: 20),
          ))
        ],
      ),
    );
  }

}
