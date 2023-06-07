import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:insight_report/screen/main/main_cubit.dart';
import 'package:insight_report/screen/main/main_screen.dart';
import 'package:insight_report/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MainCubit()),
      ],
      child: FlutterWebFrame(
        maximumSize: const Size(475, 812),
        enabled: kIsWeb,
        backgroundColor: Colors.grey,
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            home: const MainScreen(),
          );
        },
      ),
    );
  }
}
