// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

enum LoginType { PHONE, EMAIL }

class AuthState extends Equatable {
  final LoginType loginType;
  final String phone;
  final String email;

  const AuthState({this.loginType = LoginType.PHONE, this.phone = '', this.email = ''});

  bool get isValidate {
    if (loginType == LoginType.PHONE) {
      return phone.length >= 11;
    } else {
      return email.contains("@") && email.contains(".");
    }
  }

  @override
  List<Object?> get props => [loginType, phone, email];
}
