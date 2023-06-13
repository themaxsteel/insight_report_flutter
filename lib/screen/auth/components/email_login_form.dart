import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/auth_cubit.dart';

class EmailLoginForm extends StatelessWidget {
  const EmailLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Masuk dengan Email", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        const Text(
          'Kami akan mengirimkan kode verifikasi ke email anda',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 24),
        TextField(
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            isDense: true,
            hintText: "Email",
            border: OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            fillColor: Colors.grey[100],
            filled: true,
          ),
          onChanged: (value) => context.read<AuthCubit>().onChangedEmail(value),
        ),
      ],
    );
  }
}
