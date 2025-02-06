import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';



class StationNotificationScreen extends StatefulWidget {
  const StationNotificationScreen({super.key});

  @override
  State<StationNotificationScreen> createState() => _StationNotificationScreenState();
}

class _StationNotificationScreenState extends State<StationNotificationScreen> {
  SlidableController? controller;


  int? sliderINdex;
  final List<String> items =
  new List<String>.generate(80, (i) => "Item ${i + 1}");




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
                  ).marginSymmetric(horizontal: 20),
                  ...List.generate(items.length, (index){
                    return Container(
                      color: sliderINdex==index?AppColors.primaryColor:AppColors.whiteColor,
                      child: Dismissible(
                          key: Key(items[index]),
                          dismissThresholds: {
                            DismissDirection.endToStart: 0.2,  // Requires only 20% drag to dismiss
                          },
                          onDismissed: (direction) {
                            items.removeAt(index);
                          },
                          onUpdate: (val){
                            print('lok ${val.progress}');

                            if(val.progress>0.0){
                              // isSlide = true;
                              sliderINdex = index;
                            }else{
                              // isSlide = false;
                              sliderINdex = null;
                            }
                            setState(() {});
                          },
                          background: slideLeftBackground(),
                          child: build_text_tile(title: 'Michael Brown',index: index)).marginSymmetric(horizontal: 20),
                    );
                    return Slidable(
                      controller: controller,
                        key: ValueKey(index),
                        endActionPane: ActionPane(
                          extentRatio: 0.2,
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {},
                              backgroundColor: AppColors.primaryColor,
                              foregroundColor: Colors.white,
                              icon: Icons.delete_outline_sharp,
                              // label: 'Delete',
                            )
                          ],
                        ),
                        child: build_text_tile(title: 'Michael Brown'));

                  })
                ],
              ),
            ))

          ],
        ),
      ),
    );

  }
  Widget slideLeftBackground() {
    return Container(
      color: AppColors.primaryColor,
      child: Align(
        child: SvgPicture.asset(AppAssets.deleteSlotSvg,color: AppColors.whiteColor,height: 20,width: 20,),
        alignment: Alignment.centerRight,
      ),
    );
  }

  build_text_tile({ String? title,bool upperBorder = false,bool lowerBorder = false,void Function()? onTap,int? index}) {
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
                    // color: Color(0xffD0E1EA),
                    color: sliderINdex==index?AppColors.whiteColor:Color(0xffD0E1EA),
                    shape: BoxShape.circle
                  ),
                  child: Image.asset(AppAssets.basicWashIcon).marginAll(8)),
              addWidth(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addText500(title!.capitalize.toString(),fontSize: 13,color: sliderINdex==index?AppColors.whiteColor:AppColors.textColor4),
                  Row(
                    children: [
                      Image.asset(AppAssets.detailingIcon,color: sliderINdex==index?AppColors.whiteColor:null,height: 16,width: 16,),addWidth(4),
                      addText400('detailing'.capitalize.toString(),fontSize: 12,color: sliderINdex==index?AppColors.whiteColor:AppColors.blackColor),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  addText400('5s',fontSize: 12,color: sliderINdex==index?AppColors.whiteColor:AppColors.textColor1),
                  Row(

                    children: [
                      addText400('Accept',fontSize: 12,color: sliderINdex==index?AppColors.whiteColor:AppColors.primaryColor),addWidth(20),
                      addText400('Reject',fontSize: 12,color: sliderINdex==index?AppColors.whiteColor:AppColors.redColor),
                    ],
                  ),
                ],
              ).marginOnly(right: 6),

            ],
          ),

          if(lowerBorder==true)
            const Divider(height: 0,thickness: 1,color: AppColors.textColor2,),
        ],
      ).marginOnly(bottom: 12),
    );

  }



}
