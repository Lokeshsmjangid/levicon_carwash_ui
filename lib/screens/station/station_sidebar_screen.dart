import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/common_bottom_sheet/delete_account_confirmation_bottomsheet.dart';
import 'package:levicon_carwash/common_bottom_sheet/logout_confirmation_bottomsheet.dart';
import 'package:levicon_carwash/controllers/dashboard_controller.dart';
import 'package:levicon_carwash/dialogues/car_station/reject_reason_dialogue.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/app_routers.dart';
import 'package:levicon_carwash/resources/local_storage.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';
import 'package:levicon_carwash/screens/customer/customer_sidebar_screen.dart';
import 'package:levicon_carwash/screens/station/station_notification_screen.dart';

import 'order/station_order_history_screen.dart';
import 'station_contact_us.dart';
import 'station_manage_earnings_screen.dart';
import 'station_manage_service_screen.dart';
import 'station_profile_screen.dart';
import 'station_reviews_rating_screen.dart';
import 'station_schedule_time_slots_screen.dart';

class StationSideBarScreen extends StatefulWidget {
  const StationSideBarScreen({super.key});

  @override
  State<StationSideBarScreen> createState() => _StationBookingHistoryScreenState();
}

class _StationBookingHistoryScreenState extends State<StationSideBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          addHeight(52),
          Row(

            children: [
              backButton(onTap: (){Get.back();}),
              addWidth(100),
              addText600('Sidebar',fontSize: 18),


            ],
          ).marginSymmetric(horizontal: 20),
          addHeight(20),
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 44,width: 44,
                      decoration: const BoxDecoration(shape: BoxShape.circle),

                      child: Image.asset(AppAssets.personImage),
                    ),
                    addWidth(14),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addText500('Robin Tga',fontSize: 14,color: AppColors.blackColor),
                        addText400('Test@gmail.com',fontSize: 12,color: AppColors.textColor3)
                      ],
                    ),

                  ],
                ).marginSymmetric(horizontal: 20),
                addHeight(30),

                build_text_tile(imgPath: AppAssets.homeSidebar,title: 'home',upperBorder: true,onTap: (){
                  Get.back();
                  Get.find<DashboardController>().selectedIndex = 0;
                  Get.find<DashboardController>().update();

                }),

                build_text_tile(imgPath: AppAssets.orderSidebar,title: 'Order History',onTap: (){
                  Get.to(()=>const StationOrderHistoryScreen());
                }),

                build_text_tile(imgPath: AppAssets.reviewRatingSidebar,title: 'Reviews and Ratings',onTap: (){
                  Get.to(()=>StationReviewsRatingScreen());
                }),

                build_text_tile(imgPath: AppAssets.timeSlotSidebar,title: 'Time Slots',onTap: (){
                  Get.to(()=>const StationScheduleTimeSlotScreen());
                }),

               /* build_text_tile(imgPath: AppAssets.earningSidebar,title: 'Manage Earnings',onTap: (){
                  Get.to(()=>StationManageEarningsScreen());
                }),*/

                build_text_tile(imgPath: AppAssets.contactUsSidebar,title: 'Manage Services',onTap: (){
                  Get.to(()=>StationManageServiceScreen());
                }),

                build_text_tile(imgPath: AppAssets.contactUsSidebar,title: 'Contact Us',onTap: (){
                  Get.to(()=>StationContactUsScreen());}),

                build_text_tile(imgPath: AppAssets.logoutSidebar,title: 'Log Out',lowerBorder: false,onTap: (){
                  LogoutConfirmationBottomSheet.show(context,onLogout: (){
                    LocalStorage().clearLocalStorage();
                    Get.offAllNamed(AppRoutes.chooseRole);
                  });
                }),
                addHeight(30)
              ],
            ),
          ))
        ],
      ),
      bottomSheet: Container(
        color: AppColors.whiteColor,
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: (){
                  DeleteAccountConfirmationBottomSheet.show(context,onDelete: (){
                    showToastError('Action Pending');
                  });
                },
                child: addText500('Delete Account',fontSize: 14,color: AppColors.redColor1)),
          ],
        ).marginOnly(bottom: 24),
      ),
    );
  }

  build_text_tile({String? imgPath, String? title,bool upperBorder = false,bool lowerBorder = true,void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          if(upperBorder==true)
          const Divider(height: 0,thickness: 1,color: AppColors.textColor2,),
          Row(
            children: [

              // Divider(height: 0,),
              Image.asset(imgPath!,width: 20,height: 20),
              addWidth(10),
              addText500(title!.capitalize.toString(),fontSize: 14,color: AppColors.textColor1)
            ],
          ).marginSymmetric(vertical: 14,horizontal: 20),

          if(lowerBorder==true)
          const Divider(height: 0,thickness: 1,color: AppColors.textColor2,),
        ],
      ),
    );

  }

}
