// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRes _$LoginResFromJson(Map<String, dynamic> json) {
  return LoginRes(
    json['responseCode'] as int,
    json['responseMessage'] as String,
    json['dateSet'] == null
        ? null
        : DateSet.fromJson(json['dateSet'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoginResToJson(LoginRes instance) {
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
