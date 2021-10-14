
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_choise_app/bloc/role_bloc/role_event.dart';
import 'package:multi_choise_app/bloc/role_bloc/role_state.dart';
import 'package:multi_choise_app/models/login_response.dart';
import 'package:multi_choise_app/models/user.dart';
import 'package:multi_choise_app/repository/login_repo.dart';
import 'package:multi_choise_app/repository/role_repo.dart';



class RoleBLoc extends Bloc<RoleEvent, RoleState> {
  RoleBLoc() : super(RoleUninitialized());

  @override
  Stream<RoleState> mapEventToState(RoleEvent event) async* {
    if (event is FetchRoles) {
      yield* Fetch(event);
    }
  }
}


Stream<RoleState> Fetch(FetchRoles event) async* {
  try {
    yield RoleLoading();
    CommonResponse response = await RoleRepo.getRole( );
    if (response.responseCode != null && response.responseMessage != null) {
      yield RoleSuccess( response);
    } else {
      yield RoleFailed(response.responseMessage);
    }
  } catch (e) {
    yield RoleFailed(e);
  }
}

