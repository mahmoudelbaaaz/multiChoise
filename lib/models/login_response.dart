
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';
@JsonSerializable(includeIfNull: false)

class CommonResponse{

  int responseCode;
  String responseMessage;
  List<String>?dateSet;

  CommonResponse(this.responseCode, this.responseMessage,this.dateSet);
  factory CommonResponse.fromJson(Map<String, dynamic> json) => _$CommonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CommonResponseToJson(this);

}