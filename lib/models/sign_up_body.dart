import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'sign_up_body.g.dart';


@JsonSerializable(includeIfNull: false)
class SignModel  {

  String fullName;
  String email;
  String password;
  List<String>? roles;

  SignModel(this.fullName, this.email, this.password,this.roles );

  factory SignModel.fromJson(Map<String, dynamic> json) => _$SignModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignModelToJson(this);
}