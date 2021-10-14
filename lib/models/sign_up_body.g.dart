// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignModel _$SignModelFromJson(Map<String, dynamic> json) {
  return SignModel(
    json['fullName'] as String,
    json['email'] as String,
    json['password'] as String,
    (json['roles'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$SignModelToJson(SignModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fullName', instance.fullName);
  writeNotNull('email', instance.email);
  writeNotNull('password', instance.password);
  writeNotNull('roles', instance.roles);
  return val;
}
