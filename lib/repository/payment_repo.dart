import 'package:dio/dio.dart';
import 'package:multi_choise_app/api/api_service.dart';
import 'package:multi_choise_app/api/apis_paths.dart';
import 'package:multi_choise_app/models/login_response.dart';
import 'package:multi_choise_app/models/payment.dart';
import 'package:multi_choise_app/models/user.dart';

class PaymentRepo {
  static Future<Payment> getPayment() async {
    Response response =
        await ApiService.getApi(ApiPath.GetPayments, isAuth: true);

    return Payment.fromJson(
      response.data,

    );
  }
}
