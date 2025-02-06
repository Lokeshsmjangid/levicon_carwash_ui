import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:levicon_carwash/controllers/car_station/station_profile_information_ctrl.dart';
import 'package:levicon_carwash/controllers/car_station/station_signup_ctrl.dart';
import 'package:levicon_carwash/controllers/customer/add_vehicle_detail_customer_ctrl.dart';
import 'package:levicon_carwash/controllers/customer/customer_edit_profile_ctrl.dart';
import 'package:levicon_carwash/controllers/customer/customer_profile_creation_ctrl.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';


class ChooseProfilePictureBottomSheet {
  static void show(BuildContext context, String? screenName) {
    showModalBottomSheet(
      context: context,
      barrierColor: AppColors.primaryColor.withOpacity(0.5),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (_) => ChooseProfilePictureBottomSheetWidget(fromScreen: screenName),
    );
  }
}

class ChooseProfilePictureBottomSheetWidget extends StatelessWidget {
  final String? fromScreen;

  ChooseProfilePictureBottomSheetWidget({this.fromScreen});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            addText500(
              'Select Image',
              fontSize: 20,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOption(
                  icon: AppAssets.tripodIcon,
                  label: "Camera",
                  onTap: () => _pickImage(ImageSource.camera, context,screen: fromScreen),
                ),
                _buildOption(
                  icon: AppAssets.galleryIcon,
                  label: "Gallery",
                  onTap: () => _pickImage(ImageSource.gallery, context,screen: fromScreen),
                ),
              ],
            ),
      
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildOption({required String icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(icon, height: 52, width: 52,color: AppColors.primaryColor,),
          addHeight(2),
          addText400(
            label,
            fontSize: 16,height: 1.4
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage(ImageSource source, BuildContext context,{String? screen}) async {
      Get.back(); // Close bottom sheet
      if(screen=='StationProfileInfo'){
        final prCtrl = Get.find<StationProfileInformationCtrl>();
        prCtrl.selectedImage = await prCtrl.pickImage(source);
        prCtrl.update();
      } else if(screen=='CustomerProfileCreation'){
        final customerSignUpCtrl = Get.find<CustomerProfileCreationCtrl>();
        customerSignUpCtrl.selectedImage = await customerSignUpCtrl.pickImage(source);
        customerSignUpCtrl.update();
      } else if(screen=='CustomerEditProfile'){
        final customerEditProfileCtrl = Get.find<CustomerEditProfileCtrl>();
        customerEditProfileCtrl.selectedImage = await customerEditProfileCtrl.pickImage(source);
        customerEditProfileCtrl.update();
      } else if(screen=='StationCreateAccount'){
        final stationCreateAccountCtrl = Get.find<StationSignupCtrl>();
        stationCreateAccountCtrl.selectedImage = await stationCreateAccountCtrl.pickImage(source);
        stationCreateAccountCtrl.update();
      } else if(screen=='AddVehicleDetail'){
        final addVehicleDetailCtrl = Get.find<AddVehicleDetailCustomerCtrl>();
        addVehicleDetailCtrl.selectedImage = await addVehicleDetailCtrl.pickImage(source);
        addVehicleDetailCtrl.update();
      }

  }
}
