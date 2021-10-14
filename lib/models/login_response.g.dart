// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResponse _$CommonResponseFromJson(Map<String, dynamic> json) {
  return CommonResponse(
    json['responseCode'] as int,
    json['responseMessage'] as String,
    (json['dateSet'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CommonResponseToJson(CommonResponse instance) {
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
