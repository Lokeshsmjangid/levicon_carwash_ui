import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/controllers/dashboard_controller.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (logic) {


      return SafeArea(
        top: false,
        bottom: true,
        child: Scaffold(
            // extendBody: true,
            // resizeToAvoidBottomInset: false,
            body: logic.role == 'Customer'?logic.widgetOptions.elementAt(logic.selectedIndex)
                :logic.role =='Car Station'?logic.widgetOptionsStation.elementAt(logic.selectedIndex):null,
            bottomNavigationBar: logic.role == 'Customer'
                ? BottomAppBar(
              // shape: const CircularNotchedRectangle(),
              color: Colors.transparent,
              elevation: 0,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.whiteColor,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    IconButton(onPressed: () {
                        logic.selectedIndex = 0;
                        logic.update();
                      }, icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(AppAssets.bottomNav1, height: 20, width: 20, color: logic.selectedIndex == 0 ? AppColors.primaryColor : AppColors.blackColor),
                          addHeight(2),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: logic.selectedIndex == 0 ? AppColors.primaryColor : AppColors.whiteColor,),
                          )
                        ],
                      ),),

                    IconButton(onPressed: () {
                      logic.selectedIndex = 1;
                      logic.update();
                    }, icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.bottomNav2, height: 20, width: 20, color: logic.selectedIndex == 1 ? AppColors.primaryColor : AppColors.blackColor),
                        addHeight(2),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: logic.selectedIndex == 1 ? AppColors.primaryColor : AppColors.whiteColor,),
                        )
                      ],
                    )),

                    IconButton(onPressed: () {logic.selectedIndex = 2;logic.update();}, icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.bottomNav3, height: 20, width: 20, color: logic.selectedIndex == 2 ? AppColors.primaryColor : AppColors.blackColor),

                        addHeight(2),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: logic.selectedIndex == 2 ? AppColors.primaryColor : AppColors.whiteColor,),
                        )
                      ],
                    )),

                    IconButton(onPressed: () {
                      logic.selectedIndex = 3;
                      logic.update();
                    }, icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.bottomNav4, height: 20, width: 20, color: logic.selectedIndex == 3 ? AppColors.primaryColor : AppColors.blackColor),

                        addHeight(2),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: logic.selectedIndex == 3 ? AppColors.primaryColor : AppColors.whiteColor,),
                        )
                      ],
                    )),

                    IconButton(onPressed: () {
                      logic.selectedIndex = 4;
                      logic.update();
                    }, icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.bottomNav5, height: 20, width: 20, color: logic.selectedIndex == 4 ? AppColors.primaryColor : AppColors.blackColor),
                        addHeight(2),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: logic.selectedIndex == 4 ? AppColors.primaryColor : AppColors.whiteColor,),
                        )

                      ],
                    ),),
                  ],
                ),
              ),
            ).marginOnly(left: 2.0, right: 2.0, bottom: 4.0)
                : logic.role =='Car Station'
                ? BottomAppBar(
              // shape: const CircularNotchedRectangle(),
              color: Colors.transparent,
              elevation: 0,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.whiteColor,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    IconButton(onPressed: () {
                      logic.selectedIndex = 0;
                      logic.update();
                    }, icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.bottomNav1, height: 20, width: 20, color: logic.selectedIndex == 0 ? AppColors.primaryColor : AppColors.blackColor),
                        addHeight(2),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: logic.selectedIndex == 0 ? AppColors.primaryColor : AppColors.whiteColor,),
                        )
                      ],
                    ),),

                    IconButton(onPressed: () {
                      logic.selectedIndex = 1;
                      logic.update();
                    }, icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.bottomNav6, height: 20, width: 20, color: logic.selectedIndex == 1 ? AppColors.primaryColor : AppColors.blackColor),
                        addHeight(2),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: logic.selectedIndex == 1 ? AppColors.primaryColor : AppColors.whiteColor,),
                        )
                      ],
                    )),

                    IconButton(onPressed: () {logic.selectedIndex = 2;logic.update();}, icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.bottomNav3, height: 20, width: 20, color: logic.selectedIndex == 2 ? AppColors.primaryColor : AppColors.blackColor),

                        addHeight(2),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: logic.selectedIndex == 2 ? AppColors.primaryColor : AppColors.whiteColor,),
                        )
                      ],
                    )),

                    IconButton(onPressed: () {
                      logic.selectedIndex = 3;
                      logic.update();
                    }, icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.bottomNav4, height: 20, width: 20, color: logic.selectedIndex == 3 ? AppColors.primaryColor : AppColors.blackColor),

                        addHeight(2),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: logic.selectedIndex == 3 ? AppColors.primaryColor : AppColors.whiteColor,),
                        )
                      ],
                    )),

                    IconButton(onPressed: () {
                      logic.selectedIndex = 4;
                      logic.update();
                    }, icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.bottomNav5, height: 20, width: 20, color: logic.selectedIndex == 4 ? AppColors.primaryColor : AppColors.blackColor),
                        addHeight(2),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: logic.selectedIndex == 4 ? AppColors.primaryColor : AppColors.whiteColor,),
                        )

                      ],
                    ),),
                  ],
                ),
              ),
            ).marginOnly(left: 2.0, right: 2.0, bottom: 4.0)
                : null
        ),
      );
    });
  }




}
