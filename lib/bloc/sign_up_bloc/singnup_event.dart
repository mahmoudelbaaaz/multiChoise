import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:multi_choise_app/models/sign_up_body.dart';
import 'package:multi_choise_app/models/user.dart';



abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}



class SignupPressed extends SignupEvent {
  SignModel user;

  SignupPressed(this.user);


  @override
  List<Object> get props => [user];
}



