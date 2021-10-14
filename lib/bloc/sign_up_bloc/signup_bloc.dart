
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_choise_app/bloc/sign_up_bloc/signup_state.dart';
import 'package:multi_choise_app/bloc/sign_up_bloc/singnup_event.dart';
import 'package:multi_choise_app/models/login_response.dart';
import 'package:multi_choise_app/models/user.dart';
import 'package:multi_choise_app/repository/login_repo.dart';
import 'package:multi_choise_app/repository/signup_repo.dart';



class SignupBLoc extends Bloc<SignupEvent, SignupState> {
  SignupBLoc() : super(SignupUninitialized());

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is SignupPressed) {
      yield* Signup(event);
    }
  }
}


Stream<SignupState> Signup(SignupPressed event) async* {
  try {
    yield SignupLoading();
    CommonResponse response = await SignupRepo.Signup( event.user);
    if (response.responseCode == 1 ) {
      yield SignupSuccess( response);
    } else {
      yield SignupFailed(response.dateSet!.first);
    }
  } catch (e) {
    yield SignupFailed("e");
  }
}

