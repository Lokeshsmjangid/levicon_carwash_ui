import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/controllers/customer/add_vehicle_customer_ctrl.dart';
import 'package:levicon_carwash/controllers/customer/add_vehicle_modal_customer_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/models/vehicle_brand_model.dart';
import 'package:levicon_carwash/models/vehicle_modle_model.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/app_routers.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';

class AddVehicleModalCustomerScreen extends StatefulWidget {
  const AddVehicleModalCustomerScreen({super.key});

  @override
  State<AddVehicleModalCustomerScreen> createState() =>
      _AddVehicleCustomerScreenState();
}

class _AddVehicleCustomerScreenState
    extends State<AddVehicleModalCustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: AppScreen(
        child: Column(
          children: [
            addHeight(78),
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
                    GetBuilder<AddVehicleModalCustomerCtrl>(builder: (logic) {
                      return addText500('Select your ${logic.vehicleBrand?.vehicleBrand??''} Model'.capitalize.toString(), fontSize: 18);
                    }),
                  ],
                ),
                Spacer(),
                // addText500('Skip', fontSize: 15, color: AppColors.primaryColor),
              ],
            ).marginSymmetric(horizontal: 20),

            addHeight(20),

            CustomTextField(
              hintColor: AppColors.textFieldHintColor,
              hintText: 'Search your car model',
              suffixIcon: Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle
                ),
                child: Icon(
                  Icons.search, size: 20, color: AppColors.whiteColor,)
                    .marginAll(6),
              ),

            ).marginSymmetric(horizontal: 20),
            addHeight(16),

            Expanded(
              // height: MediaQuery
              //     .sizeOf(context)
              //     .height*0.77,
              child: GetBuilder<AddVehicleModalCustomerCtrl>(builder: (logic) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      GridView.count(
                        crossAxisCount: 3,
                        physics: BouncingScrollPhysics(),
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        children: logic.modelList
                            .asMap()
                            .entries
                            .map((entry) {
                          int index = entry.key; // Get the index
                          VehicleModal model = entry
                              .value; // Get the brand object

                          return GestureDetector(
                            onTap: () {
                              logic.selectedModel = [];
                              logic.selectedIndex = index;
                              // Set the selected brand
                              logic.update();
                              logic.selectedModel.add(logic.modelList[index]);
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
                                  Image.asset('${model.imgPath}', height: 45,
                                      width: 60),
                                  // Adjust height and width as needed
                                  addHeight(8),
                                  addText400(
                                      '${model.vehicleModel?.capitalize}',
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
                            print('${logic.selectedModel[0].vehicleModel}');
                            Get.toNamed(
                                AppRoutes.addVehicleDetailCustomerScreen,
                                arguments: {'brand': logic.vehicleBrand, 'vehicle_model': logic.selectedModel[0]});

                          } : () {
                            showToastError('Please select an vehicle model ');
                          },
                          buttonColor: logic.selectedIndex != -1 ? AppColors
                              .primaryColor : AppColors.buttonDisableColor,
                          buttonText: 'Continue').marginSymmetric(
                          horizontal: 20),

                      addHeight(30)
                    ],
                  ),
                );
              }),
            ),

          ],
        ),
      ),);
  }
}
