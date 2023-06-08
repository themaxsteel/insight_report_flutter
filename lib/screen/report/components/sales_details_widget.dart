import 'package:flutter/material.dart';
import 'package:insight_report/utils/app_theme.dart';
import 'package:insight_report/utils/utils.dart';

class SalesDetailsWidget extends StatelessWidget {
  const SalesDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Sales Details",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _salesDetailsItem(
              icon: const Icon(Icons.person, color: AppTheme.primaryColor, size: 26),
              title: Utils.compactCurrency(1223),
              label: "Total Customers",
            ),
            const SizedBox(width: 16),
            _salesDetailsItem(
              icon: const Icon(Icons.monetization_on, color: AppTheme.primaryColor, size: 26),
              title: Utils.compactCurrency(1023547),
              label: "Total Subscription",
            ),
          ],
        ),
      ],
    );
  }

  Widget _salesDetailsItem({required Widget icon, required String title, required String label}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              child: icon,
              // Icon(Icons.person, color: Colors.grey[600], size: 28),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              // Utils.compactCurrency(1211, decimalDigits: 2),
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            Text(
              label,
              // "Total Customers",
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
