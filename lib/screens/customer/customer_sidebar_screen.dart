import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:levicon_carwash/common_bottom_sheet/delete_account_confirmation_bottomsheet.dart';
import 'package:levicon_carwash/common_bottom_sheet/logout_confirmation_bottomsheet.dart';
import 'package:levicon_carwash/resources/app_routers.dart';
import 'package:levicon_carwash/resources/local_storage.dart';
import 'package:levicon_carwash/resources/utils.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/screens/about_us_screen.dart';
import 'package:levicon_carwash/screens/customer/customer_profile_screen.dart';
import 'customer_address_screen.dart';

class CustomerSideBarScreen extends StatefulWidget {
  const CustomerSideBarScreen({super.key});

  @override
  State<CustomerSideBarScreen> createState() => _CustomerSidebarScreenState();
}

class _CustomerSidebarScreenState extends State<CustomerSideBarScreen> {
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

              addText600('Sidebar',fontSize: 18),
              backButton(isBackButton: false),

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
                        addText500('Michael Brown',fontSize: 14,color: AppColors.blackColor),
                        addText400('user@gmail.com',fontSize: 12,color: AppColors.textColor3)
                      ],
                    ),




                  ],
                ).marginSymmetric(horizontal: 20),
                addHeight(30),

                build_text_tile(imgPath: AppAssets.homeSidebar,title: 'home',upperBorder: true,
                    onTap: (){Get.back();}),

                build_text_tile(imgPath: AppAssets.addressSidebar,title: 'Addresses',onTap: (){
                  Get.to(()=>CustomerAddressScreen());
                }),
                build_text_tile(imgPath: AppAssets.aboutUsSidebar,title: 'About-Us',onTap: (){
                  Get.to(AboutUsScreen(barTitle: 'About Us'));
                }),
                build_text_tile(imgPath: AppAssets.orderSidebar,title: 'Terms & Conditions',onTap: (){
                  Get.to(AboutUsScreen(barTitle: 'Terms & Conditions'));
                }),

                build_text_tile(imgPath: AppAssets.contactUsSidebar,title: 'Contact Us',onTap: (){
                  Get.toNamed(AppRoutes.stationContactUsScreen);
                }),
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
