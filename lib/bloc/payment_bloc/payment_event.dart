import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:multi_choise_app/models/sign_up_body.dart';
import 'package:multi_choise_app/models/user.dart';



abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}



class FetchPayment extends PaymentEvent {

  FetchPayment();


  @override
  List<Object> get props => [];
}



