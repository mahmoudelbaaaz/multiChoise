import 'dart:ffi';
import 'dart:io';


import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:multi_choise_app/api/shared.dart';

import 'AppConfig.dart';

class ApiService {
  static const UrlencodedType = 'https://bookrage-server.herokuapp.com';
  static const JsonType = 'application/json';
  static const UnauthorizedCode = 401;
  static const InternalServerErrorCode = 500;
  static const AuthorizationParameter = 'Authorization';
  static const Bearer = 'Bearer';

  static Future<Response<dynamic>> postApi<T>(
      String path, {
       required Map<String, dynamic> body,
        bool isJson = true,
        bool isAuth = false,
      }) async {
    // dio init
    Dio dio = Dio(BaseOptions(baseUrl: AppConfig.getAppBaseUrl()));
    //call api
    String token;
    if (isAuth) {
      token = AppShared.token!;
      print('token: $token');
      dio.options.headers[AuthorizationParameter] = '$Bearer $token';
    }
    if (body == null) body = {};
    // if (hasUserId) body['USER_ID'] = (await AppShared.getUser())?.id??null;

    Response response = await dio.post(path,
        data: body,
        options: Options(
            validateStatus: (status) {
              return status! < InternalServerErrorCode;
            },
            contentType: isJson ? JsonType : UrlencodedType));
    // return response;
    //check the status
    print('response: ${response.data}');

      return response;

  }
  // static Future<Response<T>> patchApi<T>(
  //     String path, {
  //       Map<String, dynamic> body,
  //       bool isJson = true,
  //       bool isAuth = false,
  //     }) async {
  //   // dio init
  //   Dio dio = Dio(BaseOptions(baseUrl: AppConfig.getAppBaseUrl()));
  //   //call api
  //   String token;
  //   if (isAuth) {
  //     token = AppShared.token;
  //     print('token: $token');
  //     dio.options.headers[AuthorizationParameter] = '$Bearer $token';
  //   }
  //   if (body == null) body = {};
  //   // if (hasUserId) body['USER_ID'] = (await AppShared.getUser())?.id??null;
  //
  //   Response response = await dio.patch(path,
  //       data: body,
  //       options: Options(
  //           validateStatus: (status) {
  //             return status < InternalServerErrorCode;
  //           },
  //           contentType: isJson ? JsonType : UrlencodedType));
  //   // return response;
  //   //check the status
  //   if (response.statusCode == UnauthorizedCode) {
  //     await refreshToken();
  //     // return postApi(path, body: body, isAuth: isAuth, isJson: isJson);
  //   } else {
  //     return response;
  //   }
  // }

  static Future<Response<dynamic>> getApi<T>(String path,
      {bool isAuth = true}) async {
    // dio init
    Dio dio = Dio(BaseOptions(baseUrl: AppConfig.getAppBaseUrl()));
    //call api
    String token;
    if (isAuth) {
      //token = AppShared.token.accessToken;
      token = AppShared.token!;
      dio.options.headers[AuthorizationParameter] = '$Bearer $token';
    }


    // if (hasLanguage) {
    //   path += '/${AppShared.language()}';
    // }
    Response response =
    await dio.get('$path', options: Options(validateStatus: (status) {
      return status! < InternalServerErrorCode;
    }));

    //check the status
      return response;
    }
  }





  //
  //
  // static Future<Response<T>> deletetApi<T>(
  //     String path, {
  //       Map<String, dynamic> body,
  //       bool isJson = true,
  //       bool isAuth = false,
  //     }) async {
  //   // dio init
  //   Dio dio = Dio(BaseOptions(baseUrl: AppConfig.getAppBaseUrl()));
  //   //call api
  //   String token;
  //   if (isAuth) {
  //     token = AppShared.token;
  //     print('token: $token');
  //     dio.options.headers[AuthorizationParameter] = '$Bearer $token';
  //   }
  //   if (body == null) body = {};
  //   // if (hasUserId) body['USER_ID'] = (await AppShared.getUser())?.id??null;
  //
  //   Response response = await dio.delete(path,
  //       data: body,
  //       options: Options(
  //           validateStatus: (status) {
  //             return status < InternalServerErrorCode;
  //           },
  //           contentType: isJson ? JsonType : UrlencodedType));
  //   // return response;
  //   //check the status
  //   if (response.statusCode == UnauthorizedCode) {
  //     await refreshToken();
  //     // return postApi(path, body: body, isAuth: isAuth, isJson: isJson);
  //   } else {
  //     return response;
  //   }
  // }
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  // static Future<Response<T>> postMultiPartApi<T>(
  //     String path, {
  //       Map<String, dynamic> body,
  //       String filesName,
  //       List<File> files,
  //       // Map<String, dynamic> files,
  //       bool isJson = true,
  //       bool isAuth = false,
  //       bool hasUserId = true,
  //     }) async {
  //   // dio init
  //
  //   FormData formData = FormData();
  //   body.forEach((key, value) {
  //     formData.fields.add(MapEntry(key, value.toString()));
  //   });
  //
  //   Dio dio = Dio(BaseOptions(baseUrl: AppConfig.getAppBaseUrl()));
  //   //call api
  //   String token;
  //   if (isAuth) {
  //     token = AppShared.token;
  //     dio.options.headers[AuthorizationParameter] = '$Bearer $token';
  //   }
  //   if (body == null) body = {};
  //   if (files != null)
  //     files.forEach((element) async {
  //       if (element == null) return;
  //       String fileName = element.path.split('/').last;
  //       formData.files.add(MapEntry<String, MultipartFile>(filesName,
  //           await MultipartFile.fromFile(element.path, filename: fileName)));
  //     });
  //   if (hasUserId)
  //     formData.fields
  //         .add(MapEntry('USER_ID', (await AppShared.getUser()).id.toString()));
  //   Response response = await dio.post(path,
  //       data: formData,
  //       options: Options(
  //           validateStatus: (status) {
  //             return status < InternalServerErrorCode;
  //           },
  //           contentType: isJson ? JsonType : UrlencodedType));
  //   if (response.statusCode == UnauthorizedCode) {
  //     await refreshToken();
  //     // return postMultiPartApi(path,
  //     //     files: files,
  //     //     isJson: isJson,
  //     //     hasUserId: hasUserId,
  //     //     body: body,
  //     //     filesName: filesName,
  //     //     isAuth: isAuth);
  //   } else
  //     return response;
  // }
  //
  // static Future<String> refreshToken() async {
  //   print(AppShared.refreshToken);
  //   Response response = await postApi(
  //     ApiPath.RefreshToken,
  //     isAuth: false,
  //     body: {
  //       "refreshToken": AppShared.refreshToken,
  //     },
  //   );
  //   print(response.data);
  //
  //   if (response.statusCode == UnauthorizedCode) {
  //     return null;
  //   } else {
  //     return response.data['data']['token'];
  //   }
  // }
