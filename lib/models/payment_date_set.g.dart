// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_date_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentDAteSet _$PaymentDAteSetFromJson(Map<String, dynamic> json) {
  return PaymentDAteSet(
    json['trxRef'] as String,
    json['fromEntityId'] as int,
    json['toEntityId'] as int,
    (json['amount'] as num)?.toDouble(),
    json['trxDate'] as String,
    json['mobileNumber'] as String,
    json['fullNameAR'] as String,
    json['fullNameEn'] as String,
    json['corporateFullNameAr'] as String,
  );
}

Map<String, dynamic> _$PaymentDAteSetToJson(PaymentDAteSet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('trxRef', instance.trxRef);
  writeNotNull('fromEntityId', instance.fromEntityId);
  writeNotNull('toEntityId', instance.toEntityId);
  writeNotNull('amount', instance.amount);
  writeNotNull('trxDate', instance.trxDate);
  writeNotNull('mobileNumber', instance.mobileNumber);
  writeNotNull('fullNameAR', instance.fullNameAR);
  writeNotNull('fullNameEn', instance.fullNameEn);
  writeNotNull('corporateFullNameAr', instance.corporateFullNameAr);
  return val;
}
