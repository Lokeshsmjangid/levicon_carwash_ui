import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';

import 'station_sidebar_screen.dart';

class StationHomeScreen extends StatefulWidget {
  const StationHomeScreen({super.key});

  @override
  State<StationHomeScreen> createState() => _StationHomeScreenState();
}

class _StationHomeScreenState extends State<StationHomeScreen> {
  bool isOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [

          // Header
          Container(
            height: 120,
            decoration: const BoxDecoration(
            color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12))
            ),
            child: Column(
              children: [
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        addText500(isOn?'Active':'DeActive',fontSize: 13,color: Colors.white),
                        switchButton(value: isOn,onTap: (){
                          isOn = !isOn;
                          setState(() {});
                        })
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=>StationSideBarScreen());
                      },
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: AppColors.blueColor,
                        ),
                        child: Image.asset(AppAssets.drawerIcon).marginAll(8),
                      ),
                    )
                  ],
                ).marginSymmetric(horizontal: 20,vertical: 20)
              ],
            ),
          ),

          // Body
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                addHeight(20),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.containerBorderColor),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    children: [

                      Row(
                        children: [
                          addText400('Upcoming Orders',fontSize: 18,color: AppColors.blackColor),
                          addWidth(14),
                          const Spacer(),
                          Container(height: 30,width: 30,
                            decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryLightColor
                          ),
                          child: Center(child: Image.asset(AppAssets.arrowRightAlt).marginAll(8)),
                          ),

                        ],
                      ),
                      addHeight(16),


                      // inner box
                     ...List.generate(2, (index){
                       return Container(
                         padding: const EdgeInsets.all(14),
                         decoration: BoxDecoration(
                             border: Border.all(color: AppColors.containerBorderColor),
                             borderRadius: BorderRadius.circular(16)
                         ),
                         child: Column(
                           children: [

                             Row(
                               children: [
                                 Container(
                                   height: 36,width: 36,
                                   decoration: const BoxDecoration(shape: BoxShape.circle),

                                   child: Image.asset(AppAssets.personImage),
                                 ),
                                 addWidth(14),
                                 addText500('Michael Brown',fontSize: 16,color: AppColors.blackColor),
                                 addWidth(14),
                                 const Spacer(),
                                 // addText500('₹2000',fontSize: 15,color: AppColors.blackColor),

                               ],
                             ),

                             addHeight(16), // date & time
                             Row(
                               children: [
                                 Container(
                                   constraints: const BoxConstraints(maxWidth: 108),
                                   child: Row(

                                     children: [
                                       Image.asset(AppAssets.calenderIcon,width: 20,height: 20),
                                       addWidth(4),
                                       addText500('02/02/2025',fontSize: 13,color: AppColors.textColor3)
                                     ],
                                   ),
                                 ),
                                 addWidth(16),
                                 Row(

                                   children: [
                                     Image.asset(AppAssets.clockIcon,width: 20,height: 20),
                                     addWidth(4),
                                     addText500('12:50am',fontSize: 13,color: AppColors.textColor3)
                                   ],
                                 ),
                               ],
                             ),

                             addHeight(16), // location & detailing
                             Row(
                               children: [
                                 Container(
                                   constraints: const BoxConstraints(maxWidth: 108),
                                   child: Row(

                                     children: [
                                       Image.asset(AppAssets.locationIcon,width: 20,height: 20),
                                       addWidth(4),
                                       addText500('Banglore',fontSize: 13,color: AppColors.textColor3)
                                     ],
                                   ),
                                 ),
                                 addWidth(16),
                                 Container(
                                   constraints: const BoxConstraints(maxWidth: 90),
                                   child: Row(

                                     children: [
                                       Image.asset(AppAssets.detailingIcon,width: 20,height: 20),
                                       addWidth(4),
                                       addText500('detailing'.capitalize.toString(),fontSize: 13,color: AppColors.textColor3)
                                     ],
                                   ),
                                 ),
                                 addWidth(16),
                                 addText500('View'.capitalize.toString(),fontSize: 13,color: AppColors.primaryColor,
                                     decoration: TextDecoration.underline)
                               ],
                             ),
                           ],
                         ),
                       ).marginOnly(
                           bottom: index !=2-1? 10:0);
                     }),

                    ],
                  ),
                ),

                addHeight(10),
                Container(
                  // padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLightColor,
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          addText400('Total Orders',fontSize: 18,color: AppColors.blackColor),
                          addWidth(14),
                          const Spacer(),
                          Container(height: 30,width: 30,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.whiteColor
                            ),
                            child: Center(child: Image.asset(AppAssets.arrowRightAlt).marginAll(8)),
                          ),

                        ],
                      ).marginSymmetric(horizontal: 14,vertical: 14),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          addText500('79',fontSize: 60,color: AppColors.blackColor,height: 0).marginOnly(left: 14,right: 14,bottom: 18),
                          const Spacer(),
                          Image.asset(AppAssets.volkswagenImage, width: 220),

                        ],
                      ),

                    ],
                  ),
                ),

                addHeight(10),

                // Earning and rating
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.containerBorderColor),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                addText400('Earnings',fontSize: 16,color: AppColors.blackColor),
                      
                                Container(height: 30,width: 30,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.primaryLightColor
                                  ),
                                  child: Center(child: Image.asset(AppAssets.arrowRightAlt).marginAll(8)),
                                ),
                              ],
                            ),
                            addHeight(8),
                            addText500('5000',fontSize: 20,color: AppColors.blackColor)
                          ],
                        ),
                      
                      ),
                    ),
                    addWidth(10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.containerBorderColor),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                addText400('Reviews',fontSize: 16,color: AppColors.blackColor),
                      
                                Container(height: 30,width: 30,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.primaryLightColor
                                  ),
                                  child: Center(child: Image.asset(AppAssets.arrowRightAlt).marginAll(8)),
                                ),
                              ],
                            ),
                            addHeight(8),
                            Row(
                              children: [
                                Image.asset(AppAssets.starIcon,height: 20,width: 20).marginOnly(right: 4),
                                addText500('4.9 (140)',fontSize: 20,color: AppColors.blackColor),
                              ],
                            )
                          ],
                        ),
                      
                      ),
                    ),
                  ],
                ),


                addHeight(30),




              ],
            ).marginSymmetric(horizontal: 20),
          ))
        ],
      ),
    );
  }
}
