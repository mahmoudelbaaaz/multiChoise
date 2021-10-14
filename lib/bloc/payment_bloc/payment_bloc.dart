
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_choise_app/bloc/payment_bloc/payment_event.dart';
import 'package:multi_choise_app/bloc/payment_bloc/payment_state.dart';
import 'package:multi_choise_app/bloc/role_bloc/role_event.dart';
import 'package:multi_choise_app/bloc/role_bloc/role_state.dart';
import 'package:multi_choise_app/models/login_response.dart';
import 'package:multi_choise_app/models/payment.dart';
import 'package:multi_choise_app/models/user.dart';
import 'package:multi_choise_app/repository/login_repo.dart';
import 'package:multi_choise_app/repository/payment_repo.dart';
import 'package:multi_choise_app/repository/role_repo.dart';



class PaymentBLoc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBLoc() : super(PaymentUninitialized());

  @override
  Stream<PaymentState> mapEventToState(PaymentEvent event) async* {
    if (event is FetchPayment) {
      yield* Fetch(event);
    }
  }
}


Stream<PaymentState> Fetch(FetchPayment event) async* {
  try {
    yield PaymentLoading();
    Payment response = await PaymentRepo.getPayment( );

      yield PaymentSuccess( response);

  } catch (e) {
    yield PaymentFailed('e');
  }
}

