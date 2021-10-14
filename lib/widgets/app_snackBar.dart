//
//
//
//
//
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void showSnackBar(BuildContext context , String message){
  Scaffold.of(context).showSnackBar(SnackBar(
    elevation: 20,
    content: Text(
       message,

    ),
  ));
}
