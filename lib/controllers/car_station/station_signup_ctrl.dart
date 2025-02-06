import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class StationSignupCtrl extends GetxController{
  TextEditingController stationNameCtrl = TextEditingController();
  TextEditingController stationAddressCtrl = TextEditingController();
  TextEditingController stationGstNumberCtrl = TextEditingController();
  TextEditingController stationOwnerNameCtrl = TextEditingController();
  TextEditingController stationEmailCtrl = TextEditingController();
  TextEditingController stationMobileNumberCtrl = TextEditingController();
  TextEditingController stationPassCtrl = TextEditingController();
  TextEditingController stationConfirmPassCtrl = TextEditingController();


  String countryCode = '+91';
  bool rememberMe = false;
  String pickOption = 'yes';

  bool passObscure = true;
  bool confirmPassObscure = true;
  onSuffixTap({bool isPass = false}){
    if(isPass){
      passObscure = !passObscure;
      update();
    }else{
      confirmPassObscure = !confirmPassObscure;
      update();
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