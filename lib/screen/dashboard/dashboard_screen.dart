import 'package:flutter/material.dart';
import 'package:insight_report/screen/dashboard/components/rate_and_average.dart';
import 'package:insight_report/screen/dashboard/components/website_purchase_chart.dart';

import 'components/cost_website_chart.dart';
import 'components/engagement_rate_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome Back!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              Text("Hi, William Vengeance!", style: TextStyle(color: Colors.grey, fontSize: 13)),
            ],
          ),
        ),
        SizedBox(height: 24),
        EngagementRateChart(),
        SizedBox(height: 32),
        RateAndAverage(),
        SizedBox(height: 24),
        CostPerWebsiteChart(),
        SizedBox(height: 24),
        WebsitePurchaseChart(),
      ],
    );
  }
}
