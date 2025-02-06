import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/app_screen.dart';
import 'package:levicon_carwash/custom_widgets/custom_snakebar.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/app_routers.dart';
import 'package:levicon_carwash/resources/local_storage.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:levicon_carwash/resources/utils.dart';

class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {

  String selectedRole = 'Car Station'; // 1= station, 2-customer

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
    body: AppScreen(
      child: SingleChildScrollView(
        child: Column(
          children: [
            addHeight(32),
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Image.asset(AppAssets.roleBGImage
              ),
            ),

            addHeight(24),
            richText2(
                text1: 'Choose your role\n to get started with '.capitalize,fontWeight1: FontWeight.w600,fontSize1: 22,
                text2: 'Levicon',fontWeight2: FontWeight.w600,fontSize2: 22,textColor2: AppColors.spanTextColor,
                text3: ' Carwash!',fontWeight3: FontWeight.w600,fontSize3: 22).marginSymmetric(horizontal: 24),

            addHeight(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                roleButton((){ // Car Station
                  selectedRole ='Car Station';
                setState(() {});},
                    buttonText: 'Car Station',image:AppAssets.roleStationImage),

                addWidth(20),

                roleButton((){ // Customer
                  selectedRole ='Customer';
                setState(() {});},
                    buttonText: 'Customer',image:AppAssets.roleCustomerImage),
              ],
            ).marginSymmetric(horizontal: 20),

            addHeight(16),
            AppButton(
              buttonText: 'Continue',
            onButtonTap: (){
                if(selectedRole=='Car Station'){
                  LocalStorage().setValue(LocalStorage.ROLE, selectedRole);
                  Get.toNamed(AppRoutes.onboardingScreen);
                }
                else if(selectedRole=='Customer'){
                  LocalStorage().setValue(LocalStorage.ROLE, selectedRole);
                  Get.toNamed(AppRoutes.onboardingScreen);

                }
            },
            ).marginSymmetric(horizontal: 40),
            addHeight(12),


          ],
        ),
      ),
    ),
    );
  }

  Widget roleButton(void Function()? onTap,{required String buttonText,required String image,}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 134,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(width: selectedRole==buttonText?2:1,
                color: selectedRole==buttonText?AppColors.primaryColor:AppColors.containerBorderColor),
            boxShadow: [
              boxShadow()
            ],
            color: selectedRole==buttonText?AppColors.primaryColor.withOpacity(0.12):AppColors.whiteColor
        ),
        child: Stack(
          alignment: Alignment.center,

          children: [

            if(selectedRole==buttonText)
            Positioned(
                top: 10,
                right: 10,
                child: Image.asset(AppAssets.roleSelectedImage,height: 24,width: 24,)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(image,height: 48,width: 66),
                addHeight(10),
                addText500(buttonText,fontSize: 16,textAlign: TextAlign.center)
              ],
            ).marginAll(16),
            

          ],
        ),
      ),
    );
  }

}
