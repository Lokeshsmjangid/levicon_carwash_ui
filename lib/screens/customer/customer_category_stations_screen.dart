import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:levicon_carwash/controllers/current_address_controller.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_routers.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/models/station_category_model.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/screens/customer/customer_sidebar_screen.dart';

class CustomerCategoryStationsScreen extends StatefulWidget {
  const CustomerCategoryStationsScreen({super.key});

  @override
  State<CustomerCategoryStationsScreen> createState() => _CustomerCategoryStationsScreenState();
}

class _CustomerCategoryStationsScreenState extends State<CustomerCategoryStationsScreen> {

  int selectedIndex = 0;
  List<StationCategory> categoryList = [
    StationCategory(imgPath: AppAssets.basicWashIcon,categoryName: 'basic wash'),
    StationCategory(imgPath: AppAssets.detailingIcon,categoryName: 'detailing'),
    StationCategory(imgPath: AppAssets.waxingIcon,categoryName: 'waxing'),
    StationCategory(imgPath: AppAssets.basicWashIcon,categoryName: 'basic wash')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [

          // Header
          Container(
            height: 120,
            decoration: const BoxDecoration(
            color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12))
            ),
            child: Column(
              children: [
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.customerAddressScreen)?.then((
                              value) {
                            setState(() {});
                          });
                        },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          addText500('Location',fontSize: 16,color: Colors.white),
                          Row(
                            children: [
                              Image.asset(AppAssets.locationIcon,color: AppColors.blueColor,height: 14),
                              addWidth(4),
                              GetBuilder<CurrentAddressController>(builder: (logic) {
                                return Container(
                                    constraints: BoxConstraints(maxWidth: 150),
                                    child: addText400(
                                        '${logic.currentAddress}', fontSize: 12,
                                        color: Colors.white,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis));
                              }),
                              addWidth(4),
                              Image.asset(AppAssets.dropDownArrow,height: 10,width: 10,color: AppColors.whiteColor,)

                            ],
                          ),

                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=>CustomerSideBarScreen());
                      },
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: AppColors.blueColor,
                        ),
                        child: Image.asset(AppAssets.drawerIcon).marginAll(8),
                      ),
                    )
                  ],
                ).marginSymmetric(horizontal: 20,vertical: 20),

              ],
            ),
          ),

          // Body
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                addHeight(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addText500('Choose Stations',fontSize: 16,color: AppColors.blackColor),
                    Spacer(),
                  ],
                ),
                addHeight(12),

                CustomTextField(
                  hintColor: AppColors.textFieldHintColor,
                  hintText: 'Search...',
                  prefixIcon: Icon(
                    Icons.search, size: 20, color: AppColors.textFieldHintColor),

                ),
                addHeight(16),

                SizedBox(
                  height: 30,
                  // color: Colors.red,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal, // Horizontal scrolling
                    itemCount: categoryList.length, // Number of items in the list
                    itemBuilder: (context, index) {

                      String icon = categoryList[index].imgPath.toString();
                      String name = categoryList[index].categoryName.toString();
                      return GestureDetector(
                        onTap: (){selectedIndex = index;setState(() {});},
                        child: Container(
                            decoration: BoxDecoration(
                              color: selectedIndex==index?AppColors.primaryColor:null,
                              borderRadius: BorderRadius.circular(100)

                            ),
                            child: Center(child: addText500(name.capitalize.toString(),fontSize: 14,
                                color: selectedIndex==index?AppColors.whiteColor: AppColors.blackColor).marginSymmetric(horizontal: 16))).marginOnly(right: 10),
                      );
                    },
                  ),
                ),


                addHeight(12),


                Align(alignment: Alignment.centerLeft,
                    child: addText500('Popular Stations',fontSize: 16,color: AppColors.blackColor)),
                addHeight(12),
                Column(
                  children: [


                    // inner box
                   ...List.generate(5, (index){
                     return Stack(
                       clipBehavior: Clip.none,
                       children: [
                         Container(
                           padding: const EdgeInsets.all(10),
                           decoration: BoxDecoration(
                               border: Border.all(color: AppColors.containerBorderColor),
                               borderRadius: BorderRadius.circular(14)
                           ),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                               Stack(
                                 children: [
                                   Container(
                                     height: 160,
                                     width: double.infinity,
                                     decoration: BoxDecoration(
                                       color: AppColors.containerBorderColor,
                                         borderRadius: BorderRadius.circular(14)
                                     ),
                                     child: Image.asset(AppAssets.galleryImage,fit: BoxFit.fill,),
                                   ),
                                   Positioned(
                                     right: 10,
                                     bottom: 10,
                                       child: Container(
                                     decoration: BoxDecoration(
                                         color: AppColors.whiteColor,
                                         borderRadius: BorderRadius.circular(30)
                                     ),
                                     child: Row(
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       mainAxisSize: MainAxisSize.min,
                                       children: [
                                         Image.asset(AppAssets.starIcon,height: 13,width: 13).marginOnly(right: 4),
                                         addText400('4.0 (6)',fontSize: 13,color: AppColors.blackColor),
                                       ],
                                     ).marginSymmetric(horizontal: 8,vertical: 2),
                                   ))
                                 ],
                               ),

                               addHeight(8),
                               addText500('ProGlow Auto Spa',fontSize: 16,color: AppColors.blackColor),
                               Row(
                                 children: [
                                   addText500('₹1500',fontSize: 15,color: AppColors.blackColor),
                                   Spacer(),
                                   Row(
                                     children: [
                                       Container(
                                         constraints: const BoxConstraints(maxWidth: 108),
                                         child: Row(

                                           children: [
                                             Image.asset(AppAssets.locationNewIcon,width: 20,height: 20),
                                             addWidth(4),
                                             addText400('Pune, India',fontSize: 13,color: AppColors.textColor1)
                                           ],
                                         ),
                                       ),
                                       addWidth(4),
                                       Row(

                                         children: [
                                           Image.asset(AppAssets.stationDistanceIcon,width: 20,height: 20),
                                           addWidth(4),
                                           addText400('0.5km',fontSize: 13,color: AppColors.textColor3)
                                         ],
                                       ),
                                     ],
                                   ),
                                 ],
                               ),


                               addHeight(14), // date & time

                             ],
                           ),
                         ).marginOnly(bottom: 30),
                         Positioned(
                             right: 10,
                             bottom: 16,
                             child: Container(

                           decoration: BoxDecoration(
                               color: AppColors.primaryColor,
                               borderRadius: BorderRadius.circular(25)),
                           child: addText500('Book', fontSize: 16,
                               color: AppColors.whiteColor)
                               .marginSymmetric(
                               horizontal: 20, vertical: 4),
                         ))
                       ]);})],
                ),
                addHeight(30),
              ],
            ).marginSymmetric(horizontal: 20),
          ))
        ],
      ),
    );
  }
}