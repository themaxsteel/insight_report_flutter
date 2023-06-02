import 'package:flutter/material.dart';
import 'package:insight_report/screen/report/components/sales_details_widget.dart';

import 'components/new_customer_chart.dart';
import 'components/total_earning_card.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      children: [
        TotalEarningCard(),
        SizedBox(height: 24),
        NewCustomerChart(),
        SizedBox(height: 24),
        SalesDetailsWidget(),
      ],
    );
  }
}
