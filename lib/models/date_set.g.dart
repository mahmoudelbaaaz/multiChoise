// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateSet _$DateSetFromJson(Map<String, dynamic> json) {
  return DateSet(
    json['fullName'] as String,
    json['email'] as String,
    json['userName'] as String,
    json['dateCreated'] as String,
    json['token'] as String,
  );
}

Map<String, dynamic> _$DateSetToJson(DateSet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fullName', instance.fullName);
  writeNotNull('email', instance.email);
  writeNotNull('userName', instance.userName);
  writeNotNull('dateCreated', instance.dateCreated);
  writeNotNull('token', instance.token);
  return val;
}
