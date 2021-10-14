import 'dart:convert';

import 'package:multi_choise_app/models/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppShared {
  static String SharedPreferenceUser = "user";
  static String SharedPreferenceToken = "Token";
  static String SharedPreferencesRefreshToken = "RefreshToken";
  static String lang = 'en';

  static int language() {
    return lang == 'en' ? 2 : 1;
  }

  static bool isRTL() {
    return language() == 1;
  }

  static String? token;
  static String? refreshToken;

  static Future setToken(String userToken) async {
    AppShared.token = userToken;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedPreferenceToken, userToken);
  }

  static Future getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? result = prefs.getString(SharedPreferenceToken);
    if (result != null) token = result;
  }

  static Future<dynamic> setRefreshToken(String newRefreshToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedPreferencesRefreshToken, newRefreshToken);
    refreshToken = newRefreshToken;
  }

  static Future<dynamic> getRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? result = prefs.getString(SharedPreferencesRefreshToken);
    if (result != null) refreshToken = result;
  }

  static Future<CommonResponse?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? result = prefs.getString(SharedPreferenceUser);
    if (result != null) return CommonResponse.fromJson(JsonDecoder().convert(result));
    return null;
  }

  static Future saveUser(CommonResponse user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        SharedPreferenceUser, JsonCodec().encode(user.toJson()));
  }

  static Future deleteUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(SharedPreferenceUser);
    await prefs.remove(SharedPreferencesRefreshToken);
    await prefs.remove(SharedPreferenceToken);
  }
}
