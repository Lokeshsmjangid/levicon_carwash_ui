import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:levicon_carwash/resources/utils.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/text_utility.dart';

class AboutUsScreen extends StatefulWidget {
  String? barTitle;

  AboutUsScreen({super.key,this.barTitle});

  @override
  State<AboutUsScreen> createState() => _CustomerSidebarScreenState();
}

class _CustomerSidebarScreenState extends State<AboutUsScreen> {
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
              backButton(onTap: (){Get.back();}),
              addText600('${widget.barTitle}',fontSize: 18),
              backButton(isBackButton: false),

            ],
          ).marginSymmetric(horizontal: 20),
          addHeight(20),
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                // Html(data: '${termsCtrl.model.data?.description}',
                //   style: {
                //     "body": Style(
                //       lineHeight: LineHeight(1.4),
                //       margin: Margins.zero,
                //       fontSize: FontSize(16.0),
                //       textAlign: TextAlign.justify,
                //       // wordSpacing: 2,
                //       // letterSpacing: 1,
                //       fontWeight: FontWeight.w400,
                //     ),
                //   },
                // ),
                widget.barTitle=='About Us'?carWashBody():termsAndConditionsBody(),
                addHeight(24)
              ],
            ),
          ))
        ],
      ),
    );
  }


  Widget termsAndConditionsBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           addText600(
            "Terms & Conditions",
            fontSize: 18
          ),
          const SizedBox(height: 10),
          addText400(
            "Welcome to the Levicon Carwash App! By using our app, you agree to the following terms and conditions. "
                "Please read them carefully before booking any service.",
            fontSize: 14, color: AppColors.textColor1
          ),
          const SizedBox(height: 20),
          addText500(
            "1. General Terms",
            fontSize: 16
          ),
          const SizedBox(height: 10),
          const BulletPoint(
              text:
              "By accessing our app, you confirm that you are at least 18 years old or have parental/guardian consent."),
          const BulletPoint(
              text:
              "The services provided by our platform are subject to availability and confirmation from service providers."),
          const SizedBox(height: 20),
          addText500(
            "2. Booking Policy",
            fontSize: 16
          ),
          const SizedBox(height: 10),
          const BulletPoint(
              text:
              "All bookings must be made through the app and are subject to acceptance by the service provider."),
          const BulletPoint(
              text:
              "Users are responsible for providing accurate vehicle and location details during booking."),
          const BulletPoint(
              text:
              "Changes or cancellations to bookings must be made at least 2 hours before the scheduled time."),
          const SizedBox(height: 20),
          addText500(
            "3. Payment Terms",
            fontSize: 16
          ),
          const SizedBox(height: 10),
          const BulletPoint(
              text: "Payments can be made via UPI, credit/debit cards, or cash."),
          const BulletPoint(
              text:
              "All prices listed on the app are inclusive of applicable taxes."),
          const BulletPoint(
              text:
              "Once a payment is completed, it is non-refundable except in cases of service cancellation by the provider."),
        ],
      ),
    );
  }


  Widget carWashBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
           addText600(
            "Live the Sparkle with Levicon Car Wash",
            fontSize: 18
          ),
          const SizedBox(height: 10),
          // Subtitle Paragraph
          addText400(
            "At Levicon Car Wash, we are dedicated to transforming your vehicle care experience with cutting-edge techniques and eco-friendly practices. With a focus on quality, convenience, and customer satisfaction, we bring professional car care services right to your doorstep.",
              fontSize: 14, color: AppColors.textColor1,
          ),
          const SizedBox(height: 20),
          // Services Header
          addText500(
            "Our Services",
              fontSize: 16, color: AppColors.blackColor
          ),
          const SizedBox(height: 10),
          // Services List
          const BulletPoint(text: "Eco-Friendly Washes"),
          const BulletPoint(text: "Premium Detailing"),
          const BulletPoint(text: "Paint Protection Coatings"),
          const BulletPoint(text: "Interior Cleaning"),
          const BulletPoint(text: "On-Demand Mobile Services"),
          const SizedBox(height: 20),
          // Why Choose Us Header
          addText500(
            "Why Choose Levicon Car Wash?",
              fontSize: 16, color: AppColors.blackColor
          ),
          const SizedBox(height: 10),
          // Features with Icons
          const FeatureItem(
            icon: Icons.eco,
            text: "Eco-Friendly Approach",
          ),
          const FeatureItem(
            icon: Icons.people,
            text: "Skilled Professionals",
          ),
          const FeatureItem(
            icon: Icons.delivery_dining,
            text: "Convenience at Your Doorstep",
          ),
          const FeatureItem(
            icon: Icons.attach_money,
            text: "Affordable Excellence",
          ),
        ],
      ),
    );
  }


}

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "• ",
          style: TextStyle(fontSize: 16),
        ),
        Expanded(
          child: addText400(
            text,
              fontSize: 14, color: AppColors.textColor1
          ),
        ),
      ],
    );
  }
}

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const FeatureItem({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 24, color: AppColors.textColor1),
          const SizedBox(width: 10),
          Expanded(
            child: addText400(
              text,
                fontSize: 14, color: AppColors.textColor1
            ),
          ),
        ],
      ),
    );
  }
}