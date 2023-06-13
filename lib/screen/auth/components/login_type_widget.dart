import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insight_report/screen/auth/cubit/auth_cubit.dart';
import 'package:insight_report/screen/auth/cubit/auth_state.dart';

class LoginTypeWidget extends StatelessWidget {
  const LoginTypeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
        return Row(
          children: [
            _item("Nomor Telepon", LoginType.PHONE, state, context),
            _item("Email", LoginType.EMAIL, state, context),
          ],
        );
      }),
    );
  }

  Widget _item(String text, LoginType loginType, AuthState state, BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => context.read<AuthCubit>().changeLoginType(loginType),
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: state.loginType == loginType ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: state.loginType == loginType ? Colors.black : Colors.black38,
            ),
          ),
        ),
      ),
    );
  }
}
