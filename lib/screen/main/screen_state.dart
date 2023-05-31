import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ScreenState extends Equatable {
  @override
  List<Object?> get props => [];

  PreferredSizeWidget? getAppBar(BuildContext context);

  Widget getBody(BuildContext context);

  int get getIndex;
}
