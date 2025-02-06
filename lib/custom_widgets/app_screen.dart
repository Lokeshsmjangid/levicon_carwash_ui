import 'package:flutter/material.dart';
import 'package:levicon_carwash/resources/app_assets.dart';

class AppScreen extends StatelessWidget {
  Widget? child;
  AppScreen({super.key,this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: double.maxFinite,
      decoration: const BoxDecoration(

        image: DecorationImage(image: AssetImage(AppAssets.splashBgImage),fit: BoxFit.fill),
      ),
      child: child,
    );
  }
}
