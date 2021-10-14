

import 'package:dio/dio.dart';
import 'package:multi_choise_app/api/api_service.dart';
import 'package:multi_choise_app/api/apis_paths.dart';
import 'package:multi_choise_app/models/login_res.dart';
import 'package:multi_choise_app/models/login_response.dart';
import 'package:multi_choise_app/models/user.dart';

class LoginRepo{


  static Future<LoginRes> login( User user) async {
    Response response =
    await ApiService.postApi(ApiPath.Login, body: user.toJson());
    // hasUserId: false, body: user.toJson());
    print('repo');
    return LoginRes.fromJson(response.data,);

  }


}