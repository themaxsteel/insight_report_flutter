import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insight_report/screen/auth/cubit/auth_cubit.dart';

class PhoneLoginForm extends StatelessWidget {
  const PhoneLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Masuk dengan Nomor Telepon", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        const Text(
          'Kami akan mengirimkan kode verifikasi ke nomor telepon anda',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "assets/images/ic_indonesia.png",
                      height: 22,
                      width: 22,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text("+62", style: TextStyle(fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  isDense: true,
                  hintText: "Nomor telepon",
                  border: OutlineInputBorder(
                    gapPadding: 0,
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: Colors.grey[100],
                  filled: true,
                ),
                onChanged: (value) => context.read<AuthCubit>().onChangedPhone(value),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
