import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/app_routers.dart';
import 'package:levicon_carwash/resources/local_storage.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/screens/onboarding_screens/widgets.dart';

import 'onboarding_controller.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = Get.find<OnboardingController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Stack(
          children: [

            PageView.builder(
              physics: BouncingScrollPhysics(),
              controller: controller.pageController.value,
              itemCount: 3,
              onPageChanged: (index) async {
                controller.currentPage.value = index;
              },
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const OnBoardingWidget1();
                } else if (index == 1) {
                  return const OnBoardingWidget2();
                } else {
                  return const OnBoardingWidget3();
                }
              },
            ).marginOnly(top: Platform.isIOS?52:40),
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (controller.currentPage.value == 0) {
                      } else if (controller.currentPage.value > 0) {
                        controller.pageController.value.previousPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        controller.pageController.value.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Obx(() {
                      return controller.currentPage.value == 0
                          ? GestureDetector(
                        onTap: (){
                          if(LocalStorage().getValue(LocalStorage.ROLE)=='Customer'){
                            Get.offNamed(AppRoutes.customerLoginScreen);
                          } else if(LocalStorage().getValue(LocalStorage.ROLE)=='Car Station'){
                            Get.offNamed(AppRoutes.stationLoginScreen);
                          }
                        },
                            child: const Text(
                                                    "Skip",
                                                    style: TextStyle(
                            fontSize: 16,
                            color: AppColors.primaryColor,
                                                    ),
                                                  ),
                          )
                          : Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          border: Border.all(color: AppColors.primaryColor),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(Icons.arrow_back,color: AppColors.primaryColor,),
                        ),
                      );
                    }),
                  ),
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        bool isActive = controller.currentPage.value == index;
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isActive ? AppColors.primaryColor : Colors.grey,
                          ),
                        );
                      }),
                    );
                  }),
                  GestureDetector(
                    onTap: () {
                      if (controller.currentPage.value == 2) {
                        // Get.to(const SelectRoleScreen());
                      } else {
                        controller.pageController.value.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Obx(() {
            return controller.currentPage.value == 2
                        ? GestureDetector(
              onTap: (){
        if(LocalStorage().getValue(LocalStorage.ROLE)=='Customer'){
          Get.offNamed(AppRoutes.customerLoginScreen);
        } else if(LocalStorage().getValue(LocalStorage.ROLE)=='Car Station'){
          Get.offNamed(AppRoutes.stationLoginScreen);
        }
              },
                          child: Container(decoration: BoxDecoration(
                          color: AppColors.primaryColor,borderRadius: BorderRadius.circular(100)
                                                ), child: const Text(
                                                  "Get Started",
                                                  style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                                                  ),
                                                ).marginSymmetric(horizontal: 8,vertical: 4),
                          ),
                        ):Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(Icons.arrow_forward_outlined,color: AppColors.whiteColor,),
                      ),
                    );})
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

