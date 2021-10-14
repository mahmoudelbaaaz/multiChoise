
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_choise_app/api/shared.dart';
import 'package:multi_choise_app/models/login_res.dart';
import 'package:multi_choise_app/models/login_response.dart';
import 'package:multi_choise_app/models/user.dart';
import 'package:multi_choise_app/repository/login_repo.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBLoc extends Bloc<LoginEvent, LoginState> {
  LoginBLoc() : super(LoginUninitialized());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginPressed) {
      yield* login(event);
    }
}
    }


  Stream<LoginState> login(LoginPressed event) async* {
    try {
      yield LoginLoading();
      LoginRes response = await LoginRepo.login( event.user);
      if (response.responseCode ==1 ) {
       AppShared.setToken(response.dateSet!.token);
        yield LoginSuccess( response);
      } else {
        yield LoginFailed(response.responseMessage);
      }
    } catch (e) {
      yield LoginFailed(e.toString());
    }
  }

