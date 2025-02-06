
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/api/api_constant.dart';
import 'package:levicon_carwash/controllers/current_address_controller.dart';
import 'package:levicon_carwash/custom_widgets/custom_snakebar.dart';
import 'package:levicon_carwash/resources/app_routers.dart';
import 'package:levicon_carwash/resources/utils.dart';
import 'package:http/http.dart' as http;


class SplashController extends GetxController{


  @override
  void onInit() {
    // TODO: implement onInit
    fetchLocation();
    super.onInit();
    Future.delayed(const Duration(milliseconds: 2000),(){
      Get.toNamed(AppRoutes.chooseRole);
    });
  }

  void fetchLocation() async {
    try {
      Position position = await _getCurrentLocation();
      leviconPrint(message: 'Latitude: ${position.latitude}, Longitude: ${position.longitude}');
      getGoogleAddress(lat: position.latitude,lang: position.longitude);
    } catch (e) {
      CustomSnackBar().showErrorSnackBar(Get.context!,message: '$e');
    }
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Check location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    // Get current position
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> getGoogleAddress({double? lat,double? lang,}) async {
    try {

      // Call Google Geocoding API

      String url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lang&key=${ApiUrls.googleApiKey}";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        if (data["status"] == "OK") {
          String fullAddress = data["results"][0]["formatted_address"];
          print("Address: $fullAddress");
          Get.find<CurrentAddressController>().currentAddress = fullAddress;
          Get.find<CurrentAddressController>().update();
        } else {
          print("Error: ${data["status"]}");
        }
      } else {
        print("Failed to fetch address");
      }
    } catch (e) {
      print("Error: $e");
      CustomSnackBar().showErrorSnackBar(Get.context!,message: '$e');
    }
  }

}