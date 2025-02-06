import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/dialogues/car_station/reject_reason_dialogue.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';

class StationBookingHistoryScreen extends StatefulWidget {
  const StationBookingHistoryScreen({super.key});

  @override
  State<StationBookingHistoryScreen> createState() => _StationBookingHistoryScreenState();
}

class _StationBookingHistoryScreenState extends State<StationBookingHistoryScreen> {
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
              // backButton(isBackButton: false),
              addText600('Bookings',fontSize: 18),
              backButton(isBackButton: false),


            ],
          ).marginSymmetric(horizontal: 20),
          addHeight(20),
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(10, (index){
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.containerBorderColor),
                      borderRadius: BorderRadius.circular(14)
                    ),
                    padding: const EdgeInsets.all(14),
            
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CachedImageCircle(imageUrl: 'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
                              height: 44,width: 44,),
                            addWidth(14),
                            addText500('Michael Brown',fontSize: 18,color: AppColors.blackColor),
                            addWidth(14),
                            const Spacer(),
                            addText500('₹2000',fontSize: 15,color: AppColors.blackColor),
            
                          ],
                        ),
                        addHeight(16),
                        addText500('Date and Time',fontSize: 15,color: AppColors.textColor1).marginOnly(bottom: 4),
                        Row(
                          children: [
                            Row(

                              children: [
                                Image.asset(AppAssets.calenderIcon,width: 20,height: 20),
                                addWidth(4),
                                addText500('02/02/2025',fontSize: 15,color: AppColors.textColor3)
                              ],
                            ),
                            addWidth(16),
                            Row(

                              children: [
                                Image.asset(AppAssets.clockIcon,width: 20,height: 20),
                                addWidth(4),
                                addText500('12:50am',fontSize: 15,color: AppColors.textColor3)
                              ],
                            ),
                          ],
                        ),

                        // location
                        addHeight(16),
                        addText500('Location',fontSize: 15,color: AppColors.textColor1).marginOnly(bottom: 4),
                        Row(
                          children: [
                            Image.asset(AppAssets.locationIcon,width: 20,height: 20),
                            addWidth(4),
                            addText500('Banglore',fontSize: 15,color: AppColors.textColor3)
                          ],
                        ),

                        // Services
                        addHeight(16),
                        addText500('Service',fontSize: 15,color: AppColors.textColor1).marginOnly(bottom: 4),
                        Row(
                          children: [
                            Image.asset(AppAssets.basicWashIcon,width: 20,height: 20),
                            addWidth(4),
                            addText500('Basic wash',fontSize: 15,color: AppColors.textColor3)
                          ],
                        ),
                        
                        addHeight(4),
                        Row(
                          children: [
                            const Spacer(),
                            Container(
                              
                              decoration: BoxDecoration(color: AppColors.primaryColor,borderRadius: BorderRadius.circular(25)),
                              child: addText500('Accept',fontSize: 16,color: AppColors.whiteColor).marginSymmetric(horizontal: 14,vertical: 4),
                            ),addWidth(10),
                            GestureDetector(
                              onTap:(){
                                RejectReasonDialog.show(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(color: AppColors.redColor,borderRadius: BorderRadius.circular(25)),
                                child: addText500('Reject',fontSize: 16,color: AppColors.whiteColor).marginSymmetric(horizontal: 16,vertical: 4),
                              ),
                            ),
                          ],
                        )

                      ],
                    ),
                  ).marginOnly(bottom:16,top: index==0?14:0);
                })
              ],
            ).marginSymmetric(horizontal: 20),
          ))
        ],
      ),
    );
  }
}
