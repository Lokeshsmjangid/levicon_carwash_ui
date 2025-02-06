import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';

class CustomerNotificationScreen extends StatefulWidget {
  const CustomerNotificationScreen({super.key});

  @override
  State<CustomerNotificationScreen> createState() => _CustomerNotificationScreenState();
}

class _CustomerNotificationScreenState extends State<CustomerNotificationScreen> {


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
                // backButton(isBackButton: false),

                addText600('Notification', fontSize: 18),
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



                  // Recent Notifications
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addText500('Recent Notifications',fontSize: 16,color: AppColors.blackColor).marginOnly(bottom: 8),
                      addText500('Clear all',fontSize: 16,
                          color: AppColors.primaryColor,decoration: TextDecoration.underline).marginOnly(bottom: 8),
                    ],
                  ),
                  ...List.generate(10, (index){
                    return build_text_tile(title: 'Your booking with Sparkle Auto Wash is successfully confirmed!',
                        subtitle: 'Thank you for choosing Sparkle Auto Wash! Our team will arrive 10 minutes before the scheduled time; for any changes, contact +1 (555) 123-4567.');
                  })
                ],
              ).marginSymmetric(horizontal: 20),
            ))

          ],
        ),
      ),
    );
  }
  build_text_tile({ String? title,String? subtitle,bool upperBorder = false,bool lowerBorder = false,void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if(upperBorder==true)
            const Divider(height: 0,thickness: 1,color: AppColors.textColor2,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addText500(title!.capitalize.toString(),fontSize: 13,color: AppColors.textColor4),
                    addText400(subtitle!.capitalize.toString(),fontSize: 11,color: AppColors.textColor4),

                  ],
                ),
              ),
              addWidth(10),
              addText400('5s',fontSize: 13,color: AppColors.textColor4)

            ],
          ),

          if(lowerBorder==true)
            const Divider(height: 0,thickness: 1,color: AppColors.textColor2,),
        ],
      ).marginOnly(bottom: 12),
    );

  }
}
