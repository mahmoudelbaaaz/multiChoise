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
import 'package:multi_choise_app/bloc/role_bloc/role_bloc.dart';
import 'package:multi_choise_app/bloc/role_bloc/role_event.dart';
import 'package:multi_choise_app/bloc/role_bloc/role_state.dart';
import 'package:multi_choise_app/bloc/sign_up_bloc/signup_bloc.dart';
import 'package:multi_choise_app/bloc/sign_up_bloc/signup_state.dart';
import 'package:multi_choise_app/bloc/sign_up_bloc/singnup_event.dart';
import 'package:multi_choise_app/models/sign_up_body.dart';
import 'package:multi_choise_app/models/user.dart';
import 'package:multi_choise_app/resources/size.dart';
import 'package:multi_choise_app/utilities/app_validator.dart';
import 'package:multi_choise_app/utilities/navigator.dart';
import 'package:multi_choise_app/widgets/app_snackBar.dart';

import '../routes.dart';

class SignUp extends StatefulWidget {
  static final String path = "lib/src/pages/login/login11.dart";

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController phoneOrEmailController;
  late TextEditingController fullNameController;
  late TextEditingController passwordController;
  late User user;
  late SignModel signUser;
  bool isSignUp = false;
  String? _selectedRole;
  bool emailIsNull = false;
  bool passwordIsNull = false;
  bool fullNameIsNull = false;

  @override
  void initState() {
    // TODO: implement initState
    phoneOrEmailController = TextEditingController();
    fullNameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RoleBLoc>(
          create: (_) => RoleBLoc()..add(FetchRoles()),
        ),
        BlocProvider<SignupBLoc>(create: (_) => SignupBLoc()),
      ],
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
                          buildFullNameTextFormField(),
                          buildEmailTextFormField(),
                          buildpassTextFormField(),
                          const SizedBox(height: 30.0),
                          BlocBuilder<RoleBLoc, RoleState>(
                              builder: (context, state) {
                            if (state is RoleLoading)
                              return Center(child: CircularProgressIndicator());
                            else if (state is RoleSuccess) {
                              return DropdownButton<String>(
                                hint: Text(' اختيار النوع'),
                                value: _selectedRole,
                                isExpanded: true,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedRole = newValue;
                                  });
                                },
                                items: state.role.dateSet!.map((String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              );
                            }
                            return Container();
                          }),
                          HeightBox(20),
                          BlocConsumer<SignupBLoc, SignupState>(
                              listener: SignUpListner,
                              builder: (context, state) {
                                if (state is SignupLoading)
                                  return Center(
                                      child: CircularProgressIndicator());

                                return ElevatedButton(
                                  child: Text("انشاء"),
                                  onPressed: () {
                                    validate();
                                    validateEmail();
                                    validateFullName();
                                    if (!emailIsNull &&
                                        !fullNameIsNull &&
                                        !passwordIsNull) {
                                      setState(() {
                                        signUser = SignModel(
                                            fullNameController.text,
                                            phoneOrEmailController.text,
                                            passwordController.text,
                                            [_selectedRole!]);

                                        BlocProvider.of<SignupBLoc>(context)
                                            .add(SignupPressed(signUser));
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(16.0),
                                  ),
                                );
                              }),
                          const SizedBox(height: 10.0),
                      ElevatedButton(
                        child: Text("تسجيل الدخول"),
                        onPressed: () {
                         pushName(context, AppRoute.Login);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                        ),
                      ),
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

  TextFormField buildpassTextFormField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        errorText: passwordIsNull ? 'password cant be null' : null,
        labelText: "ادخل الرقم السرى",
      ),
    );
  }

  TextFormField buildEmailTextFormField() {
    return TextFormField(
      controller: phoneOrEmailController,
      decoration: InputDecoration(
          errorText: emailIsNull ? 'Email cant be null' : null,
          labelText: "ادخل الايميل "),
    );
  }

  TextFormField buildFullNameTextFormField() {
    return TextFormField(
      controller: fullNameController,
      decoration: InputDecoration(
        errorText: fullNameIsNull ? 'name cant be null' : null,
        labelText: "ادخل الاسم بالكامل",
      ),
    );
  }

  Text buildLoginText(BuildContext context) {
    return Text(
      "التسجيل",
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

  void SignUpListner(BuildContext context, SignupState state) {
    if (state is SignupSuccess) {
      popAllAndPushName(context, AppRoute.Login);
    } else if (state is SignupFailed) {
      showSnackBar(context, state.error);
    }
  }

  bool? validate() {
    setState(() {
      passwordIsNull = textIsNull(passwordController.text);
    });
    //
  }

  bool? validateEmail() {
    setState(() {
      emailIsNull = textIsNull(phoneOrEmailController.text);
    });
    //
  }

  bool? validateFullName() {
    setState(() {
      fullNameIsNull = textIsNull(fullNameController.text);
    });
    //
  }
}
