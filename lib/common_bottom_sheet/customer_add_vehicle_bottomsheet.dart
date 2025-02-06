import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/controllers/customer/customer_station_detail_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/app_routers.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/screens/customer/customer_select_slot_screen_.dart'; // Ensure you have GetX installed if you're using it

class CustomerAddVehicleBottomSheet {

  static void show(BuildContext context,
      {VoidCallback? onLogout, String? serviceName, String? amount, List<
          AddedVehicle>? addedVehicle}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: AppColors.primaryColor.withOpacity(0.5),
      backgroundColor: Colors.transparent,
      // Make background transparent for blur effect
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.8,
          builder: (BuildContext context, ScrollController scrollController) {
            return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) { {
              return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(
                        40)),
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [

                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Image.asset(
                                AppAssets.closeIcon, height: 16,
                                width: 16,
                                color: AppColors.blackColor,)),
                        ).marginOnly(right: 16),

                        addHeight(16),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.primaryLightColor,
                              borderRadius: BorderRadius.circular(500)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [

                                  Image.asset(
                                    serviceName == 'basic wash'.capitalize
                                        ? AppAssets.basicWashIcon
                                        : AppAssets.detailingIcon, height: 20,
                                    width: 20,),
                                  addWidth(10),
                                  addText500('$serviceName', fontSize: 15,
                                      color: AppColors.blackColor),

                                ],
                              ),
                              const Spacer(),
                              addText500('₹$amount', fontSize: 15,
                                  color: AppColors.blackColor)
                            ],
                          ).marginSymmetric(horizontal: 20, vertical: 12),

                        ),
                        addHeight(16),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: addText500('Select Vehicle', fontSize: 16,
                              color: AppColors.blackColor),
                        ),

                        addHeight(10),
                        ...List.generate(addedVehicle!.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              for (int i = 0; i < addedVehicle.length; i++) {
                                addedVehicle[i].isSelected = (i == index); // Set true for tapped item, false for others
                              }
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: addedVehicle[index].isSelected
                                      ? AppColors.primaryLightColor
                                      : AppColors.textColor2,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [

                                      Container(
                                          height: 40, width: 40,
                                          decoration: BoxDecoration(
                                              color: AppColors.whiteColor,
                                              borderRadius: BorderRadius
                                                  .circular(10)
                                          ),
                                          child: Image.asset(
                                              '${addedVehicle[index].image}')),
                                      addWidth(10),
                                      addText500('$serviceName', fontSize: 15,
                                          color: AppColors.blackColor),

                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                      height: 40, width: 40,
                                      decoration: BoxDecoration(
                                          color: AppColors.whiteColor,
                                          shape: BoxShape.circle
                                      ),
                                      child: SvgPicture.asset(
                                          AppAssets.deleteSlotSvg).marginAll(
                                          10)),
                                ],
                              ).marginSymmetric(horizontal: 20, vertical: 12),

                            ).marginOnly(bottom: 16),
                          );
                        }),


                        // addHeight(20),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoutes.addVehicleDetailCustomerScreen);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add,color: AppColors.primaryColor),
                              addText500('Add Vehicle',fontSize: 16,color: AppColors.primaryColor)
                            ],
                          ),
                        ),
                        addHeight(16),
                        AppButton(buttonText: 'Select Slot',onButtonTap: (){
                          Get.to(()=>CustomerSelectSlotScreen());
                        },),
                        addHeight(30)
                        // addHeight(20)
                      ],
                    ),
                  ),
                ),
              );
            }});
          },
        );
      },
    );
  }
}
