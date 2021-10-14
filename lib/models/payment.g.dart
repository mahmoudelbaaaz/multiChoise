// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return Payment(
    (json['totalAmount'] as num)?.toDouble(),
    json['result'] == null
        ? null
        : Result.fromJson(json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PaymentToJson(Payment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('totalAmount', instance.totalAmount);
  writeNotNull('result', instance.result);
  return val;
}
