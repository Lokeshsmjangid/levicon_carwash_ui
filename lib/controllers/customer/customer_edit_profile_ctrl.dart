import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:levicon_carwash/resources/debouncer.dart';

class CustomerEditProfileCtrl extends GetxController{
  TextEditingController customerNameCtrl = TextEditingController(
      text: 'Michal Brown');
  TextEditingController customerEmailCtrl = TextEditingController(
      text: 'user@gmail.com');
  TextEditingController customerMobileCtrl = TextEditingController(
      text: '+916587698546');



  final deBounce = Debouncer(milliseconds: 1000);
  XFile? selectedImage;
  Future<XFile?> pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    try {
      final XFile? image = await _picker.pickImage(source: source);
      print("picking image: ${image!.path}");
      return image;
    } catch (e) {
      print("Error picking image: $e");
      // showLoader(false);
      return null;
    }
  }

}