import 'package:flutter/material.dart';
import 'package:insight_report/utils/app_theme.dart';
import 'package:insight_report/utils/utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/chart_sample_data.dart';

class MasterDataScreen extends StatelessWidget {
  const MasterDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selling Report"),
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        children: [
          SfCircularChart(
            palette: const [AppTheme.primaryColor, Colors.orange, Colors.blue],
            series: _getDefaultDoughnutSeries(),
            tooltipBehavior: TooltipBehavior(enable: true, format: "point.x : point.y%"),
            legend: Legend(isVisible: true),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _reportListTile(
                      icon: const Icon(
                        Icons.list_alt,
                        color: AppTheme.primaryColor,
                      ),
                      title: Utils.convertMoney(125238, decimalDigits: 0),
                      subtitle: "Transaction",
                    ),
                    _reportListTile(
                      icon: const Icon(
                        Icons.attach_money,
                        color: AppTheme.primaryColor,
                      ),
                      title: Utils.compactCurrency(126203257),
                      subtitle: "Sales",
                    ),
                    _reportListTile(
                      icon: const Icon(
                        Icons.person,
                        color: AppTheme.primaryColor,
                      ),
                      title: Utils.compactCurrency(1324),
                      subtitle: "Customer",
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(height: 0.5, width: double.infinity, color: Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _reportListTile({required Widget icon, required String title, required String subtitle}) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(40),
          ),
          child: icon,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
            ),
            Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  List<DoughnutSeries<ChartSampleData, String>> _getDefaultDoughnutSeries() {
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
        animationDuration: 1000,
        radius: '90%',
        // explode: true,
        // explodeOffset: '10%',
        dataSource: <ChartSampleData>[
          ChartSampleData(x: 'Cloud PMS', y: 55, text: '45%'),
          ChartSampleData(x: 'GuestAps', y: 21, text: '31%'),
          ChartSampleData(x: 'Orderbil', y: 24, text: '24%'),
        ],
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y,
        dataLabelMapper: (ChartSampleData data, _) => data.text,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
          textStyle: TextStyle(color: Colors.white, fontSize: 13),
        ),
      )
    ];
  }
}
