import 'package:get/get.dart';
import 'package:levicon_carwash/models/vehicle_brand_model.dart';
import 'package:levicon_carwash/models/vehicle_modle_model.dart';
import 'package:levicon_carwash/resources/app_assets.dart';

class AddVehicleModalCustomerCtrl extends GetxController{



  int selectedIndex = -1;
  VehicleBrand? vehicleBrand;


  List modelList = [
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

  List<VehicleModal> selectedModel= [];

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(Get.arguments!=null){
      vehicleBrand = Get.arguments['brand'];
    }
  }
}