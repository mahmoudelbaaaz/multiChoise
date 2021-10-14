// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    json['responseCode'] as int,
    json['responseMessage'] as String,
    (json['dateSet'] as List)
        ?.map((e) => e == null
            ? null
            : PaymentDAteSet.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('responseCode', instance.responseCode);
  writeNotNull('responseMessage', instance.responseMessage);
  writeNotNull('dateSet', instance.dateSet);
  return val;
}
