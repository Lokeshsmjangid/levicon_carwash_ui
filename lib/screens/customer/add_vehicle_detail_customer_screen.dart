import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/common_bottom_sheet/station_choose_profile_picture_bottom_sheet.dart';
import 'package:levicon_carwash/controllers/customer/add_vehicle_detail_customer_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';
import 'package:levicon_carwash/custom_widgets/custom_dropdown.dart';
import 'package:levicon_carwash/custom_widgets/custom_dropdown_with_image.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/dialogues/customer/customer_vehicle_add_done_dialogue.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';
import 'package:levicon_carwash/screens/deshboard_screen.dart';



class AddVehicleDetailCustomerScreen extends StatefulWidget {
  const AddVehicleDetailCustomerScreen({super.key});

  @override
  State<AddVehicleDetailCustomerScreen> createState() =>
      _AddVehicleDetailCustomerScreenState();
}

class _AddVehicleDetailCustomerScreenState
    extends State<AddVehicleDetailCustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: AppScreen(
        child: Column(
          children: [
            addHeight(52),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    backButton(onTap: () {
                      Get.back();
                    }),
                    addHeight(4),
                    GetBuilder<AddVehicleDetailCustomerCtrl>(builder: (logic) {
                      return addText500(
                          'Add Your Vehicles Details', fontSize: 18);
                    }),
                  ],
                ),
                const Spacer(),
                // GestureDetector(
                //     onTap: (){
                //     },
                //     child: addText500('Skip', fontSize: 15, color: AppColors.primaryColor)),
              ],
            ).marginSymmetric(horizontal: 20),
            addHeight(20),

            Expanded(child: GetBuilder<AddVehicleDetailCustomerCtrl>(builder: (logic) {
              return SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addText500('Brand', fontSize: 14, color: AppColors.textColor1).marginOnly(bottom: 8),
                    // CustomTextField(
                    //   hintText: 'Vehicle Brand',
                    //   controller:logic.brandCtrl,
                    //   hintColor: AppColors.textFieldHintColor,
                    //   keyboardType: TextInputType.text,
                    //   inputFormatters: [
                    //     FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                    //     LengthLimitingTextInputFormatter(20),
                    //   ],
                    // ),

                    CustomDropdownWithImageButton(
                        searchController: logic.brandCtrl,
                        // search controller
                        hintText: 'Select Brand',
                        searchHintText: 'Search Brand',
                        items: logic.brandList,
                        // pass your list here
                        value: logic.selectedBrand,
                        // initial value
                        displayText: (item) => '${item.vehicleBrand?.capitalizeFirst}',
                        displayImage: (item ) => '${item.imgPath}',
                        onChanged: (val) {
                          logic.selectedBrand = val;
                          logic.update();

                          // logic.fetchVehicleModalByBrandId(brand_Id: logic.selectedVehicleBrand?.id,isEditVehicle: false);
                        }
                    ),

                    addHeight(16),

                    addText500('Model', fontSize: 14, color: AppColors.textColor1).marginOnly(bottom: 8),
                    /*CustomTextField(
                      hintText: 'Vehicle Model',
                      controller:logic.modelCtrl,
                      hintColor: AppColors.textFieldHintColor,
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z  \\-]")),
                        LengthLimitingTextInputFormatter(20),
                      ],
                    ),*/

                    CustomDropdownWithImageButton(
                        searchController: logic.modelCtrl,
                        // search controller
                        hintText: 'Select Model',
                        searchHintText: 'Search Model',
                        items: logic.modelList,
                        // pass your list here
                        value: logic.selectedBrandModel,
                        // initial value
                        displayText: (item) => '${item.vehicleModel?.capitalizeFirst}',
                        displayImage: (item ) => '${item.imgPath}',
                        onChanged: (val) {
                          logic.selectedBrandModel = val;
                          logic.update();

                          // logic.fetchVehicleModalByBrandId(brand_Id: logic.selectedVehicleBrand?.id,isEditVehicle: false);
                        },
                    ),
                    addHeight(16),

                    addText500('License Plate', fontSize: 14, color: AppColors.textColor1).marginOnly(bottom: 8),
                    CustomTextField(
                      hintText: 'License Plate',
                      controller:logic.licenseCtrl,
                      hintColor: AppColors.textFieldHintColor,
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                        LengthLimitingTextInputFormatter(20),
                      ],
                    ),
                    addHeight(16),

                    addText500('Year of Manufacture', fontSize: 14, color: AppColors.textColor1).marginOnly(bottom: 8),
                    CustomDropdownButton2(
                        searchController: logic.yrSearchCtrl,
                        // search controller
                        hintText: 'Enter Year of Manufacture',
                        searchHintText: 'Search year',
                        items: logic.yearList??[],
                        // pass your list here
                        value: logic.selectedYear,
                        // initial value
                        displayText: (item) => '$item',
                        onChanged: (val) {
                          logic.selectedYear = val;
                          logic.update();

                          // logic.fetchVehicleModalByBrandId(brand_Id: logic.selectedVehicleBrand?.id,isEditVehicle: false);
                        }
                    ),
                    addHeight(16),

                    addText500('Vehicle Color', fontSize: 14, color: AppColors.textColor1).marginOnly(bottom: 8),
                    CustomTextField(
                      hintText: 'Enter Color Name',
                      controller:logic.vehicleColorCtrl,
                      hintColor: AppColors.textFieldHintColor,
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                        LengthLimitingTextInputFormatter(20),
                      ],
                    ),
                    addHeight(16),

                    addText500('Upload Image', fontSize: 14, color: AppColors.textColor1).marginOnly(bottom: 8),
                    if(logic.selectedImage!=null)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Stack(
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                // shape: BoxShape.circle,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: AppColors.redColor1),
                                  image: DecorationImage(
                                    image: logic.selectedImage != null
                                        ? FileImage(File(logic.selectedImage!
                                        .path)) // Use FileImage for file input
                                        : AssetImage(
                                        AppAssets.profilePicture) as ImageProvider,
                                    // Use AssetImage for default
                                    fit: BoxFit.cover,
                                  )
                              ),
                              child: null,
                            ),
                            Positioned(
                                top: 4,
                                right: 4,
                                child: GestureDetector(
                                    onTap: (){
                                      logic.selectedImage = null;
                                      logic.update();
                                    },
                                    child: Icon(Icons.cancel,color: AppColors.primaryColor)))
                          ],
                        ),
                      ).marginOnly(bottom: 8),

                    if(logic.selectedImage == null)
                      uploadButton(onTap: (){
                        ChooseProfilePictureBottomSheet.show(context, 'AddVehicleDetail');
                      }),
                    addHeight(16),


                    AppButton(
                      buttonText: 'Submit',
                      onButtonTap: (){
                      CustomerVehicleAddSuccessDialog.show(context,onTap: (){Get.offAll(DashBoardScreen());});}),
                    addHeight(24),
                  ],
                ).marginSymmetric(horizontal: 20),
              );
            }))
          ],
        ),
      ),
    );
  }
}
