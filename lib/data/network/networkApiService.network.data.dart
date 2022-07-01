import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mvvm_practice_app/data/exceptions/app.exceptions.data.dart';
import 'package:mvvm_practice_app/data/network/baseApiUrlService.network.data.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiUrlServices {
  //for get api request
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  //for post api request

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }
}

//manage the response from the server
dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 404:
      throw UnauthorisedException(response.body.toString());

    default:
      throw FetchDataException(
          "Error occured while communicating with server  Status code : ${response.statusCode}");
  }
}
