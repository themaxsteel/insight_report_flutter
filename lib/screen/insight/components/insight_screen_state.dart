import 'package:flutter/material.dart';

import '../../main/screen_state.dart';
import '../insight_screen.dart';

class InsightScreenState extends ScreenState {
  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => AppBar(title: const Text("Insight"));

  @override
  Widget getBody(BuildContext context) => const InsightScreen();

  @override
  int get getIndex => 3;
}
