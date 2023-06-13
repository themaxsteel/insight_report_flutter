import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insight_report/screen/auth/components/email_login_form.dart';
import 'package:insight_report/screen/auth/cubit/auth_cubit.dart';
import 'package:insight_report/screen/auth/cubit/auth_state.dart';
import 'package:insight_report/screen/main/main_screen.dart';
import 'package:insight_report/utils/navigator.dart';
import 'package:insight_report/widgets/custom_button.dart';

import 'components/login_type_widget.dart';
import 'components/phone_login_form.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginTypeWidget(),
              const SizedBox(height: 32),
              BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
                switch (state.loginType) {
                  case LoginType.PHONE:
                    return const PhoneLoginForm();
                  case LoginType.EMAIL:
                    return const EmailLoginForm();
                }
              }),
              const Expanded(child: SizedBox()),
              BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
                return CustomButton(
                  text: "Selanjutnya",
                  enabled: state.isValidate,
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    navigateTo(context, const MainScreen(), replacement: true);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
