import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../services/dio_service.dart';

class OffreRepo {

  final DioService dioService;
  final GetStorage box = GetStorage();
  OffreRepo({required this.dioService});

  Future<Response> offres({required dynamic data}) async {
    return await dioService.getData('/offres');
  }

  Future<Response> postuler({required dynamic data}) async {
    return await dioService.postData('/postuler', data: data);
  }

  Future<Response> saveAlertEmploi({required dynamic data}) async {
    return await dioService.postData('/alert_emploi', data: data);
  }

}
