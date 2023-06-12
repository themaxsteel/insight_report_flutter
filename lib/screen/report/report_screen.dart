import 'package:flutter/material.dart';

import 'components/new_customer_chart.dart';
import 'components/recent_activity_widget.dart';
import 'components/revenue_chart.dart';
import 'components/sales_details_widget.dart';
import 'components/total_earning_card.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      children: const [
        TotalEarningCard(),
        SizedBox(height: 24),
        NewCustomerChart(),
        SizedBox(height: 24),
        SalesDetailsWidget(),
        SizedBox(height: 24),
        RevenueChart(),
        SizedBox(height: 24),
        RecentActivityWidget(),
        SizedBox(height: 24),
      ],
    );
  }
}
