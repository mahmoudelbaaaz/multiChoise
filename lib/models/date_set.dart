
import 'package:json_annotation/json_annotation.dart';

part 'date_set.g.dart';
@JsonSerializable(includeIfNull: false)

class DateSet{

  String fullName;
  String email;
  String userName;
  String dateCreated;
  String token;

  DateSet(
      this.fullName, this.email, this.userName, this.dateCreated, this.token);

  factory DateSet.fromJson(Map<String, dynamic> json) => _$DateSetFromJson(json);

  Map<String, dynamic> toJson() => _$DateSetToJson(this);

}