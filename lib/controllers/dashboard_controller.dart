import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levicon_carwash/resources/local_storage.dart';
import 'package:levicon_carwash/resources/utils.dart';
import 'package:levicon_carwash/screens/customer/customer_booking_history_screen.dart';
import 'package:levicon_carwash/screens/customer/customer_category_stations_screen.dart';
import 'package:levicon_carwash/screens/customer/customer_home_screen.dart';
import 'package:levicon_carwash/screens/customer/customer_notification_screen.dart';
import 'package:levicon_carwash/screens/customer/customer_profile_screen.dart';
import 'package:levicon_carwash/screens/station/station_booking_history_screen.dart';
import 'package:levicon_carwash/screens/station/station_home_screen.dart';
import 'package:levicon_carwash/screens/station/station_manage_earnings_screen.dart';
import 'package:levicon_carwash/screens/station/station_notification_screen.dart';
import 'package:levicon_carwash/screens/station/station_profile_screen.dart';

class DashboardController extends GetxController{

  final GlobalKey<ScaffoldState> key = GlobalKey();// for app drawer



  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    const CustomerHomeScreen(),
    const CustomerCategoryStationsScreen(),
    const CustomerBookingHistoryScreen(),
    const CustomerNotificationScreen(),
    const CustomerProfileScreen(),
  ];
  List<Widget> widgetOptionsStation = <Widget>[
    const StationHomeScreen(),
    const StationManageEarningsScreen(),
    const StationBookingHistoryScreen(),
    const StationNotificationScreen(),
    const StationProfileScreen()
  ];
  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.microtask((){
      getRole();
    });

  }


  String? role;
  getRole(){
    role = LocalStorage().getValue(LocalStorage.ROLE);
    update();
    leviconPrint(message: 'Role On Dashborad-->($role)');
  }


}