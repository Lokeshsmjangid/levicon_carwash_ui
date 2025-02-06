import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class StationProfileInformationCtrl extends GetxController{
  TextEditingController  stationNameCtrl = TextEditingController(text: 'Car Station');
  TextEditingController  stationAddressCtrl = TextEditingController(text: 'Bengaluru Urban, Karnataka');
  TextEditingController  stationGstCtrl = TextEditingController(text: '5556');
  TextEditingController  stationOwnerCtrl = TextEditingController(text: 'vikaj');
  TextEditingController  stationEmailCtrl = TextEditingController(text: 'Stations@gmail.com');
  TextEditingController  stationMobileCtrl = TextEditingController(text: '+91 ');
  TextEditingController  stationPasswordCtrl = TextEditingController(text: '12356789');

  bool visiblePassword = true;
  onTapPasswordSuffix(){
    visiblePassword = !visiblePassword;
    update();
  }

  void onTextChanged(String value) {
    if (value.startsWith("0")) {
      // Remove the leading zero
      stationMobileCtrl.value = TextEditingValue(
        text: value.substring(1),
        selection: TextSelection.fromPosition(
          TextPosition(offset: value.length - 1),
        ),
      );
    }
  }


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