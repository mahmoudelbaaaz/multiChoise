import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:multi_choise_app/models/login_response.dart';
import 'package:multi_choise_app/models/user.dart';

abstract class RoleState extends Equatable {
  const RoleState();

  @override
  List<Object> get props => [];
}

class RoleUninitialized extends RoleState {}

class RoleLoading extends RoleState {}


class RoleSuccess extends RoleState {
  late CommonResponse role;

  RoleSuccess(this.role);

  @override
  List<Object> get props => [role];
}

class RoleFailed extends RoleState {
  late String error;

  RoleFailed(error);

  @override
  List<Object> get props => [error];
}
