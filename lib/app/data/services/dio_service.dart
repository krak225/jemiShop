import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/foundation.dart' as Foundation;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../config/app_constants.dart';
// import '../../routes/app_routes.dart';

class DioService extends Interceptor {
  static final String noInternetMessage = 'connection_to_api_server_failed'.tr;
  String? token;
  Map<String, String>? _mainHeaders;
  final Dio.Dio dio = Dio.Dio();
  final GetStorage _storage = GetStorage();
  String? baseUrl;

  DioService({this.baseUrl}) {
    print('DioService init');
    this.dio.options.baseUrl = this.baseUrl ?? AppConstants.API_URL;
    this.dio.options.connectTimeout = 50000; //50s
    this.dio.options.receiveTimeout = 30000; //30s

    this.updateHeader(_storage.read(AppConstants.TOKEN_STORAGE));
  }

  void updateHeader(String? token) {
    if (Foundation.kDebugMode) {
      print('Token: $token');
    }
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }

  Future<Dio.Response<dynamic>> getData(String endpoint,
      {Map<String, dynamic>? query,
      Map<String, String>? headers,
      bool userToken = true}) async {
    try {
      print('getData');
      this.updateHeader(_storage.read(AppConstants.TOKEN_STORAGE));
      print(AppConstants.API_URL + endpoint);
      if (!userToken) {
        _mainHeaders?.remove('Authorization');
        headers?.remove('Authorization');
      }
      var response = await this.dio.get(endpoint,
          queryParameters: query,
          options: Options(headers: headers ?? _mainHeaders));
      //print(response);
      return handleResponse(response, endpoint);
    } on DioError catch (e) {
      print(e.response?.statusCode);
      print(e.response?.data);
      print(e.response?.headers);
      print(e.response?.requestOptions);
      return handleErrorResponse(e);
    }
  }

  Future<Dio.Response<dynamic>> postData(String endpoint,
      {dynamic data,
      Map<String, dynamic>? query,
      Map<String, String>? headers,
      bool userToken = true}) async {

    print('Post Data' + data.toString());

    try {
      print('postData');
      this.updateHeader(_storage.read(AppConstants.TOKEN_STORAGE));
      print(AppConstants.API_URL + endpoint);
      //if (!userToken) {
      //  _mainHeaders?.remove('Authorization');
      //  headers?.remove('Authorization');
      //}
      var response = await this.dio.post(endpoint,
          data: data,
          queryParameters: query,
          options: Options(headers: headers ?? _mainHeaders));
      //print(response);
      return handleResponse(response, endpoint);
    } on DioError catch (e) {
      print('@@@@@@@@@ DioError');
      print(e.response?.data);
      //print(e.response?.headers);
      //print(e.response?.requestOptions);
      return handleErrorResponse(e, endpoint:endpoint);
    }
  }

  Future<Dio.Response<dynamic>> putData(String endpoint,
      {dynamic data,
      Map<String, dynamic>? query,
      Map<String, String>? headers,
      bool userToken = true}) async {
    try {
      print('putData');
      this.updateHeader(_storage.read(AppConstants.TOKEN_STORAGE));
      print(AppConstants.API_URL + endpoint);
      if(!userToken){
        _mainHeaders?.remove('Authorization');
        headers?.remove('Authorization');
      }
      var response = await this.dio.put(endpoint,
          data: data,
          queryParameters: query,
          options: Options(headers: headers ?? _mainHeaders));
      print(response);
      return handleResponse(response, endpoint);
    } on DioError catch (e) {
      print(e);
      print('@@@@@@@@@ DioError');
      print(e.response?.data);
      print(e.response?.headers);
      print(e.response?.requestOptions);
      return handleErrorResponse(e);
    }
  }

  Future<Dio.Response<dynamic>> deleteData(String endpoint,
      {dynamic data,
      Map<String, dynamic>? query,
      Map<String, String>? headers,
      bool userToken = true}) async {
    try {
      print('deleteData');
      this.updateHeader(_storage.read(AppConstants.TOKEN_STORAGE));
      print(AppConstants.API_URL + endpoint);
      if(!userToken){
        _mainHeaders?.remove('Authorization');
        headers?.remove('Authorization');
      }
      var response = await this.dio.delete(endpoint,
          data: data,
          queryParameters: query,
          options: Options(headers: headers ?? _mainHeaders));
      print(response);
      return handleResponse(response, endpoint);
    } on DioError catch (e) {
      print('@@@@@@@@@ DioError');
      print(e.response?.data);
      print(e.response?.headers);
      print(e.response?.requestOptions);
      return handleErrorResponse(e);
    }
  }

  Future<Dio.Response> handleResponse(Dio.Response response, String uri) async {
    if (response.statusCode == 200) {
      return Future.value(response);
    } else {
      return Future.error(response);
    }
  }

  Future<Dio.Response> handleErrorResponse(Dio.DioError e, {String? endpoint}) async {
    if (e.response != null &&
        e.response!.data.toString().startsWith('<!DOCTYPE html>')) {
      // await Get.find<MainController>().logout();
      // Get.offAllNamed(AppRoutes.HOME_GEST);
      return Dio.Response(
          requestOptions: e.requestOptions,
          statusCode: 500,
          data: {'message': 'INTERNAL_SERVER_ERROR'});
    }

    if (e.response != null && e.response?.statusCode == 401 && endpoint != '/token') {
      _storage.remove(AppConstants.USER_STORAGE);
      // Get.offAllNamed(AppRoutes.HOME_GEST);
    }

    if (e.response != null) {
      String? message = '';

      //message = e.response?.data['detail'] ?? e.response?.statusMessage;
      message  = e.response?.statusMessage;

      return Dio.Response(
          requestOptions: e.requestOptions,
          statusCode: e.response?.statusCode,
          data: {'message': message});
    }
    return Dio.Response(
        requestOptions: e.requestOptions,
        statusCode: 0,
        data: {'message': e.message});
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (Foundation.kDebugMode) {
      print('REQUEST[${options.method}] => PATH: ${options.path}');
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Dio.Response response, ResponseInterceptorHandler handler) {
    if (Foundation.kDebugMode) {
      print(
          'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (Foundation.kDebugMode) {
      print(
          'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    }
    return super.onError(err, handler);
  }
}
