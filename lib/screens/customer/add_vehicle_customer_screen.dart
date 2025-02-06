import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/controllers/customer/add_vehicle_customer_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/models/vehicle_brand_model.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/app_routers.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';
import 'package:levicon_carwash/screens/deshboard_screen.dart';

import 'customer_home_screen.dart';

class AddVehicleCustomerScreen extends StatefulWidget {
  const AddVehicleCustomerScreen({super.key});

  @override
  State<AddVehicleCustomerScreen> createState() =>
      _AddVehicleCustomerScreenState();
}

class _AddVehicleCustomerScreenState extends State<AddVehicleCustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: AppScreen(
        child: GetBuilder<AddVehicleCustomerCtrl>(builder: (logic) {
          return Column(
            children: [
              addHeight(78),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addText500('Add Your Vehicles \nBrand', fontSize: 18),
                  const Spacer(),
                  if(logic.showSkip==true)
                  GestureDetector(
                      onTap: () {
                        Get.offAll(() => const DashBoardScreen());
                      },
                      child: addText500(
                          'Skip', fontSize: 15, color: AppColors.primaryColor)),
                ],
              ).marginSymmetric(horizontal: 20),

              addHeight(20),

              CustomTextField(
                hintColor: AppColors.textFieldHintColor,
                hintText: 'Search your car brand',
                suffixIcon: Container(
                  decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle
                  ),
                  child: const Icon(
                    Icons.search, size: 20, color: AppColors.whiteColor,)
                      .marginAll(6),
                ),

              ).marginSymmetric(horizontal: 20),
              addHeight(16),

              Expanded(
                // height: MediaQuery
                //     .sizeOf(context)
                //     .height*0.77,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      GridView.count(
                        crossAxisCount: 3,
                        physics: const BouncingScrollPhysics(),
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        children: logic.brandList
                            .asMap()
                            .entries
                            .map((entry) {
                          int index = entry.key; // Get the index
                          VehicleBrand brand = entry
                              .value; // Get the brand object

                          return GestureDetector(
                            onTap: () {
                              logic.selectedBrand = [];
                              logic.selectedIndex = index;
                              // Set the selected brand
                              logic.selectedBrand.add(logic.brandList[index]);
                              logic.update();
                              // You can also use the index if needed
                              print('Selected brand index: $index');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: logic.selectedIndex == index ? AppColors
                                    .primaryColor.withOpacity(0.12) : AppColors
                                    .whiteColor,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: logic.selectedIndex == index
                                        ? AppColors.primaryColor
                                        : AppColors.containerBorderColor),
                                boxShadow: [boxShadow()],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('${brand.imgPath}', height: 45,
                                      width: 60),
                                  // Adjust height and width as needed
                                  addHeight(8),
                                  addText400(
                                      '${brand.vehicleBrand?.capitalize}',
                                      fontSize: 12,
                                      color: AppColors.textColor1),
                                ],
                              ).marginAll(4),
                            ),
                          );
                        }).toList(),
                      ).marginSymmetric(horizontal: 20),
                      addHeight(16),
                      AppButton(
                          onButtonTap: logic.selectedIndex != -1 ? () {
                            print('${logic.selectedBrand[0].vehicleBrand}');
                            Get.toNamed(AppRoutes.addVehicleModalCustomerScreen,
                                arguments: {'brand': logic.selectedBrand[0]});
                          } : () {
                            showToastError('Please select an vehicle brand ');
                          },
                          buttonColor: logic.selectedIndex != -1 ? AppColors
                              .primaryColor : AppColors.buttonDisableColor,
                          buttonText: 'Continue').marginSymmetric(
                          horizontal: 20),

                      addHeight(30)
                    ],
                  ),
                ),
              ),

            ],
          );
        }),
      ),);
  }
}
