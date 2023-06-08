import 'package:flutter/material.dart';
import 'package:insight_report/screen/dashboard/dashboard_screen.dart';
import 'package:insight_report/screen/main/screen_state.dart';

class DashboardScreenState extends ScreenState {
  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => AppBar(title: const Text("Dashboard "));

  @override
  Widget getBody(BuildContext context) => const DashboardScreen();

  @override
  int get getIndex => 0;
}
