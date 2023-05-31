import 'package:flutter/material.dart';

import '../main/screen_state.dart';
import 'profile_screen.dart';

class ProfileScreenState extends ScreenState {
  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => AppBar(title: const Text("Profile"));

  @override
  Widget getBody(BuildContext context) => const ProfileScreen();

  @override
  int get getIndex => 4;
}
