import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RateAndAverage extends StatelessWidget {
  const RateAndAverage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              _boxUpDownAnalytics(
                title: "Click Through Rate",
                amount: 5237,
                profitPercent: 43.22,
                isProfit: true,
              ),
              const SizedBox(width: 16),
              _boxUpDownAnalytics(
                title: "Bounce Rate",
                amount: 45393,
                profitPercent: -325.4,
                isProfit: false,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _boxUpDownAnalytics(
                title: "Engagement Rate",
                amount: 675,
                profitPercent: 45.62,
                isProfit: true,
              ),
              const SizedBox(width: 16),
              _boxUpDownAnalytics(
                title: "Avg. Watch Time",
                amount: 213,
                profitPercent: -132.38,
                isProfit: false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _boxUpDownAnalytics(
      {required String title, required num amount, required num profitPercent, required bool isProfit}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
            Text(
              NumberFormat.currency(symbol: '', decimalDigits: 0).format(amount),
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isProfit ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: isProfit ? const Color(0xFF40b58e) : Colors.red,
                ),
                Text(
                  "${isProfit ? '+' : ''}${NumberFormat.currency(symbol: '').format(profitPercent)}%",
                  style: TextStyle(color: isProfit ? const Color(0xFF40b58e) : Colors.red, fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
