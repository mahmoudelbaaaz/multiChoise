

import 'package:dio/dio.dart';
import 'package:multi_choise_app/api/api_service.dart';
import 'package:multi_choise_app/api/apis_paths.dart';
import 'package:multi_choise_app/models/login_response.dart';
import 'package:multi_choise_app/models/user.dart';

class RoleRepo{


  static Future<CommonResponse> getRole( ) async {

        Response response = await ApiService.getApi(ApiPath.GetRoles,);

    print('repo');
    return CommonResponse.fromJson(response.data,);

  }


}