import 'package:flutter/material.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    this.value,
    this.items,
    this.onChanged,
    this.isDense = true,
    this.verticalPadding = 4,
    this.horizontalPadding = 12,
  });

  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;
  final bool isDense;
  final double verticalPadding;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
          isDense: isDense,
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class CustomDropdownMenuItem<T> extends DropdownMenuItem<T> {
  CustomDropdownMenuItem({
    super.key,
    required this.text,
    super.value,
  }) : super(child: Text(text));

  final String text;
}
