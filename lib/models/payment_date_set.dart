
import 'package:json_annotation/json_annotation.dart';
import 'package:multi_choise_app/models/date_set.dart';

part 'payment_date_set.g.dart';
@JsonSerializable(includeIfNull: false)

class PaymentDAteSet{

  String trxRef;
  int fromEntityId;
 int toEntityId;
 double? amount;
 String trxDate;
 String mobileNumber;
 String fullNameAR;
 String fullNameEn;
 String corporateFullNameAr;

  PaymentDAteSet(
      this.trxRef,
      this.fromEntityId,
      this.toEntityId,
      this.amount,
      this.trxDate,
      this.mobileNumber,
      this.fullNameAR,
      this.fullNameEn,
      this.corporateFullNameAr);

  factory PaymentDAteSet.fromJson(Map<String, dynamic> json) => _$PaymentDAteSetFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentDAteSetToJson(this);

}