import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/resources/app_assets.dart';

class CustomerStationDetailCtrl extends GetxController with GetSingleTickerProviderStateMixin{

  int selectedTabIndex = 0;
  late TabController tabController;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'About'),
    Tab(text: 'Services'),
    // Tab(text: 'products'.tr),
    Tab(text: 'Gallery'),
    Tab(text: 'Reviews'),

  ];


  tabBarTap(int index){
    // log('tabIndex: $index');
    selectedTabIndex = index;
    Future.microtask(() {
      update();
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(vsync: this, length: myTabs.length);
  }



  List<AddedVehicle> addedVehicle = [
    AddedVehicle(image: AppAssets.volkswagenImage,name: 'Jaguar F-Pace',isSelected: false),
    AddedVehicle(image: AppAssets.volkswagenImage,name: 'Jaguar F-Pace',isSelected: true),
    AddedVehicle(image: AppAssets.volkswagenImage,name: 'Jaguar F-Pace',isSelected: false)];

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

}

class AddedVehicle {
  String? image;
  String? name;
  bool isSelected;

  AddedVehicle({this.image,this.name,this.isSelected = false});
}