
import 'package:json_annotation/json_annotation.dart';
import 'package:multi_choise_app/models/date_set.dart';

part 'login_res.g.dart';
@JsonSerializable(includeIfNull: false)

class LoginRes{

  int responseCode;
  String responseMessage;
  DateSet?dateSet;

  LoginRes(this.responseCode, this.responseMessage,this.dateSet);
  factory LoginRes.fromJson(Map<String, dynamic> json) => _$LoginResFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResToJson(this);

}