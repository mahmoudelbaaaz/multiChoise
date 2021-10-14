
import 'package:json_annotation/json_annotation.dart';
import 'package:multi_choise_app/models/date_set.dart';
import 'package:multi_choise_app/models/payment_date_set.dart';

part 'result.g.dart';
@JsonSerializable(includeIfNull: false)

class Result{

  int responseCode;
  String responseMessage;
  List<PaymentDAteSet?>?dateSet;

  Result(this.responseCode, this.responseMessage,this.dateSet);
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

}