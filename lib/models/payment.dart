
import 'package:json_annotation/json_annotation.dart';
import 'package:multi_choise_app/models/date_set.dart';
import 'package:multi_choise_app/models/result.dart';

part 'payment.g.dart';
@JsonSerializable(includeIfNull: false)

class Payment{

double? totalAmount;
  Result?result;


  Payment(this.totalAmount, this.result);
  factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);

}