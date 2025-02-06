import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:levicon_carwash/common_bottom_sheet/customer_add_vehicle_bottomsheet.dart';
import 'package:readmore/readmore.dart';
import 'package:levicon_carwash/resources/utils.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/controllers/customer/customer_station_detail_ctrl.dart';


class CustomerStationDetailScreen extends StatefulWidget {
  const CustomerStationDetailScreen({super.key});

  @override
  State<CustomerStationDetailScreen> createState() =>
      _CustomerStationDetailScreenState();
}

class _CustomerStationDetailScreenState
    extends State<CustomerStationDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: GetBuilder<CustomerStationDetailCtrl>(builder: (commCtrl) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
          
                      width: double.infinity,
                      height: 280,
                      decoration: const BoxDecoration(
                          color: AppColors.primaryLightColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))
                      ),
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          child: Image.asset(
                            AppAssets.galleryImage3, fit: BoxFit.cover,))),
                  Positioned(
                    top: 48,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        backButton(color: AppColors.whiteColor, onTap: () {
                          Get.back();
                        }),
                        shareButton(color: AppColors.whiteColor, onTap: () {})
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 20,

                    child: Container(
                      width: MediaQuery.sizeOf(context).width*0.7,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.whiteColor,

                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                      child: HorizontalImageList(
                        images: const [
                        AppAssets.galleryImage,
                        AppAssets.galleryImage2,
                        AppAssets.galleryImage,
                        ],
                        moreCount: 15,
                      ),
                    ),)
                ],
              ),
          
              addHeight(20),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
          
                    children: [
          
                      addText600('Shine Bright Auto', fontSize: 20,
                          color: AppColors.blackColor),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 108),
                        child: Row(
          
                          children: [
                            Image.asset(
                                AppAssets.locationNewIcon, width: 20, height: 20),
                            addWidth(4),
                            addText400('Pune, India', fontSize: 13,
                                color: AppColors.textColor1)
                          ],
                        ),
                      ),
                    ],
                  ), const Spacer(),
          
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(AppAssets.starIcon, height: 13, width: 13)
                            .marginOnly(right: 4),
                        addText400(
                            '4.0 (6)', fontSize: 13, color: AppColors.whiteColor),
                      ],
                    ).marginSymmetric(horizontal: 8, vertical: 4),
                  )
                ],
              ).marginSymmetric(horizontal: 20),
              addHeight(16),
          
              Container(
                width: double.infinity,
                // color: AppColors.primaryLightColor,
                alignment: Alignment.center,
                child: TabBar(
                  padding: EdgeInsets.zero,
                  isScrollable: true,
                  tabs: commCtrl.myTabs,
                  controller: commCtrl.tabController,
                  indicatorColor: AppColors.primaryColor,
                  labelColor: AppColors.primaryColor,
                  unselectedLabelColor: AppColors.blackColor,
                  physics: const NeverScrollableScrollPhysics(),
                  labelStyle: const TextStyle(fontSize: 16,color: AppColors.primaryColor,fontWeight: FontWeight.w500),
                  unselectedLabelStyle: const TextStyle(fontSize: 16,color: AppColors.blackColor,fontWeight: FontWeight.w500),
                  onTap: commCtrl.tabBarTap(commCtrl.tabController.index),
                ),
              ),
          
          
              SizedBox(
                height: MediaQuery.sizeOf(context).height*0.55,
                child: TabBarView(
                  controller: commCtrl.tabController,
                  physics: const NeverScrollableScrollPhysics(),

                  children: [
                  build_about_view(),
                  build_services_view(),
                  build_gallery_view(),
                  build_review_view(),
                ],),
              )
            ],
          ),
        );
      }),
    );
  }

  build_about_view() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addText500('About',fontSize: 14),
        Flexible(
          child: ReadMoreText(
            'Shine Bright Auto Services LLP specializes in delivering fast, reliable, and affordable car cleaning solutions. Their focus is on providing comprehensive services, including exterior washes, interior detailing, and upholstery care. With a dedicated team and state-of-the-art facilities, Shine Bright aims to make every customer\'s experience seamless and satisfying. Whether you prefer on-site service or a visit to their well-equipped service.....',
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 13,
              fontWeight:
              FontWeight.w400,
              height: 0,

            ),
            trimLines: 8,
            colorClickableText:
            Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText:
            'Read More'.tr,
            trimExpandedText:
            'Read Less'.tr,
            moreStyle: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 12,
                fontWeight:
                FontWeight
                    .bold),
            lessStyle: const TextStyle(
              // Add this section to style the "Show less" text
              color: AppColors
                  .primaryColor,
              // Change to your desired color
              fontSize: 12,
              fontWeight:
              FontWeight.bold,
            ),
          ),
        ),

        addHeight(16),
        addText500('Service Provider',fontSize: 14),
        addHeight(10),

        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryLightColor,
            borderRadius: BorderRadius.circular(1000)
          ),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,color: Colors.red
                ),
                child: Image.asset(AppAssets.profilePicture),
              ),
              addWidth(8),
              addText500('Robin Tga',color: AppColors.blackColor),
              // const Spacer(),
              // Row(
              //   children: [
              //     chatAndCallButton(onTap: (){}), // for chat
              //     addWidth(14),
              //     chatAndCallButton(isChat:false,onTap: (){}),
              //   ],
              // ),

            ],
          ).marginSymmetric(horizontal: 16,vertical: 6),
        ),


        addHeight(10),
        AppButton(buttonText: 'Book Service'),

      ],
    ).marginSymmetric(horizontal: 20,vertical: 16);
  }

  chatAndCallButton({void Function()? onTap,bool isChat = true}){
    return GestureDetector(
    onTap: onTap,
      child: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
            shape: BoxShape.circle,color: AppColors.primaryColor.withOpacity(0.8),
            border: Border.all(color: AppColors.primaryColor,width: 2)
        ),
        child: Image.asset(isChat?AppAssets.chatIcon:AppAssets.callIcon).marginAll(7),
      ),
    );
  }

  build_review_view() {
    return SingleChildScrollView(
      child: Column(
        children: [
          addHeight(16),
          ...List.generate(2, (index){
            return build_text_tile(title: 'James Anderson');
          })
        ],
      ).marginSymmetric(horizontal: 20),
    );

  }

  build_text_tile({ String? title,bool upperBorder = false,bool lowerBorder = false,void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primaryLightColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Row(
              children: [

                // Divider(height: 0,),
                Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        color: Color(0xffD0E1EA),
                        shape: BoxShape.circle
                    ),
                    child: Image.asset(AppAssets.personImage)),
                addWidth(10),
                addText500(title!.capitalize.toString(),fontSize: 14,color: AppColors.blackColor),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.starIcon,height: 13,width: 13).marginOnly(right: 4),
                      addText400('4.0',fontSize: 13,color: AppColors.blackColor),
                    ],
                  ).marginSymmetric(horizontal: 8,vertical: 2),
                )
              ],
            ),
            addHeight(8),
            addText400('Absolutely loved their service! The team was punctual, and they used eco-friendly products that left my car sparkling clean. ',
                fontSize: 12,color: AppColors.blackColor)
          ],
        ),
      ).marginOnly(bottom: 12),
    );

  }

  build_gallery_view() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addHeight(20),
        Row(
          children: [
            richText2(text1: 'Gallery', text2:'(275)',
                fontSize1: 14,
                fontWeight1: FontWeight.w500,fontWeight2: FontWeight.w500,
                textColor1: AppColors.blackColor,textColor2: AppColors.primaryColor),
            const Spacer(),
            addText500('View all',decoration: TextDecoration.underline,fontSize: 14,color: AppColors.primaryColor),
          ],
        ),

        addHeight(16),
        DynamicImageLayout(
          // List of image URLs or asset paths
          images: const [
            AppAssets.galleryImage,
            AppAssets.galleryImage2,
            AppAssets.galleryImage,
            AppAssets.galleryImage2,
          ],
        )
        

      ],
    ).marginSymmetric(horizontal: 20);
  }

  build_services_view() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addText500('Service',fontSize: 14),
          addHeight(16),
          ...List.generate(2, (index){
            return build_services_tile(title: index==0?'basic wash'.capitalize:'detailing'.capitalize,onTapAdd: (){

                CustomerAddVehicleBottomSheet.show(context,serviceName: index==0?'basic wash'.capitalize:'detailing'.capitalize,
                    amount: index==0?'1500':'200'.capitalize,addedVehicle: Get.find<CustomerStationDetailCtrl>().addedVehicle);
                

              
            });
          }),

          addText500('Service Provider',fontSize: 14),
          addHeight(10),
      
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.primaryLightColor,
                borderRadius: BorderRadius.circular(1000)
            ),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,color: Colors.red
                  ),
                  child: Image.asset(AppAssets.profilePicture),
                ),
                addWidth(8),
                addText500('Robin Tga',color: AppColors.blackColor),
                // const Spacer(),
                // Row(
                //   children: [
                //     chatAndCallButton(onTap: (){}), // for chat
                //     addWidth(14),
                //     chatAndCallButton(isChat:false,onTap: (){}),
                //   ],
                // ),
      
              ],
            ).marginSymmetric(horizontal: 16,vertical: 6),
          ),
      
      
          addHeight(36),
          // AppButton(buttonText: 'Book Service'),
      
        ],
      ).marginSymmetric(horizontal: 20,vertical: 16),
    );
  }


  build_services_tile({ String? title,bool upperBorder = false,bool lowerBorder = false,void Function()? onTapViewDetail,void Function()? onTapAdd}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryLightColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(title=='basic wash'.capitalize?AppAssets.basicWashIcon:AppAssets.detailingIcon,height: 40,width: 40,),
                  addWidth(10),
                  addText500(title!.capitalize.toString(),fontSize: 14,color: AppColors.blackColor),

                ],
              ),
              addHeight(8),
              addText400('Fast, reliable car wash services with expert detailing solutions.', fontSize: 12,color: AppColors.blackColor),
              addHeight(8),

              Row(
                children: [
                  addText500('₹1500',fontSize: 15,color: AppColors.blackColor),
                  addWidth(20),
                  Row(

                    children: [
                      Image.asset(AppAssets.durationClockIcon,width: 16,height: 16),
                      addWidth(4),
                      addText400('30 min',fontSize: 13,color: AppColors.textColor3),

                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: onTapViewDetail,
                      child: addText400('View Details',fontSize: 14,decoration: TextDecoration.underline,color: AppColors.primaryColor))
                ],
              )


            ],
          ),
        ).marginOnly(bottom: 20),
        Positioned(
            right: 16,top: -10,
            child: GestureDetector(
              onTap: onTapAdd,
              child: Container(
                        decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(30)
                        ),
                        child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [

                addText400(
                    'Add', fontSize: 13, color: AppColors.whiteColor),
              ],
                        ).marginSymmetric(horizontal: 12, vertical: 4),
                      ),
            ))
      ],
    );

  }

}



class DynamicImageLayout extends StatelessWidget {
  final List<String> images;

  DynamicImageLayout({required this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Use indices to control image placement
        for (int i = 0; i < images.length; i += 2)
          Row(
            children: [
              Expanded(
                flex: _getFlexForIndex(i),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      images[i],
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ).marginOnly(bottom: 8),
              ),
              if (i + 1 < images.length) ...[
                const SizedBox(width: 8),
                Expanded(
                  flex: _getFlexForIndex(i + 1),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        images[i + 1],
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ).marginOnly(bottom: 8),
                ),
              ],
            ],
          ),
      ],
    );
  }

  /// Determines the flex value for each index
  int _getFlexForIndex(int index) {
    if (index == 2) return 1; // Smaller image
    if (index==0 || index == 3) return 2; // Larger image
    return 1; // Default equal flex for top-row images
  }
}

class HorizontalImageList extends StatelessWidget {
  final List<String> images;
  final int moreCount;

  HorizontalImageList({required this.images, required this.moreCount});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: SizedBox(
        height: 100, // Height for the image list
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3+1, // Add one for the "+more" item
          itemBuilder: (context, index) {
            if (index < images.length) {
              // Regular image item
              return ClipRRect(
                borderRadius: BorderRadius.circular(50), // Rounded corners
                child: Image.asset(
                  images[index],
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ).marginOnly(right: 2);
            } else {
              // "+more" item
              return ClipRRect(
                borderRadius: BorderRadius.circular(50), // Rounded corners
                child: Container(
                  height: 60,
                  width: 60,
                  // color: Colors.grey.shade300,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage( images[0]),fit: BoxFit.cover)
                  ),
                  child: Center(
                    child: addText500(
                      '+$moreCount',
                     fontSize: 15,
                      color: AppColors.whiteColor
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}