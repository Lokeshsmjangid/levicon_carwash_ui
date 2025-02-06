
import 'package:get/get.dart';
import 'package:levicon_carwash/controllers/car_station/station_bank_information_ctrl.dart';
import 'package:levicon_carwash/controllers/car_station/station_contact_us_ctrl.dart';
import 'package:levicon_carwash/controllers/car_station/station_create_new_password_ctrl.dart';
import 'package:levicon_carwash/controllers/car_station/station_fg_password_ctrl.dart';
import 'package:levicon_carwash/controllers/car_station/station_fg_password_otp_ctrl.dart';
import 'package:levicon_carwash/controllers/car_station/station_login_ctrl.dart';
import 'package:levicon_carwash/controllers/car_station/station_order_history_ctrl.dart';
import 'package:levicon_carwash/controllers/car_station/station_profile_information_ctrl.dart';
import 'package:levicon_carwash/controllers/car_station/station_schedule_time_slots_ctrl.dart';
import 'package:levicon_carwash/controllers/car_station/station_signup_ctrl.dart';
import 'package:levicon_carwash/controllers/current_address_controller.dart';
import 'package:levicon_carwash/controllers/customer/add_vehicle_customer_ctrl.dart';
import 'package:levicon_carwash/controllers/customer/add_vehicle_detail_customer_ctrl.dart';
import 'package:levicon_carwash/controllers/customer/add_vehicle_modal_customer_ctrl.dart';
import 'package:levicon_carwash/controllers/customer/customer_addresses_ctrl.dart';
import 'package:levicon_carwash/controllers/customer/customer_booking_history_ctrl.dart';
import 'package:levicon_carwash/controllers/customer/customer_edit_profile_ctrl.dart';
import 'package:levicon_carwash/controllers/customer/customer_login_ctrl.dart';
import 'package:levicon_carwash/controllers/customer/customer_profile_creation_ctrl.dart';
import 'package:levicon_carwash/controllers/customer/customer_profile_ctrl.dart';
import 'package:levicon_carwash/controllers/customer/customer_station_detail_ctrl.dart';
import 'package:levicon_carwash/controllers/customer/customer_verify_otp_ctrl.dart';
import 'package:levicon_carwash/controllers/dashboard_controller.dart';
import 'package:levicon_carwash/controllers/splash_controller.dart';
import 'package:levicon_carwash/controllers/choose_role_controller.dart';
import 'package:levicon_carwash/screens/onboarding_screens/onboarding_controller.dart';

Future<void> init() async{
  Get.put(CurrentAddressController());
  Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
  Get.lazyPut<ChooseRoleController>(() => ChooseRoleController(), fenix: true);
  Get.lazyPut<AddVehicleCustomerCtrl>(() => AddVehicleCustomerCtrl(), fenix: true);
  Get.lazyPut<AddVehicleModalCustomerCtrl>(() => AddVehicleModalCustomerCtrl(), fenix: true);
  Get.lazyPut<AddVehicleDetailCustomerCtrl>(() => AddVehicleDetailCustomerCtrl(), fenix: true);
  Get.lazyPut<CustomerBookingHistoryCtrl>(() => CustomerBookingHistoryCtrl(), fenix: true);
  Get.lazyPut<DashboardController>(() => DashboardController(), fenix: true);
  Get.lazyPut<OnboardingController>(() => OnboardingController(), fenix: true);
  Get.lazyPut<CustomerStationDetailCtrl>(() => CustomerStationDetailCtrl(), fenix: true);
  Get.lazyPut<CustomerLoginCtrl>(() => CustomerLoginCtrl(), fenix: true);
  Get.lazyPut<CustomerProfileCreationCtrl>(() => CustomerProfileCreationCtrl(), fenix: true);
  Get.lazyPut<CustomerVerifyOtpCtrl>(() => CustomerVerifyOtpCtrl(), fenix: true);
  Get.lazyPut<CustomerProfileCtrl>(() => CustomerProfileCtrl(), fenix: true);
  Get.lazyPut<CustomerEditProfileCtrl>(() => CustomerEditProfileCtrl(), fenix: true);
  Get.lazyPut<CustomerAddressesCtrl>(() => CustomerAddressesCtrl(), fenix: true);

  // Station
  Get.lazyPut<StationScheduleTimeSlotsCtrl>(() => StationScheduleTimeSlotsCtrl(), fenix: true);
  Get.lazyPut<StationOrderHistoryCtrl>(() => StationOrderHistoryCtrl(), fenix: true);
  Get.lazyPut<StationSignupCtrl>(() => StationSignupCtrl(), fenix: true);
  Get.lazyPut<StationForgotPasswordCtrl>(() => StationForgotPasswordCtrl(), fenix: true);
  Get.lazyPut<StationLoginCtrl>(() => StationLoginCtrl(), fenix: true);
  Get.lazyPut<StationFgPasswordOtpCtrl>(() => StationFgPasswordOtpCtrl(), fenix: true);
  Get.lazyPut<StationCreateNewPasswordCtrl>(() => StationCreateNewPasswordCtrl(), fenix: true);
  Get.lazyPut<StationContactUsCtrl>(() => StationContactUsCtrl(), fenix: true);
  Get.lazyPut<StationBankInformationCtrl>(() => StationBankInformationCtrl(), fenix: true);
  Get.lazyPut<StationProfileInformationCtrl>(() => StationProfileInformationCtrl(), fenix: true);
}
