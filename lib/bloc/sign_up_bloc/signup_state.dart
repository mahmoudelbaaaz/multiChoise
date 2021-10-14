import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:multi_choise_app/models/login_response.dart';
import 'package:multi_choise_app/models/user.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupUninitialized extends SignupState {}

class SignupLoading extends SignupState {}


class SignupSuccess extends SignupState {
  late CommonResponse user;

  SignupSuccess(user);

  @override
  List<Object> get props => [user];
}

class SignupFailed extends SignupState {
   String error;

  SignupFailed(this.error);

  @override
  List<Object> get props => [this.error];
}
