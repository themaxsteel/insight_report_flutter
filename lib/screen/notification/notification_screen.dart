import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      padding: const EdgeInsets.all(16),
      children: [],
    );
  }
}

// Container(
//   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(8),
//   ),
//   child: Row(
//     children: [
//       Container(
//         height: 50,
//         width: 50,
//         decoration: BoxDecoration(
//           color: Colors.grey[100],
//           borderRadius: BorderRadius.circular(4),
//         ),
//         child: const Icon(
//           Icons.upcoming,
//           color: AppTheme.primaryColor,
//           size: 28,
//         ),
//       ),
//       const SizedBox(width: 12),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Your business is increasing by ${Utils.convertMoney(2.5)}%",
//             style: const TextStyle(fontWeight: FontWeight.w500),
//           ),
//           const Text("Keep it going!", style: TextStyle(fontSize: 13, color: Colors.grey)),
//         ],
//       ),
//     ],
//   ),
// ),
