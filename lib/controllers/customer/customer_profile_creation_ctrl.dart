import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CustomerProfileCreationCtrl extends GetxController{


  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();

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