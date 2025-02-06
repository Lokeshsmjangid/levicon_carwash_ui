import 'package:flutter/material.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/text_utility.dart';

class CustomSnackBar {
  // Method to show a success Snackbar
  void showSuccessSnackBar(BuildContext context, {
    String message = "Thanks for using the Levicon CarWash",
    Duration duration = const Duration(seconds: 2)}) {
    // Use ScaffoldMessenger to show the Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: addText500(
          message,
          textAlign: TextAlign.center),
        duration: duration,
        backgroundColor: AppColors.greenColor, // Change color to green for success
      ),
    );
  }


  void showErrorSnackBar(BuildContext context, {
    String message = "Thanks for using the Levicon CarWash",
    Duration duration = const Duration(seconds: 2)}) {
    // Use ScaffoldMessenger to show the Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: addText500(
          message,
          textAlign: TextAlign.center),
        duration: duration,
        // padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        backgroundColor: AppColors.redColor1, // Change color to green for success
      ),
    );
  }
}
