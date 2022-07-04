import 'package:flutter/foundation.dart';
import 'package:mvvm_practice_app/data/network/baseApiUrlService.network.data.dart';
import 'package:mvvm_practice_app/data/network/networkApiService.network.data.dart';

import '../../resources/app_urls.resources.dart';

class AuthRepository {
  //create instance of BaseApiUrlService
  final BaseApiUrlServices _baseApiUrlServices = NetworkApiService();

  //register user
  Future<dynamic> registerUser(dynamic data) async {
    try {
      //http request
      dynamic response = await _baseApiUrlServices.getPostApiResponse(
        AppUrls.registerUrl,
        data,
      );
      return response;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }

  //login function
  Future<dynamic> loginUser(dynamic data) async {
    try {
      //http request
      dynamic response =
          await _baseApiUrlServices.getPostApiResponse(AppUrls.loginUrl, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }
}
