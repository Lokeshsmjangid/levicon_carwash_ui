import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:levicon_carwash/resources/utils.dart';
import 'package:levicon_carwash/resources/auth_data.dart';
import 'package:levicon_carwash/resources/app_routers.dart';
import 'package:levicon_carwash/resources/local_storage.dart';


class ApiUrls{
  // static const String razorPayKeyIdLive = 'rzp_live_wwZG2CQbtsgxAH'; // live Razorpay (rzp_live_HfkjPU0iKDvK8V--> old)
  // static const String razorPaySecretKeyLive = 'EaWxf5c9R9xEcx5MQGEO7RrR'; // live Razorpay (FZfVJ0ImqM87sAUvVMyBBi6Y--> old)
  static const String razorPayKeyIdLive = 'rzp_test_GA7Go4I6c4TKDG'; // test key Razorpay
  static const String razorPaySecretKeyLive = 'ersZ7lGcRdUe4rIak3jwpSzV'; // test key Razorpay
/*--------------------------------------------Razor Pay Key-----------------------------------------------------*/

  static const String googleApiKey = 'AIzaSyB10TXSu1ncBkk6Lou_Gjk5avLVUQUxKjM';
/*--------------------------------------------Google Api Key-----------------------------------------------------*/


/*--------------------------------------------Api EndPoints-----------------------------------------------------*/
static const String domain = '';
static const String baseUrl = '';

}

// api call methods
Future<http.Response> performGetRequest(String url) async {
  final headers = {
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer ${AuthData().userToken}'
  };



  return await http.get(
    Uri.parse(url),
    headers: headers,
  );
}

Future<http.Response> performPostRequest(String url, Map<String, dynamic> map) async {
  leviconPrint(message: '${AuthData().userToken}');
  final headers = {
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer ${AuthData().userToken}'
  };
  return await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode(map),
  );
}

void handleErrorCases(http.Response response, dynamic data, String apiName) {
  if (response.statusCode == 422) {
    showToastError(data['message']);
  } else if (response.statusCode == 400 || data['message'] == "Unauthenticated.") {
    print('coming in 400 or Unauthenticated in ${apiName}');
    LocalStorage().clearLocalStorage();
    Get.offAllNamed(AppRoutes.chooseRole);
  }
  // else {
  //   log('Yahaa aaya ApisUrl me');
  //   showToastError(data['message']);
  //   showLoader(false);
  //   throw Exception(response.body);
  // }
}