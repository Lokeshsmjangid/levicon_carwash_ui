import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:levicon_carwash/resources/utils.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';


class StationManageEarningsScreen extends StatefulWidget {
  const StationManageEarningsScreen({super.key});

  @override
  State<StationManageEarningsScreen> createState() => _StationManageEarningsScreenState();
}

class _StationManageEarningsScreenState extends State<StationManageEarningsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.whiteColor,
      body: AppScreen(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            addHeight(52),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // backButton(onTap: (){
                //   Get.back();
                // }),
                addText600('Manage Earning', fontSize: 18),
                backButton(isBackButton: false),



              ],
            ).marginSymmetric(horizontal: 20),
            addHeight(20),


            // Align(
            //     alignment: Alignment.center,
            //     child: Image.asset(AppAssets.newPasswordBg,width: 214,height: 182,)),
            // addHeight(24),

            Expanded(child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addHeight(10),

                  Container(
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
                            addText500('Main Balance',fontSize: 16,color: AppColors.blackColor),

                          ],
                        ),
                        addHeight(8),
                        Row(
                          children: [
                            addText600('₹',fontSize: 18,color: AppColors.blackColor).marginOnly(bottom: 40),
                            addText600('2,0000',fontSize: 48)
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                                color: AppColors.primaryColor
                            ),
                            child: addText500('Withdrawal',fontSize: 16,color: AppColors.whiteColor).marginSymmetric(horizontal: 14,vertical: 6),
                          ),
                        ),
                      ],
                    ),

                  ),
                  addHeight(16),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
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
                                  addText500('Total Withdrawal',fontSize: 16,color: AppColors.blackColor),
                                ],
                              ),
                              addHeight(8),
                              addText500('₹5000',fontSize: 20,color: AppColors.blackColor)
                            ],
                          ),

                        ),
                      ),
                      addWidth(10),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
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
                                  addText500('Pending Income',fontSize: 16,color: AppColors.blackColor),
                                ],
                              ),
                              addHeight(8),
                              addText500('₹1500',fontSize: 20,color: AppColors.blackColor)
                            ],
                          ),

                        ),
                      ),
                    ],
                  ),


                  // Withdrawal History
                  addHeight(16),
                  addText500('Withdrawal History',fontSize: 16,color: AppColors.blackColor).marginOnly(bottom: 8),
                  ...List.generate(10, (index){
                    return build_text_tile(title: 'Michael Brown');
                  })
                ],
              ).marginSymmetric(horizontal: 20),
            ))



          ],
        ),
      ),
    );
  }
  build_text_tile({ String? title,bool upperBorder = false,bool lowerBorder = false,void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          if(upperBorder==true)
            const Divider(height: 0,thickness: 1,color: AppColors.textColor2,),
          Row(
            children: [

              // Divider(height: 0,),
              Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    color: Color(0xffD0E1EA),
                    shape: BoxShape.circle
                  ),
                  child: Image.asset(AppAssets.basicWashIcon).marginAll(8)),
              addWidth(10),
              addText500(title!.capitalize.toString(),fontSize: 14,color: AppColors.textColor4),
              Spacer(),
              addText400('₹1500',fontSize: 12,color: AppColors.blackColor),
              addWidth(10),
              addText400('Complete',fontSize: 12,color: AppColors.primaryColor)
            ],
          ),

          if(lowerBorder==true)
            const Divider(height: 0,thickness: 1,color: AppColors.textColor2,),
        ],
      ).marginOnly(bottom: 12),
    );

  }
}
