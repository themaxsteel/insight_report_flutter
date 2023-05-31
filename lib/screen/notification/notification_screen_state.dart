import 'package:flutter/material.dart';

import '../main/screen_state.dart';
import 'notification_screen.dart';

class NotificationScreenState extends ScreenState {
  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => AppBar(title: const Text("Notification"));

  @override
  Widget getBody(BuildContext context) => const NotificationScreen();

  @override
  int get getIndex => 3;
}
