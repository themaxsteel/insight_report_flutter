import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insight_report/screen/auth/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  void changeLoginType(LoginType loginType) {
    //Reset phone and email value when changing login type
    if (state.loginType != loginType) {
      emitWith(phone: '', email: '');
    }

    emitWith(loginType: loginType);
    log("changeLoginType: ${state.loginType}");
  }

  void onChangedPhone(String phone) {
    emitWith(phone: phone);
    log("phone: ${state.phone}");
  }

  void onChangedEmail(String email) {
    emitWith(email: email);
    log("email: ${state.email}");
  }

  void emitWith({
    LoginType? loginType,
    String? phone,
    String? email,
  }) {
    emit(AuthState(
      loginType: loginType ?? state.loginType,
      phone: phone ?? state.phone,
      email: email ?? state.email,
    ));
  }
}
