import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:levicon_carwash/models/vehicle_brand_model.dart';
import 'package:levicon_carwash/models/vehicle_modle_model.dart';
import 'package:levicon_carwash/resources/app_assets.dart';

class AddVehicleDetailCustomerCtrl extends GetxController{



  int selectedIndex = -1;
  VehicleBrand? vehicleBrand;
  VehicleModal? vehicleModel;

  String? selectedYear;
  List<String> yearList = [];
  TextEditingController yrSearchCtrl = TextEditingController();
  TextEditingController brandCtrl = TextEditingController();
  TextEditingController modelCtrl = TextEditingController();
  TextEditingController licenseCtrl = TextEditingController(text: 'KL 65 E 9607');
  TextEditingController vehicleColorCtrl = TextEditingController();



  VehicleBrand? selectedBrand;
  List<VehicleBrand> brandList = [
    VehicleBrand(imgPath: AppAssets.suzuki,vehicleBrand: 'Maruti Suzuki'),
    VehicleBrand(imgPath: AppAssets.hundai,vehicleBrand: 'hundai'),
    VehicleBrand(imgPath: AppAssets.mahindra,vehicleBrand: 'mahindra'),
    VehicleBrand(imgPath: AppAssets.honda,vehicleBrand: 'honda'),
    VehicleBrand(imgPath: AppAssets.toyota,vehicleBrand: 'toyota'),
    VehicleBrand(imgPath: AppAssets.audi,vehicleBrand: 'audi'),
    VehicleBrand(imgPath: AppAssets.lexus,vehicleBrand: 'lexus'),
    VehicleBrand(imgPath: AppAssets.jaguar,vehicleBrand: 'jaguar'),
    VehicleBrand(imgPath: AppAssets.mini,vehicleBrand: 'mini'),
  ];

  VehicleModal? selectedBrandModel;
  List<VehicleModal> modelList = [
    VehicleModal(imgPath: AppAssets.carModel,vehicleModel: 'Jaguar F-Pace',),
    VehicleModal(imgPath: AppAssets.carModel,vehicleModel: 'Jaguar l-Pace'),
    VehicleModal(imgPath: AppAssets.carModel,vehicleModel: 'Jaguar E-Pace'),
    VehicleModal(imgPath: AppAssets.carModel,vehicleModel: 'Jaguar F-Pace'),
    VehicleModal(imgPath: AppAssets.carModel,vehicleModel: 'Jaguar l-Pace'),
    VehicleModal(imgPath: AppAssets.carModel,vehicleModel: 'Jaguar E-Pace'),
    VehicleModal(imgPath: AppAssets.carModel,vehicleModel: 'Jaguar F-Pace'),
    VehicleModal(imgPath: AppAssets.carModel,vehicleModel: 'Jaguar l-Pace'),
    VehicleModal(imgPath: AppAssets.carModel,vehicleModel: 'Jaguar E-Pace'),
  ];


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

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getYears();
    if(Get.arguments!=null){
      vehicleBrand = Get.arguments['brand'];
      vehicleModel = Get.arguments['vehicle_model'];


      brandCtrl.text = vehicleBrand?.vehicleBrand?.capitalize??'';
      modelCtrl.text = vehicleModel?.vehicleModel?.capitalize??'';
    }
  }

  getYears(){
    // Get the current year
    int currentYear = DateTime.now().year;

    // Generate the last 15 years including the current year
    for (int i = 0; i < 15; i++) {
      yearList.add((currentYear - i).toString());
    }

    // Set the default selected year (optional)
    selectedYear = yearList[0];
  }
}