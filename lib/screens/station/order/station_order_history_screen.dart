import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/controllers/car_station/station_order_history_ctrl.dart';
import 'package:levicon_carwash/dialogues/car_station/reject_reason_dialogue.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';

class StationOrderHistoryScreen extends StatefulWidget {
  const StationOrderHistoryScreen({super.key});

  @override
  State<StationOrderHistoryScreen> createState() =>
      _StationOrderHistoryScreenState();
}

class _StationOrderHistoryScreenState extends State<StationOrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: GetBuilder<StationOrderHistoryCtrl>(builder: (logic) {
        return Column(
          children: [
            addHeight(52),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                backButton(onTap: () {
                  Get.back();
                }),

                addText600('Orders', fontSize: 18),
                backButton(isBackButton: false),

              ],
            ).marginSymmetric(horizontal: 20),

            addHeight(20),
            Row(
              children: [
                build_tab_button(index: 0, selectedIndex: logic.selectedTabIndex,tabTitle: 'Upcoming',
                    onTap: (){
                  logic.selectedTabIndex=0;
                  logic.update();
                }),
                addWidth(12),
                build_tab_button(index: 1, selectedIndex: logic.selectedTabIndex,tabTitle: 'Done',onTap: (){
                  logic.selectedTabIndex=1;
                  logic.update();
                }),
                addWidth(8),
                build_tab_button(index: 2, selectedIndex: logic.selectedTabIndex,tabTitle: 'Reject',onTap: (){
                  logic.selectedTabIndex=2;
                  logic.update();
                }),
              ],
            ).marginSymmetric(horizontal: 20),
            addHeight(10),


            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(10, (index) {
                    return Stack(
                      children: [
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
                              Row(
                                children: [
                                  Container(
                                    height: 44, width: 44,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle),
                        
                                    child: Image.asset(AppAssets.personImage),
                                  ),
                                  addWidth(14),
                                  addText500('Michael Brown', fontSize: 18,
                                      color: AppColors.blackColor),
                                  addWidth(14),
                                  const Spacer(),
                                  addText500('₹2000', fontSize: 15,
                                      color: AppColors.blackColor),
                        
                                ],
                              ),
                              addHeight(16),
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
                        
                              if(logic.selectedTabIndex==0 || logic.selectedTabIndex==1)
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
                        
                              if(logic.selectedTabIndex==2)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  addHeight(16),
                                  addText500('Reason', fontSize: 15,
                                      color: AppColors.textColor1).marginOnly(
                                      bottom: 4),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: addText400('"We are unable to process your car wash request at this time due to unforeseen circumstances. We apologize for the inconvenience and appreciate your understanding."',
                                            fontSize: 12,
                                            textAlign: TextAlign.justify,
                                            color: AppColors.textColor3),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                        
                              if(logic.selectedTabIndex==0)
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius: BorderRadius.circular(25)),
                                      child: addText500('Mark Complete', fontSize: 16,
                                          color: AppColors.whiteColor)
                                          .marginSymmetric(
                                          horizontal: 16, vertical: 4),
                                    ),
                                  ),
                                ],
                              ).marginOnly(top: 8),

                              /*if( logic.selectedTabIndex==1)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.greenColor,
                                          borderRadius: BorderRadius.circular(25)),
                                      child: addText500('Completed', fontSize: 16,
                                          color: AppColors.whiteColor)
                                          .marginSymmetric(
                                          horizontal: 16, vertical: 4),
                                    ),
                                  ),
                                ],
                              )*/
                        
                            ],
                          ),
                        ).marginOnly(bottom: logic.selectedTabIndex==1 || logic.selectedTabIndex==2?30:16, top: index == 0 ? 14 : 0),

                        if( logic.selectedTabIndex==1)
                          Positioned(
                            right: 10,
                            bottom: 16,
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.greenColor1,
                                    borderRadius: BorderRadius.circular(25)),
                                child: addText500('Completed', fontSize: 16,
                                    color: AppColors.whiteColor)
                                    .marginSymmetric(
                                    horizontal: 16, vertical: 4),
                              ),
                            ),
                          ],
                        )),

                        if( logic.selectedTabIndex==2)
                          Positioned(
                            right: 10,
                            bottom: 16,
                            child: GestureDetector(
                            onTap: () {

                            },
                            child: Container(
                            decoration: BoxDecoration(
                            color: AppColors.redColor,
                            borderRadius: BorderRadius.circular(25)),
                            child: addText500('Rejected', fontSize: 16,
                            color: AppColors.whiteColor).marginSymmetric(horizontal: 16, vertical: 4),
                            ),
                            ))
                      ],
                    );
                  })
                ],
              ).marginSymmetric(horizontal: 20),
            ))
          ],
        );
      }),
    );
  }

  build_tab_button({void Function()? onTap, int? selectedIndex, int? index, String? tabTitle,}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
            maxWidth: 94
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            addText500('$tabTitle', fontSize: 14, color: selectedIndex == index
                ? AppColors.primaryColor
                : AppColors.blackColor),
            Container(
              height: 3,
              width: MediaQuery
                  .sizeOf(context)
                  .width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: selectedIndex == index
                    ? AppColors.primaryColor
                    : AppColors.whiteColor,

              ),
            )
          ],
        ).marginSymmetric(horizontal: 6, vertical: 4),
      ),
    );
  }
}
