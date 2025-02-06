
import 'package:get/get.dart';
import 'package:levicon_carwash/choose_role.dart';
import 'package:levicon_carwash/screens/about_us_screen.dart';
import 'package:levicon_carwash/screens/customer/add_vehicle_customer_screen.dart';
import 'package:levicon_carwash/screens/customer/add_vehicle_detail_customer_screen.dart';
import 'package:levicon_carwash/screens/customer/add_vehicle_model_customer_screen.dart';
import 'package:levicon_carwash/screens/customer/customer_edit_profile_.dart';
import 'package:levicon_carwash/screens/customer/customer_address_screen.dart';
import 'package:levicon_carwash/screens/customer/customer_booking_history_screen.dart';
import 'package:levicon_carwash/screens/customer/customer_category_stations_screen.dart';
import 'package:levicon_carwash/screens/customer/customer_home_screen.dart';
import 'package:levicon_carwash/screens/customer/customer_login.dart';
import 'package:levicon_carwash/screens/customer/customer_notification_screen.dart';
import 'package:levicon_carwash/screens/customer/customer_profile_creation.dart';
import 'package:levicon_carwash/screens/customer/customer_profile_screen.dart';
import 'package:levicon_carwash/screens/customer/customer_review_and_pay_.dart';
import 'package:levicon_carwash/screens/customer/customer_select_slot_screen_.dart';
import 'package:levicon_carwash/screens/customer/customer_station_detail_screen.dart';
import 'package:levicon_carwash/screens/customer/customer_verify_otp.dart';
import 'package:levicon_carwash/screens/onboarding_screens/onboarding_screens.dart';
import 'package:levicon_carwash/screens/station/order/station_order_history_screen.dart';
import 'package:levicon_carwash/screens/station/station_bank_information.dart';
import 'package:levicon_carwash/screens/station/station_booking_history_screen.dart';
import 'package:levicon_carwash/screens/station/station_contact_us.dart';
import 'package:levicon_carwash/screens/station/station_create_account.dart';
import 'package:levicon_carwash/screens/station/station_create_new_password.dart';
import 'package:levicon_carwash/screens/station/station_forgot_password_otp_screen.dart';
import 'package:levicon_carwash/screens/station/station_forgot_password_screen.dart';
import 'package:levicon_carwash/screens/station/station_image_screen.dart';
import 'package:levicon_carwash/screens/station/station_login.dart';
import 'package:levicon_carwash/screens/station/station_manage_earnings_screen.dart';
import 'package:levicon_carwash/screens/station/station_manage_service_screen.dart';
import 'package:levicon_carwash/screens/station/station_notification_screen.dart';
import 'package:levicon_carwash/screens/station/station_profile_information.dart';
import 'package:levicon_carwash/screens/station/station_profile_screen.dart';
import 'package:levicon_carwash/screens/station/station_reviews_rating_screen.dart';
import 'package:levicon_carwash/screens/station/station_schedule_time_slots_screen.dart';
import 'package:levicon_carwash/splash_screen.dart';

class AppRoutes {
  static String splashScreen = '/splashScreen';
  static String chooseRole = '/chooseRole';
  static String onboardingScreen = '/onboardingScreen';
  // Customer Screens
  static String customerLoginScreen = '/customerLoginScreen';
  static String verifyOtpCustomer = '/verifyOtpCustomer';
  static String customerProfileCreation = '/customerProfileCreation';
  static String addVehicleCustomerScreen = '/addVehicleCustomerScreen';
  static String addVehicleModalCustomerScreen = '/addVehicleModalCustomerScreen';
  static String addVehicleDetailCustomerScreen = '/addVehicleDetailCustomerScreen';
  static String stationForgotPasswordScreen = '/stationForgotPasswordScreen';
  static String customerHomeScreen = '/customerHomeScreen';
  static String customerCategoryStationsScreen = '/customerCategoryStationsScreen';
  static String customerProfileScreen = '/customerProfileScreen';
  static String customerEditProfileScreen = '/customerEditProfileScreen';
  static String customerBookingHistoryScreen = '/customerBookingHistoryScreen';
  static String customerStationDetailScreen = '/customerStationDetailScreen';
  static String customerAddressScreen = '/customerAddressScreen';
  static String customerReviewPayScreen = '/customerReviewPayScreen';
  static String customerSelectSlotScreen = '/customerSelectSlotScreen';


  // Car-Station
  static String stationLoginScreen = '/stationLoginScreen';
  static String stationForgotPasswordOtpScreen = '/stationForgotPasswordOtpScreen';
  static String stationCreateNewPasswordScreen = '/stationCreateNewPasswordScreen';
  static String stationSignUpScreen = '/stationSignUpScreen';
  static String stationBookingHistoryScreen = '/stationBookingHistoryScreen';
  static String stationScheduleTimeSlotScreen = '/stationScheduleTimeSlotScreen';
  static String stationOrderHistoryScreen = '/stationOrderHistoryScreen';
  static String stationProfileScreen = '/stationProfileScreen';
  static String stationContactUsScreen = '/stationContactUsScreen';
  static String stationManageEarningsScreen = '/stationManageEarningsScreen';
  static String stationReviewsRatingScreen = '/stationReviewsRatingScreen';
  static String stationBankDetailScreen = '/stationBankDetailScreen';
  static String stationProfileInformationScreen = '/stationProfileInformationScreen';
  static String stationManageServiceScreen = '/stationManageServiceScreen';
  static String stationNotificationScreen = '/stationNotificationScreen';
  static String aboutUsScreen = '/aboutUsScreen';
  static String customerNotificationScreen = '/customerNotificationScreen';
  static String stationImageScreen = '/stationImageScreen';


  // Car Station Screens

  static final getRoute = [
    GetPage(
      name: AppRoutes.onboardingScreen,
      page: () => const OnboardingScreen(),
    ),

    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
    ),

    GetPage(
      name: AppRoutes.chooseRole,
      page: () => const ChooseRoleScreen(),
    ),

    // Customer
    GetPage(
      name: AppRoutes.customerLoginScreen,
      page: () => CustomerLoginScreen(),
    ),GetPage(
      name: AppRoutes.verifyOtpCustomer,
      page: () => VerifyOtpCustomer(),
    ),GetPage(
      name: AppRoutes.customerProfileCreation,
      page: () => CustomerProfileCreation(),
    ),GetPage(
      name: AppRoutes.addVehicleCustomerScreen,
      page: () => AddVehicleCustomerScreen(),
    ),GetPage(
      name: AppRoutes.addVehicleModalCustomerScreen,
      page: () => AddVehicleModalCustomerScreen(),
    ),GetPage(
      name: AppRoutes.addVehicleDetailCustomerScreen,
      page: () => AddVehicleDetailCustomerScreen(),
    ),GetPage(
      name: AppRoutes.customerHomeScreen,
      page: () => CustomerHomeScreen(),
    ),GetPage(
      name: AppRoutes.customerCategoryStationsScreen,
      page: () => CustomerCategoryStationsScreen(),
    ),GetPage(
      name: AppRoutes.customerProfileScreen,
      page: () => CustomerProfileScreen(),
    ),GetPage(
      name: AppRoutes.customerEditProfileScreen,
      page: () => CustomerEditProfileScreen(),
    ),GetPage(
      name: AppRoutes.customerBookingHistoryScreen,
      page: () => CustomerBookingHistoryScreen(),
    ),GetPage(
      name: AppRoutes.customerNotificationScreen,
      page: () => CustomerNotificationScreen(),
    ),GetPage(
      name: AppRoutes.customerStationDetailScreen,
      page: () => CustomerStationDetailScreen(),
    ),GetPage(
      name: AppRoutes.customerAddressScreen,
      page: () => CustomerAddressScreen(),
    ),GetPage(
      name: AppRoutes.customerReviewPayScreen,
      page: () => CustomerReviewPayScreen(),
    ),GetPage(
      name: AppRoutes.customerSelectSlotScreen,
      page: () => CustomerSelectSlotScreen(),
    ),



    // Car Station Screens
    GetPage(
      name: AppRoutes.stationLoginScreen,
      page: () => StationLoginScreen(),
    ),
    GetPage(
      name: AppRoutes.stationForgotPasswordScreen,
      page: () => StationForgotPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.stationForgotPasswordOtpScreen,
      page: () => StationForgotPasswordOtpScreen(),
    ),GetPage(
      name: AppRoutes.stationCreateNewPasswordScreen,
      page: () => StationCreateNewPasswordScreen(),
    ),GetPage(
      name: AppRoutes.stationSignUpScreen,
      page: () => StationSignUpScreen(),
    ),GetPage(
      name: AppRoutes.stationBookingHistoryScreen,
      page: () => StationBookingHistoryScreen(),
    ),GetPage(
      name: AppRoutes.stationScheduleTimeSlotScreen,
      page: () => StationScheduleTimeSlotScreen(),
    ),GetPage(
      name: AppRoutes.stationOrderHistoryScreen,
      page: () => StationOrderHistoryScreen(),
    ),GetPage(
      name: AppRoutes.stationProfileScreen,
      page: () => StationProfileScreen(),
    ),GetPage(
      name: AppRoutes.stationContactUsScreen,
      page: () => StationContactUsScreen(),
    ),GetPage(
      name: AppRoutes.stationManageEarningsScreen,
      page: () => StationManageEarningsScreen(),
    ),GetPage(
      name: AppRoutes.stationReviewsRatingScreen,
      page: () => StationReviewsRatingScreen(),
    ),GetPage(
      name: AppRoutes.stationBankDetailScreen,
      page: () => StationBankDetailScreen(),
    ),GetPage(
      name: AppRoutes.stationProfileInformationScreen,
      page: () => StationProfileInformationScreen(),
    ),GetPage(
      name: AppRoutes.stationManageServiceScreen,
      page: () => StationManageServiceScreen(),
    ),GetPage(
      name: AppRoutes.stationNotificationScreen,
      page: () => StationNotificationScreen(),
    ),GetPage(
      name: AppRoutes.aboutUsScreen,
      page: () => AboutUsScreen(),
    ),GetPage(
      name: AppRoutes.stationImageScreen,
      page: () => StationImageScreen(),
    ),

  ];
}
