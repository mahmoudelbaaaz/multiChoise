import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:multi_choise_app/models/user.dart';



abstract class RoleEvent extends Equatable {
  const RoleEvent();

  @override
  List<Object> get props => [];
}



class FetchRoles extends RoleEvent {

  FetchRoles();


  @override
  List<Object> get props => [];
}



