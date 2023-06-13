import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.icon,
      this.color = AppTheme.primaryColor,
      this.enabled = true,
      required this.onTap,
      this.textColor});
  final String text;
  final Widget? icon;
  final Color color;
  final Color? textColor;
  final bool enabled;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.4,
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: enabled ? onTap : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon ?? const SizedBox(),
                const SizedBox(width: 8),
                Text(
                  text,
                  style: TextStyle(color: textColor ?? Colors.white, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
