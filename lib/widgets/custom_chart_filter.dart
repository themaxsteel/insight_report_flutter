import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class CustomChartFilter extends StatefulWidget {
  const CustomChartFilter({super.key, required this.onChanged, this.items});

  final void Function(String) onChanged;
  final List<String>? items;

  @override
  State<CustomChartFilter> createState() => CustomChartFilterState();
}

class CustomChartFilterState extends State<CustomChartFilter> {
  String type = "today";

  @override
  void initState() {
    super.initState();
    if (widget.items != null) {
      type = widget.items!.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.items == null) ...[
          _item(text: "Today", value: "today"),
          _item(text: "Weekly", value: "weekly"),
          _item(text: "Monthly", value: "monthly"),
        ] else
          ...widget.items!.map(
            (e) => _item(text: e, value: e.toLowerCase()),
          ),
      ],
    );
  }

  Widget _item({required String text, required String value}) {
    return Material(
      color: type == value ? AppTheme.primaryColor : Colors.grey[200],
      borderRadius: type == value ? BorderRadius.circular(4) : null,
      child: InkWell(
        onTap: () {
          if (type == value) return;
          setState(() => type = value);
          widget.onChanged(value);
        },
        borderRadius: type == value ? BorderRadius.circular(4) : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 11,
              color: type == value ? Colors.white : Colors.black38,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
