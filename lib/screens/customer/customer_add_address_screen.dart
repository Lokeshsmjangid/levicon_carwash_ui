import 'dart:convert';
import 'dart:ui';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:levicon_carwash/api/api_constant.dart';
import 'package:levicon_carwash/controllers/current_address_controller.dart';
import 'package:levicon_carwash/controllers/customer/customer_addresses_ctrl.dart';
import 'package:levicon_carwash/custom_widgets/app_button.dart';
import 'package:levicon_carwash/custom_widgets/custom_text_field.dart';
import 'package:levicon_carwash/models/address_model.dart';
import 'package:levicon_carwash/resources/utils.dart';
import 'package:levicon_carwash/resources/app_color.dart';
import 'package:levicon_carwash/resources/app_assets.dart';
import 'package:levicon_carwash/resources/text_utility.dart';
import 'package:http/http.dart' as http;

class CustomerAddAddressScreen extends StatefulWidget {


  CustomerAddAddressScreen({super.key});

  @override
  State<CustomerAddAddressScreen> createState() => _CustomerSidebarScreenState();
}

class _CustomerSidebarScreenState extends State<CustomerAddAddressScreen> {

  int selectedTabIndex = 0;
  String address = "";
  late GoogleMapController mapController;
  LatLng? selectedLocation;



  Future<LatLng> _getCurrentLocation() async { // Get current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return LatLng(position.latitude, position.longitude);
  }

  // Get address from Google API
  Future<void> _getAddressFromLatLng(LatLng position) async {
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=${ApiUrls.googleApiKey}";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data["status"] == "OK") {
        setState(() {
          address = data["results"][0]["formatted_address"];
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation().then((LatLng location) {
      setState(() {
        selectedLocation = location;
      });
      _getAddressFromLatLng(selectedLocation!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          addHeight(52),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              backButton(onTap: (){Get.back();}),
              addText600('Add Address',fontSize: 18),
              backButton(isBackButton: false),


            ],
          ).marginSymmetric(horizontal: 20),
          addHeight(16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [selectedLocation == null
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height*0.7,
                      child: GoogleMap(

                        initialCameraPosition: CameraPosition(
                          target: selectedLocation!,
                          zoom: 15,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          mapController = controller;
                        },
                        markers: selectedLocation != null
                            ? {
                          Marker(
                            markerId: MarkerId("selected"),
                            position: selectedLocation!,
                          )
                        }
                            : {},
                        onTap: (LatLng position) {
                          setState(() {
                            selectedLocation = position;
                          });
                          _getAddressFromLatLng(position);
                        },
                      ),
                    ),
                    addHeight(4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        build_tab_button(index: 0, selectedIndex: selectedTabIndex,tabTitle: 'Home',
                            onTap: (){
                              selectedTabIndex=0;
                              setState(() {});
                            }),
                        addWidth(12),
                        build_tab_button(index: 1, selectedIndex: selectedTabIndex,tabTitle: 'Work',onTap: (){
                          selectedTabIndex=1;
                          setState(() {});
                        }),
                      ],
                    ).marginSymmetric(horizontal: 20),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: addText500(
                        address,
                        fontSize: 14,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),


                ],
              ),
            ),
          )
        ],
      ),
      bottomSheet: AppButton(buttonText: 'Submit',onButtonTap: (){
        Navigator.pop(context, {"location": selectedLocation, "address": address});
        Get.find<CustomerAddressesCtrl>().savedAddress.add(
            AddressModel(
                isSelected: false,addressType: selectedTabIndex==0?'Home':'Work',
                lat: selectedLocation!.latitude,lang: selectedLocation!.longitude,
                fullAddress: address
            ));
        Get.find<CustomerAddressesCtrl>().update();
      },).marginOnly(left: 16,right: 16,bottom: 16),
    );
  }

  build_address_box({String? addressType, String? fullAddress,bool isSelected = false}) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: isSelected?AppColors.primaryLightColor:AppColors.textColor2,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected?AppColors.primaryColor:AppColors.containerBorderColor)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(addressType=='Home'? AppAssets.addressHomeIcon: AppAssets.addressOfficeIcon)),
              addWidth(10),
              addText500('$addressType',fontSize: 16,color: AppColors.blackColor),
              Spacer(),
              buildPopUp()
            ],
          ),
          addHeight(4),
          addText400('JPloft, Mansarovar Extention, Jaipur, Rajasthan 302020',fontSize: 14,color: AppColors.textColor1),


        ],
      ),

    ).marginOnly(left: 20,right: 20,bottom: 20);
  }

  buildPopUp() {
    return Container(
      height: 20,
      width: 20,
      child: PopupMenuButton(

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.zero,
          icon: Icon(Icons.more_vert),
          offset: Offset(0, 22),
          tooltip: 'Delete or Edit Address',
          shadowColor: AppColors.containerBorderColor,

          //add offset to fix it
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                  onTap: () {},
                  height: 30,
                  padding: EdgeInsets.only(left: 12),
                  value: 'Edit',
                  child: addText400('Edit',
                      fontSize: 14,
                      color: AppColors.blackColor)),
              PopupMenuItem(
                  onTap: () {},
                  height: 30,
                  padding: EdgeInsets.only(left: 12),
                  value: 'Delete',
                  child: addText400('Delete',
                      fontSize: 14,
                      color: AppColors.blackColor)),

            ];
          }),
    );
  }

  build_tab_button({void Function()? onTap, int? selectedIndex, int? index, String? tabTitle,}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: selectedIndex == index
              ? AppColors.primaryColor
              : AppColors.containerBorderColor,),
            borderRadius: BorderRadius.circular(4)),
        child: addText500('$tabTitle', fontSize: 14, color: selectedIndex == index
            ? AppColors.primaryColor
            : AppColors.blackColor).marginSymmetric(horizontal: 10,vertical: 2),
      ),
    );
  }


}