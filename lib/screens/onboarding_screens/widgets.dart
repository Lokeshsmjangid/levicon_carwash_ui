import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/local_storage.dart';
import 'package:levicon_carwash/resources/text_utility.dart';

class OnBoardingWidget1 extends StatelessWidget {
  const OnBoardingWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           Column(
            children: [
              ClipPath(
                clipper: InvertedCurvedClipper(),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.6,
                  decoration: const BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage(AppAssets.onboarding1,),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  child: Image.asset(AppAssets.onboarding1,),
                ),
              ),
              // const Text(
              //   "Welcome To Levicon",
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.black,
              //   ),
              // ),

              if(LocalStorage().getValue(LocalStorage.ROLE)=='Customer')
              richText2(text1: 'Select your '.capitalize,text2: 'car type '.capitalize,text3: 'and preferred wash Service.'.capitalize,fontSize: 22,
                  fontWeight1: FontWeight.w600,fontWeight2: FontWeight.w600,fontWeight3: FontWeight.w600,
                  textColor2: AppColors.primaryColor).marginSymmetric(horizontal: 16),

              if(LocalStorage().getValue(LocalStorage.ROLE)=='Car Station')
                richText2(text1: 'Welcome to ',text2: 'Levicon'.capitalize,fontSize: 22,
                    fontWeight1: FontWeight.w600,fontWeight2: FontWeight.w600,fontWeight3: FontWeight.w600,
                    textColor2: AppColors.primaryColor).marginSymmetric(horizontal: 16),

              const SizedBox(height: 10),

              if(LocalStorage().getValue(LocalStorage.ROLE)=='Customer')
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: addText500('Choose your car type, select a service package, and pick a convenient time and place for your car wash.',fontSize: 13,color: AppColors.textColor1,textAlign: TextAlign.center),
              ),

              if(LocalStorage().getValue(LocalStorage.ROLE)=='Car Station')
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: addText500('Your trusted platform to connect with customers and grow your car wash business.',fontSize: 13,color: AppColors.textColor1,textAlign: TextAlign.center),
              ),


              const SizedBox(height: 20),
            ],
          ),
        ],

      ),
    );
  }
}

class OnBoardingWidget2 extends StatelessWidget {
  const OnBoardingWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           Column(
            children: [

              ClipPath(
                clipper: InvertedCurvedClipper(),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.6,
                  decoration: const BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage(AppAssets.onboarding1,),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  child: Image.asset(LocalStorage().getValue(LocalStorage.ROLE)=='Customer'?AppAssets.onboarding2:AppAssets.onboarding4),
                ),
              ),
              // const Text(
              //   "Welcome To Levicon",
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.black,
              //   ),
              // ),

              if(LocalStorage().getValue(LocalStorage.ROLE)=='Customer')
              richText2(text1: 'Choose a slot that fits your '.capitalize,text2: 'schedule.'.capitalize,fontSize: 22,
                  fontWeight1: FontWeight.w600,fontWeight2: FontWeight.w600,
                  textColor2: AppColors.primaryColor).marginSymmetric(horizontal: 16),

              if(LocalStorage().getValue(LocalStorage.ROLE)=='Car Station')
              richText2(text1: 'Maximize Your '.capitalize,text2: 'Earnings'.capitalize,fontSize: 22,
                  fontWeight1: FontWeight.w600,fontWeight2: FontWeight.w600,
                  textColor2: AppColors.primaryColor).marginSymmetric(horizontal: 16),

              const SizedBox(height: 10),
              if(LocalStorage().getValue(LocalStorage.ROLE)=='Customer')
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: addText500('Choose your car type, select a service package, and pick a convenient time and place for your car wash.',fontSize: 13,color: AppColors.textColor1,textAlign: TextAlign.center),
              ),

              if(LocalStorage().getValue(LocalStorage.ROLE)=='Car Station')
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: addText500('Get bookings, manage your schedule, and earn more with flexible work hours.',fontSize: 13,color: AppColors.textColor1,textAlign: TextAlign.center),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],

      ),
    );
  }
}

class OnBoardingWidget3 extends StatelessWidget {
  const OnBoardingWidget3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           Column(
            children: [
              ClipPath(
                clipper: InvertedCurvedClipper(),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.6,
                  decoration: const BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage(AppAssets.onboarding1,),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  child: Image.asset(LocalStorage().getValue(LocalStorage.ROLE)=='Customer'?AppAssets.onboarding3:AppAssets.onboarding5),
                ),
              ),
              // const Text(
              //   "Welcome To Levicon",
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.black,
              //   ),
              // ),

              if(LocalStorage().getValue(LocalStorage.ROLE)=='Customer')
              richText2(text1: 'Let us handle the rest while '.capitalize,text2: 'you relax!'.capitalize,fontSize: 22,
                  fontWeight1: FontWeight.w600,fontWeight2: FontWeight.w600,
                  textColor2: AppColors.primaryColor).marginSymmetric(horizontal: 16),

              if(LocalStorage().getValue(LocalStorage.ROLE)=='Car Station')
              richText2(text1: 'Deliver Excellence, Get '.capitalize,text2: 'Rewards'.capitalize,fontSize: 22,
                  fontWeight1: FontWeight.w600,fontWeight2: FontWeight.w600,
                  textColor2: AppColors.primaryColor).marginSymmetric(horizontal: 16),

              const SizedBox(height: 10),

              if(LocalStorage().getValue(LocalStorage.ROLE)=='Customer')
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: addText500('Choose your car type, select a service package, and pick a convenient time and place for your car wash.',fontSize: 13,color: AppColors.textColor1,textAlign: TextAlign.center),
              ),

              if(LocalStorage().getValue(LocalStorage.ROLE)=='Car Station')
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: addText500('Provide top-notch service and unlock bonuses, reviews, and growth opportunities!',fontSize: 13,color: AppColors.textColor1,textAlign: TextAlign.center),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],

      ),
    );
  }
}

class InvertedCurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    final double controlPointHeight = size.height * 1;
    final double curveHeight = size.height * 0.80;

    path.moveTo(0, curveHeight);
    path.quadraticBezierTo(
      size.width / 2,
      controlPointHeight, // Control point for the curve
      size.width,
      curveHeight,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

