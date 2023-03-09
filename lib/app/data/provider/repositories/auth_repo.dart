import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../../config/app_constants.dart';
import '../../services/dio_service.dart';
import '../responses/login_response.dart';

class AuthRepo {

  final DioService dioService;
  final GetStorage box = GetStorage();
  AuthRepo({required this.dioService});

  Future<Response> login({required dynamic data}) async {
    return await dioService.postData('/login', data: data);
  }

  Future<Response> refreshToken({required dynamic data}) async {
    return await dioService.postData('/token/refresh', data: data);
  }

  Future sessionTokenDataSave(LoginResponse loginResponse) async {

    //box.write(AppConstants.USER_OTP, loginResponse.otp);
    print('@@@@@@@@@@@@@@@@@@loginResponse@@@@@@@@@@@');
    print(loginResponse.experience);
    //print(loginResponse.refresh);

  }




}