import 'package:get/get.dart';
import 'package:levicon_carwash/models/vehicle_brand_model.dart';
import 'package:levicon_carwash/models/vehicle_modle_model.dart';
import 'package:levicon_carwash/resources/app_assets.dart';

class AddVehicleCustomerCtrl extends GetxController{

  bool?showSkip;

  int selectedIndex = -1;
  List brandList = [
    VehicleBrand(imgPath: AppAssets.suzuki,vehicleBrand: 'Maruti Suzuki',),
    VehicleBrand(imgPath: AppAssets.hundai,vehicleBrand: 'hundai'),
    VehicleBrand(imgPath: AppAssets.mahindra,vehicleBrand: 'mahindra'),
    VehicleBrand(imgPath: AppAssets.honda,vehicleBrand: 'honda'),
    VehicleBrand(imgPath: AppAssets.toyota,vehicleBrand: 'toyota'),
    VehicleBrand(imgPath: AppAssets.audi,vehicleBrand: 'audi'),
    VehicleBrand(imgPath: AppAssets.lexus,vehicleBrand: 'lexus'),
    VehicleBrand(imgPath: AppAssets.jaguar,vehicleBrand: 'jaguar'),
    VehicleBrand(imgPath: AppAssets.mini,vehicleBrand: 'mini'),
  ];

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

  List<VehicleBrand> selectedBrand= [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(Get.arguments!=null){
      showSkip = Get.arguments['showSkip'];
    }
  }


}