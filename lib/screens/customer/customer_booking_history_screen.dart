import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/controllers/customer/customer_booking_history_ctrl.dart';
import 'package:levicon_carwash/dialogues/car_station/reject_reason_dialogue.dart';
import 'package:levicon_carwash/dialogues/customer/customer_rating_review_dialogue.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';

class CustomerBookingHistoryScreen extends StatefulWidget {
  const CustomerBookingHistoryScreen({super.key});

  @override
  State<CustomerBookingHistoryScreen> createState() =>
      _CustomerBookingHistoryScreenState();
}

class _CustomerBookingHistoryScreenState
    extends State<CustomerBookingHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: GetBuilder<CustomerBookingHistoryCtrl>(builder: (logic) {
        return Column(
          children: [
            addHeight(52),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // backButton(isBackButton: false),
                addText600('Bookings', fontSize: 18),
                backButton(isBackButton: false),


              ],
            ).marginSymmetric(horizontal: 20),

            addHeight(30),
            Row(
              children: [
                build_tab_button(index: 0,
                    selectedIndex: logic.selectedTabIndex,
                    tabTitle: 'Upcoming',
                    onTap: () {
                      logic.selectedTabIndex = 0;
                      logic.update();
                    }),
                addWidth(12),
                build_tab_button(index: 1,
                    selectedIndex: logic.selectedTabIndex,
                    tabTitle: 'Pending',
                    onTap: () {
                      logic.selectedTabIndex = 1;
                      logic.update();
                    }),
                addWidth(8),
                build_tab_button(index: 2,
                    selectedIndex: logic.selectedTabIndex,
                    tabTitle: 'Past',
                    onTap: () {
                      logic.selectedTabIndex = 2;
                      logic.update();
                    }),
              ],
            ).marginSymmetric(horizontal: 20),
            addHeight(10),


            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  // inner box
                  ...List.generate(5, (index){
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.containerBorderColor),
                          borderRadius: BorderRadius.circular(14)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Stack(
                            children: [
                              Container(
                                height: 160,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: AppColors.containerBorderColor,
                                    borderRadius: BorderRadius.circular(14)
                                ),
                                child: Image.asset(AppAssets.galleryImage,fit: BoxFit.fill,),
                              ),
                              Positioned(
                                  right: 10,
                                  bottom: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(AppAssets.starIcon,height: 13,width: 13).marginOnly(right: 4),
                                        addText400('4.0 (6)',fontSize: 13,color: AppColors.blackColor),
                                      ],
                                    ).marginSymmetric(horizontal: 12,vertical: 2),
                                  ))
                            ],
                          ),

                          addHeight(8),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  addText500('Cars wash services',fontSize: 16,color: AppColors.blackColor),
                                  addText500('₹2000',fontSize: 15,color: AppColors.blackColor),


                                  addHeight(4), // date & time
                                  Row(
                                    children: [
                                      Image.asset(AppAssets.durationClockIcon,width: 20,height: 20),
                                      addWidth(4),
                                      addText400('02/02/2025, 12:50',fontSize: 15,color: AppColors.textColor1)
                                    ],
                                  ),

                                ],
                              ),
                              Spacer(),

                              if(logic.selectedTabIndex==0)
                              Container(

                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(25)),
                                child: addText500('Booked', fontSize: 16,
                                    color: AppColors.whiteColor)
                                    .marginSymmetric(
                                    horizontal: 14, vertical: 4),
                              ),

                              if(logic.selectedTabIndex==1)
                              Container(

                                decoration: BoxDecoration(
                                    color: AppColors.blackColor,
                                    borderRadius: BorderRadius.circular(25)),
                                child: addText500('Pending', fontSize: 16,
                                    color: AppColors.whiteColor)
                                    .marginSymmetric(
                                    horizontal: 14, vertical: 4),
                              ),


                              if(logic.selectedTabIndex==2)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(

                                    decoration: BoxDecoration(
                                        color: AppColors.greenColor,
                                        borderRadius: BorderRadius.circular(25)),
                                    child: addText500('Completed', fontSize: 16,
                                        color: AppColors.whiteColor)
                                        .marginSymmetric(
                                        horizontal: 14, vertical: 4),
                                  ),
                                  addHeight(10),
                                  GestureDetector(
                                    onTap:(){
                                      CustomerRatingReviewDialog.show(context);
                                    },
                                    child: addText500('Add Review',fontSize: 14,
                                        color: AppColors.blackColor,decoration: TextDecoration.underline),
                                  )
                                ],
                              )

                            ],
                          )


                        ],
                      ),
                    ).marginOnly(bottom: 20);
                  }),
                ],
              ).marginSymmetric(horizontal: 20),
            ))
          ],
        );
      }),
    );
  }

  build_tab_button(
      {void Function()? onTap, int? selectedIndex, int? index, String? tabTitle,}) {
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
