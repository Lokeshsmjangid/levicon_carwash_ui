import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/common_bottom_sheet/customer_delete_vehicle_bottom_sheet.dart';
import 'package:levicon_carwash/common_bottom_sheet/logout_confirmation_bottomsheet.dart';

import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/app_routers.dart';
import 'package:levicon_carwash/resources/local_storage.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';
import 'customer_edit_profile_.dart';


class CustomerProfileScreen extends StatefulWidget {
  const CustomerProfileScreen({super.key});

  @override
  State<CustomerProfileScreen> createState() => _CustomerProfileScreenState();
}

class _CustomerProfileScreenState extends State<CustomerProfileScreen> {
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
              backButton(isBackButton: false),
              // addWidth(100),
              addText600('Profile', fontSize: 18),
              logoutButton(onTap: () {
                LogoutConfirmationBottomSheet.show(context,onLogout: (){

                  LocalStorage().clearLocalStorage();
                  Get.offAllNamed(AppRoutes.chooseRole);

                });
              }),


            ],
          ).marginSymmetric(horizontal: 20),
          addHeight(20),


          Expanded(child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addHeight(20),

                Align(
                  alignment: Alignment.center,
                  child: CachedImageCircle(imageUrl: 'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250'),
                ),
                addHeight(30),

                addText500('Personal Information',fontSize: 18,color: AppColors.blackColor).marginOnly(bottom: 8),

                Stack(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLightColor,
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          addText500('Name',fontSize: 14,color: AppColors.blackColor),
                          addText400('Michal Brown',fontSize: 14,color: AppColors.primaryColor),

                          addText500('Mobile Number',fontSize: 14,color: AppColors.blackColor).marginOnly(top: 6),
                          addText400('+91 5986254785',fontSize: 14,color: AppColors.primaryColor),

                          addText500('Email',fontSize: 14,color: AppColors.blackColor).marginOnly(top: 6),
                          addText400('user@gmail.com',fontSize: 14,color: AppColors.primaryColor),


                        ],
                      ),

                    ),
                    Positioned(
                        right: 0,
                        child: GestureDetector(
                          onTap: (){
                            Get.to(CustomerEditProfileScreen());
                          },
                          child: Container(
                                                // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                                                decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(16)
                                                ),
                                                child: SvgPicture.asset(AppAssets.editSlotSvg,height: 20,width: 20,).marginSymmetric(vertical:6,horizontal: 16),
                                              ),
                        ))
                  ],
                ),
                addHeight(20),

                addText500('Add Vehicles',fontSize: 18,color: AppColors.blackColor).marginOnly(bottom: 8),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      // padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: AppColors.primaryLightColor,
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          addText500('1. Jaguar F-Pace',fontSize: 15),
                          Image.asset(AppAssets.jaguar,height: 24)
                        ],
                      ).marginSymmetric(horizontal: 16,vertical: 24),
                    ),

                    Positioned(
                        right: 10,
                        bottom: -12,
                        child: Row(
                      children: [
                        /*build_button(buttonText: 'Edit',onTap: (){
                          Get.toNamed(AppRoutes.addVehicleDetailCustomerScreen);
                        }),
                        addWidth(8),*/
                        build_button(buttonText: 'Delete',isDelete: true,onTap: (){
                          DeleteAccountConfirmationBottomSheet.show(context,onDelete: (){});
                        })
                      ],
                    ))
                  ],
                ),




                // Add New Vehicles
                addHeight(42),
                Align(
                   alignment: Alignment.center,
                    child: GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoutes.addVehicleDetailCustomerScreen);
                        },
                        child: addText500('Add New Vehicles',decoration: TextDecoration.underline,fontSize: 16,color: AppColors.primaryColor)))

                /*...List.generate(1, (index) {
                  return Container(
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(

                                decoration: BoxDecoration(
                                    color: AppColors.blackColor,
                                    borderRadius: BorderRadius.circular(25)),
                                child: addText500('See Pictures', fontSize: 16,
                                    color: AppColors.whiteColor)
                                    .marginSymmetric(
                                    horizontal: 14, vertical: 4),
                              ), addWidth(10),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: addText500('Completed', fontSize: 16,
                                      color: AppColors.whiteColor)
                                      .marginSymmetric(
                                      horizontal: 16, vertical: 4),
                                ),
                              ),
                            ],
                          )

                      ],
                    ),
                  ).marginOnly(bottom: 16, top: index == 0 ? 14 : 0);
                })*/
              ],
            ).marginSymmetric(horizontal: 20),
          ))
        ],
      ),
    );
  }

  Widget buildRoundedImage(String imageUrl, {Color borderColor = Colors.blueAccent}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), // Rounded corners
        border: Border.all(color: borderColor, width: 2), // Border color
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12), // Match rounded corners
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover, // Cover entire container
        ),
      ),
    );
  }

  build_button({String? buttonText, bool isDelete = false,void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        decoration: BoxDecoration(
            color: isDelete?AppColors.blackColor:AppColors.primaryColor,
            borderRadius: BorderRadius.circular(25)),
        child: addText500(buttonText!, fontSize: 16,
            color: AppColors.whiteColor)
            .marginSymmetric(
            horizontal: 14, vertical: 4),
      ),
    );
  }


}
