import 'dart:io';

import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:levicon_carwash/common_bottom_sheet/logout_confirmation_bottomsheet.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/app_routers.dart';
import 'package:levicon_carwash/resources/local_storage.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';

import 'station_bank_information.dart';
import 'station_image_screen.dart';
import 'station_profile_information.dart';

class StationProfileScreen extends StatefulWidget {
  const StationProfileScreen({super.key});

  @override
  State<StationProfileScreen> createState() => _StationProfileScreenState();
}

class _StationProfileScreenState extends State<StationProfileScreen> {


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
              backButton(isBackButton:false),
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

                // Align(
                //   alignment: Alignment.center,
                //   child: Container(
                //     height: 150,
                //     width: 150,
                //     decoration: const BoxDecoration(
                //       shape: BoxShape.circle
                //     ),
                //     child: Image.asset(AppAssets.profilePicture),
                //   ),
                // ),
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
                          addText500('Car Station Name',fontSize: 14,color: AppColors.blackColor),
                          addText400('Car Station',fontSize: 14,color: AppColors.primaryColor),

                          addText500('Station Address',fontSize: 14,color: AppColors.blackColor).marginOnly(top: 6),
                          addText400('Bengaluru Urban, Karnataka',fontSize: 14,color: AppColors.primaryColor),

                          addText500('GST  (Optional)',fontSize: 14,color: AppColors.blackColor).marginOnly(top: 6),
                          addText400('5655',fontSize: 14,color: AppColors.primaryColor),

                          addText500('Owner Name (Optional)',fontSize: 14,color: AppColors.blackColor).marginOnly(top: 6),
                          addText400('Vijay',fontSize: 14,color: AppColors.primaryColor),

                          addText500('Email Address (Optional)',fontSize: 14,color: AppColors.blackColor).marginOnly(top: 6),
                          addText400('Stations@gmail.com',fontSize: 14,color: AppColors.primaryColor),

                          addText500('Mobile Number',fontSize: 14,color: AppColors.blackColor).marginOnly(top: 6),
                          addText400('+91 5986254785',fontSize: 14,color: AppColors.primaryColor),

                          addText500('Password',fontSize: 14,color: AppColors.blackColor).marginOnly(top: 6),
                          addText400('***********',fontSize: 14,color: AppColors.primaryColor),
                        ],
                      ),

                    ),
                    Positioned(
                        right: 0,
                        child: GestureDetector(
                          onTap: (){
                            Get.to(()=>const StationProfileInformationScreen());
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

                // Bank Detail
                addHeight(20),
                addText500('Bank Information',fontSize: 18,color: AppColors.blackColor).marginOnly(bottom: 8),

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
                          addText500('Bank Name',fontSize: 14,color: AppColors.blackColor),
                          addText400('Yes Bank',fontSize: 14,color: AppColors.primaryColor),

                          addText500('Account Holder Name',fontSize: 14,color: AppColors.blackColor).marginOnly(top: 6),
                          addText400('Vijay',fontSize: 14,color: AppColors.primaryColor),

                          addText500('Account Number',fontSize: 14,color: AppColors.blackColor).marginOnly(top: 6),
                          addText400('589658445455',fontSize: 14,color: AppColors.primaryColor),

                          addText500('IFSC Code',fontSize: 14,color: AppColors.blackColor).marginOnly(top: 6),
                          addText400('DLKSEJC558X',fontSize: 14,color: AppColors.primaryColor),
                        ],
                      ),

                    ),
                    Positioned(
                        right: 0,
                        child: GestureDetector(
                          onTap: (){
                            Get.to(()=>const StationBankDetailScreen());
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
                addText500('Station Images',fontSize: 18,color: AppColors.blackColor).marginOnly(top: 8,bottom: 8),

                Stack(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: AppColors.primaryLightColor,
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: DynamicImageLayout(
                        // List of image URLs or asset paths
                        images: const [
                          AppAssets.galleryImage,
                          AppAssets.galleryImage2,
                          AppAssets.galleryImage,
                          AppAssets.galleryImage2,
                        ],
                      ),
                    ),
                    Positioned(
                        right: 0,
                        child: GestureDetector(
                          onTap: (){
                            Get.to(()=>StationImageScreen());
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
                addHeight(24)

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
}


class DynamicImageLayout extends StatelessWidget {
  final List<String> images;

  DynamicImageLayout({required this.images});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Use indices to control image placement
          for (int i = 0; i < images.length; i += 2)
            Row(
              children: [
                Expanded(
                  flex: _getFlexForIndex(i),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        images[i],
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ).marginOnly(bottom: 8),
                ),
                if (i + 1 < images.length) ...[
                  SizedBox(width: 8),
                  Expanded(
                    flex: _getFlexForIndex(i + 1),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          images[i + 1],
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ).marginOnly(bottom: 8),
                  ),
                ],
              ],
            ),
        ],
      ),
    );
  }

  /// Determines the flex value for each index
  int _getFlexForIndex(int index) {
    if (index == 2) return 1; // Smaller image
    if (index==0 || index == 3) return 2; // Larger image
    return 1; // Default equal flex for top-row images
  }
}