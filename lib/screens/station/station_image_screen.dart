import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/dialogues/car_station/contact_us_dialogue.dart';
import 'package:levicon_carwash/dialogues/car_station/password_change_done_dialogue.dart';
import 'package:levicon_carwash/dialogues/car_station/profile_creation_done_dialogue.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';

import 'station_forgot_password_screen.dart';

class StationImageScreen extends StatefulWidget {
  const StationImageScreen({super.key});

  @override
  State<StationImageScreen> createState() => _StationImageScreenState();
}

class _StationImageScreenState extends State<StationImageScreen> {


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
                backButton(onTap: () {
                  Get.back();
                }),
                addText600('Station Images', fontSize: 18),

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

                  DynamicImageLayout(
                    // List of image URLs or asset paths
                    images: const [
                      AppAssets.galleryImage,
                      AppAssets.galleryImage2,
                      AppAssets.galleryImage,
                      AppAssets.galleryImage2,
                    ],
                  ),
                  addHeight(16),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.uploadIcon,height: 24,width: 24,color: AppColors.primaryColor,),
                      addWidth(8),
                      addText600('Upload more images'.capitalize.toString(),fontSize: 16,color: AppColors.primaryColor)
                    ],
                  ),
                  addHeight(16),

                  AppButton(buttonText: 'Submit')
                ],
              ).marginSymmetric(horizontal: 20),
            ))



          ],
        ),
      ),
    );
  }

}
class DynamicImageLayout extends StatefulWidget {
  final List<String> images;

  DynamicImageLayout({required this.images});

  @override
  State<DynamicImageLayout> createState() => _DynamicImageLayoutState();
}

class _DynamicImageLayoutState extends State<DynamicImageLayout> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Use indices to control image placement
          for (int i = 0; i < widget.images.length; i += 2)
            Row(
              children: [
                Expanded(
                  flex: _getFlexForIndex(i),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            widget.images[i],
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ).marginOnly(bottom: 8),
                      Positioned(
                          top: 4,
                          right: 4,
                          child: GestureDetector(
                              onTap: (){
                                widget.images.removeAt(i);
                                setState(() {});
                              },
                              child: Icon(Icons.cancel,color: AppColors.primaryLightColor,)))
                    ],
                  ),
                ),
                  if (i + 1 < widget.images.length) ...[
                  const SizedBox(width: 8),
                  Expanded(
                    flex: _getFlexForIndex(i + 1),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              widget.images[i + 1],
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ).marginOnly(bottom: 8),
                        const Positioned(
                            top: 4,
                            right: 4,
                            child: Icon(Icons.cancel,color: AppColors.primaryLightColor,))
                      ],
                    ),
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