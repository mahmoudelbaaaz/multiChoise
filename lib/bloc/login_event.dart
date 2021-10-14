import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:multi_choise_app/models/user.dart';



abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}



class LoginPressed extends LoginEvent {
   User user;

   LoginPressed(this.user);


  @override
  List<Object> get props => [user];
}



