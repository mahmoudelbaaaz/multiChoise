import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:multi_choise_app/models/login_response.dart';
import 'package:multi_choise_app/models/payment.dart';
import 'package:multi_choise_app/models/user.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

class PaymentUninitialized extends PaymentState {}

class PaymentLoading extends PaymentState {}


class PaymentSuccess extends PaymentState {
   Payment user;

  PaymentSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class PaymentFailed extends PaymentState {
  String error;

  PaymentFailed(this.error);

  @override
  List<Object> get props => [this.error];
}
