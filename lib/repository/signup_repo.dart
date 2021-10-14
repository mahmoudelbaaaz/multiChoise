

import 'package:dio/dio.dart';
import 'package:multi_choise_app/api/api_service.dart';
import 'package:multi_choise_app/api/apis_paths.dart';
import 'package:multi_choise_app/models/login_response.dart';
import 'package:multi_choise_app/models/sign_up_body.dart';
import 'package:multi_choise_app/models/user.dart';

class SignupRepo{


  static Future<CommonResponse> Signup( SignModel user) async {
    Response response =
    await ApiService.postApi(ApiPath.Signup, body: user.toJson());
    // hasUserId: false, body: user.toJson());
    print('repo');
    return CommonResponse.fromJson(response.data,);

  }


}