import 'package:flutter/material.dart';

import 'components/balance_overview_chart.dart';
import 'components/selling_report_chart.dart';

class MasterDataScreen extends StatelessWidget {
  const MasterDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Master Report"),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 32),
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        children: const [
          SellingReportChart(),
          SizedBox(height: 24),
          BalanceOverviewChart(),
        ],
      ),
    );
  }
}
