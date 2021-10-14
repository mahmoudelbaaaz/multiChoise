import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:multi_choise_app/models/login_res.dart';
import 'package:multi_choise_app/models/login_response.dart';
import 'package:multi_choise_app/models/user.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginUninitialized extends LoginState {}

class LoginLoading extends LoginState {}


class LoginSuccess extends LoginState {
 late LoginRes user;

  LoginSuccess(user);

  @override
  List<Object> get props => [user];
}

class LoginFailed extends LoginState {
  String error;

  LoginFailed(this.error);

  @override
  List<Object> get props => [error];
}
