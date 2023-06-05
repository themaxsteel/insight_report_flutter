import 'package:flutter/material.dart';

Future<dynamic> navigateTo(BuildContext context, Widget page, {bool replacement = false}) async {
  if (!replacement) {
    return await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  } else {
    return await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
  }
}

void back<T extends Object>(BuildContext context, [T? result]) {
  return Navigator.pop(context, result);
}
