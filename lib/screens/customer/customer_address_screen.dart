import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:levicon_carwash/controllers/current_address_controller.dart';
import 'package:levicon_carwash/controllers/customer/customer_addresses_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/resources/utils.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/text_utility.dart';

import 'customer_add_address_screen.dart';

class CustomerAddressScreen extends StatefulWidget {


  CustomerAddressScreen({super.key});

  @override
  State<CustomerAddressScreen> createState() => _CustomerSidebarScreenState();
}

class _CustomerSidebarScreenState extends State<CustomerAddressScreen> {
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
              backButton(onTap: () {
                Get.back();
              }),
              addText600('Address', fontSize: 18),
              backButton(isBackButton: false),


            ],
          ).marginSymmetric(horizontal: 20),
          addHeight(16),
          CustomTextField(
            fillColor: AppColors.whiteColor,
            hintColor: AppColors.textFieldHintColor,
            hintText: 'Search Location',
            suffixIcon: Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle
              ),
              child: Icon(
                Icons.search, size: 20, color: AppColors.whiteColor,)
                  .marginAll(6),
            ),

          ).marginOnly(left: 20, right: 20, bottom: 10),
          Expanded(
            child: GetBuilder<CustomerAddressesCtrl>(builder: (logic) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    addHeight(10),
                    build_tile(
                        child: Image.asset(AppAssets.currentLocationIcon),
                        text: 'Use my current location',
                        onTap: () {
                          Get.find<CurrentAddressController>().fetchLocation();
                          Get.back();
                        }),
                    build_tile(
                        child: Icon(Icons.add, color: AppColors.primaryColor,),
                        text: 'Add new address',
                        onTap: () {
                          Get.to(CustomerAddAddressScreen())?.then((value) {
                            print(
                                'value::::$value::::::location::${value['location']}');
                          });
                        }),

                    addText500('Saved Address', color: AppColors.textColor1).marginOnly(
                        left: 20, right: 20, bottom: 20),

                    // build_address_box(addressType: 'Work',isSelected: true,fullAddress: 'JPloft, Mansarovar Extention, Jaipur, Rajasthan 302020'),
                    // build_address_box(addressType: 'Home',isSelected: false,fullAddress: 'JPloft, Mansarovar Extention, Jaipur, Rajasthan 302020'),

                    ...List.generate(logic.savedAddress.length, (index) {
                      return build_address_box(
                          addressType: '${logic.savedAddress[index].addressType}',
                          isSelected: logic.savedAddress[index].isSelected!,
                          fullAddress: '${logic.savedAddress[index].fullAddress}',
                          onTapEdit: (){},
                          onTapDelete: (){
                            logic.savedAddress.removeAt(index);
                            logic.update();
                          });
                    })

                    ,addHeight(70)

                  ],
                ),
              );
            }),
          )
        ],
      ),
      bottomSheet: AppButton(buttonText: 'Submit').marginOnly(
          left: 16, right: 16, bottom: 16),
    );
  }

  build_tile({Widget? child, String? text, void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
              width: 16,
              height: 24,
              child: child),
          addWidth(10),
          addText500('$text', fontSize: 14, color: AppColors.primaryColor)
        ],
      ).marginOnly(left: 20, right: 20, bottom: 16),
    );
  }

  build_address_box(
      {String? addressType, String? fullAddress, bool isSelected = false,void Function()? onTapEdit,void Function()? onTapDelete}) {
    return Container(
      width: MediaQuery
          .sizeOf(context)
          .width,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLightColor : AppColors
              .textColor2,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: isSelected ? AppColors.primaryColor : AppColors
                  .containerBorderColor)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(addressType == 'Home'
                      ? AppAssets.addressHomeIcon
                      : AppAssets.addressOfficeIcon)),
              addWidth(10),
              addText500(
                  '$addressType', fontSize: 16, color: AppColors.blackColor),
              Spacer(),
              buildPopUp(onTapEdit: onTapEdit,onTapDelete: onTapDelete)
            ],
          ),
          addHeight(4),
          addText400(
              '${fullAddress}', fontSize: 14, color: AppColors.textColor1),


        ],
      ),

    ).marginOnly(left: 20, right: 20, bottom: 20);
  }

  buildPopUp({void Function()? onTapEdit,void Function()? onTapDelete}) {
    return Container(
      height: 20,
      width: 20,
      child: PopupMenuButton(

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.zero,
          icon: Icon(Icons.more_vert),
          offset: Offset(0, 22),
          tooltip: 'Delete or Edit Address',
          shadowColor: AppColors.containerBorderColor,

          //add offset to fix it
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                  onTap: onTapEdit,
                  height: 30,
                  padding: EdgeInsets.only(left: 12),
                  value: 'Edit',
                  child: addText400('Edit',
                      fontSize: 14,
                      color: AppColors.blackColor)),
              PopupMenuItem(
                  onTap: onTapDelete,
                  height: 30,
                  padding: EdgeInsets.only(left: 12),
                  value: 'Delete',
                  child: addText400('Delete',
                      fontSize: 14,
                      color: AppColors.blackColor)),

            ];
          }),
    );
  }


}