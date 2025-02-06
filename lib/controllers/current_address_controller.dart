
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:levicon_carwash/api/api_constant.dart';
import 'package:levicon_carwash/controllers/splash_controller.dart';
import 'package:levicon_carwash/custom_widgets/custom_snakebar.dart';
import 'package:levicon_carwash/models/address_model.dart';
import 'package:levicon_carwash/resources/utils.dart';



class CurrentAddressController extends GetxController{
// String currentPosition = "Unknown";
  String currentAddress = "Unknown";
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  void fetchLocation() async {
    try {
      currentAddress = 'fatching...';
      update();
      Position position = await _getCurrentLocation();
      leviconPrint(message: 'Latitude: ${position.latitude}, Longitude: ${position.longitude}');
      getGoogleAddress(lat: position.latitude,lang: position.longitude);
    } catch (e) {
      currentAddress = 'Address not found';
      update();
      CustomSnackBar().showErrorSnackBar(Get.context!,message: '$e');
    }
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      currentAddress = 'Location disabled.';
      update();
      return Future.error('Location services are disabled.');
    }

    // Check location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        currentAddress = 'Permission denied.';
        update();
        return Future.error('Location permission denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      currentAddress = 'Permission denied.';
      update();
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
      currentAddress = 'fatching...';
      update();
      String url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lang&key=${ApiUrls.googleApiKey}";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        if (data["status"] == "OK") {
          String fullAddress = data["results"][0]["formatted_address"];
          print("Address: $fullAddress");
          currentAddress = fullAddress;
          update();
        }
      }
    } catch (e) {
      currentAddress = 'Address not found';
      update();
      print("Error: $e");
      CustomSnackBar().showErrorSnackBar(Get.context!,message: '$e');
    }
  }




}