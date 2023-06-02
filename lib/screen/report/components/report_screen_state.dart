import 'package:flutter/material.dart';

import '../../main/screen_state.dart';
import '../report_screen.dart';

class ReportScreenState extends ScreenState {
  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => AppBar(title: const Text("Report"));

  @override
  Widget getBody(BuildContext context) => const ReportScreen();

  @override
  int get getIndex => 1;
}
