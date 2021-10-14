import 'package:flutter/foundation.dart';

/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_choise_app/bloc/login_bloc.dart';
import 'package:multi_choise_app/bloc/login_event.dart';
import 'package:multi_choise_app/bloc/login_state.dart';
import 'package:multi_choise_app/models/user.dart';
import 'package:multi_choise_app/resources/size.dart';
import 'package:multi_choise_app/utilities/app_validator.dart';
import 'package:multi_choise_app/utilities/navigator.dart';
import 'package:multi_choise_app/widgets/app_snackBar.dart';

import '../routes.dart';

class Login extends StatefulWidget {
  static final String path = "lib/src/pages/login/login11.dart";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController phoneOrEmailController;
  late TextEditingController passwordController;
  late User user;
  bool isSignUp = false;
  bool emailIsNull = false;
  bool passwordIsNull = false;

  @override
  void initState() {
    // TODO: implement initState
    phoneOrEmailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBLoc>(
      create: (_) => LoginBLoc(),
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              child: buildColumn(),
            ),
            SafeArea(
              child: ListView(
                children: [
                  const SizedBox(height: 40.0),
                  buildWelcomeText(context),
                  const SizedBox(height: 30.0),
                  Card(
                      margin: const EdgeInsets.all(32.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        primary: false,
                        physics: NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(16.0),
                        children: [
                          const SizedBox(height: 20.0),
                          buildLoginText(context),
                          const SizedBox(height: 40.0),
                          buildEmailTextField(),
                          buildPasswordTextField(),
                          const SizedBox(height: 30.0),
                          buildLoginButton(),
                          HeightBox(20),
                          buildSunUpButton(context),
                          const SizedBox(height: 10.0),
                          const SizedBox(height: 20.0),
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton buildSunUpButton(BuildContext context) {
    return ElevatedButton(
      child: Text("sign up"),
      onPressed: () => pushName(context, AppRoute.SignUp),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
      ),
    );
  }

  BlocConsumer<LoginBLoc, LoginState> buildLoginButton() {
    return BlocConsumer<LoginBLoc, LoginState>(
        listener: loginPressList,
        builder: (context, state) {
          if (state is LoginLoading)
            return Center(child: CircularProgressIndicator());
          return ElevatedButton(
            child: Text("login"),
            onPressed: () {
              validate();
              validateEmail();

              if(passwordIsNull!=true&&emailIsNull!=true){
              user = User(phoneOrEmailController.text, passwordController.text);
              BlocProvider.of<LoginBLoc>(context).add(LoginPressed(user));}
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
            ),
          );
        });
  }

  TextFormField buildPasswordTextField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "ادخل الرقم السرى",
        errorText: passwordIsNull ? 'password cant be null' : null,
      ),
    );
  }

  TextFormField buildEmailTextField() {
    return TextFormField(


      controller: phoneOrEmailController,
      decoration: InputDecoration(
        labelText: "ادخل الايميل",
errorText: emailIsNull ? 'Email cant be null' : null,
      ),
    );
  }

  Text buildLoginText(BuildContext context) {
    return Text(
      "Log In",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline5!.copyWith(
            color: Colors.red,
          ),
    );
  }

  Text buildWelcomeText(BuildContext context) {
    return Text(
      "Welcome",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline3!.copyWith(
            color: Colors.white,
          ),
    );
  }

  Column buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Card(
            color: Colors.red,
            margin: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            elevation: 10,
          ),
        ),
        Spacer(),
      ],
    );
  }

  void loginPressList(BuildContext context, LoginState state) {
    if (state is LoginSuccess) {
      pushName(context, AppRoute.Home);
    } else if (state is LoginFailed) {
      showSnackBar(context, state.error);
    }
  }

  bool ?validate() {
    setState(() {
      passwordIsNull = textIsNull(passwordController.text);
    });
    //
  }

  bool ?validateEmail() {
    setState(() {
      emailIsNull = textIsNull(phoneOrEmailController.text);
    });
    //
  }

}
