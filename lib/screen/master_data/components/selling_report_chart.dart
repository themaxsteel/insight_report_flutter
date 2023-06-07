import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../model/chart_sample_data.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/utils.dart';

class SellingReportChart extends StatelessWidget {
  const SellingReportChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SfCircularChart(
            palette: const [AppTheme.primaryColor, Colors.orange, Colors.blue],
            series: _getDefaultDoughnutSeries(),
            tooltipBehavior: _toolTipBehavior(),
            annotations: [
              CircularChartAnnotation(
                widget: const Text(
                  "Total\nTransaction",
                  style: TextStyle(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
            legend: Legend(isVisible: true, position: LegendPosition.bottom),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
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
                    subtitle: "Client",
                  ),
                ],
              ),
              // const SizedBox(height: 12),
              // Container(height: 0.5, width: double.infinity, color: Colors.grey),
            ],
          ),
        ),
      ],
    );
  }

  TooltipBehavior _toolTipBehavior() {
    return TooltipBehavior(
      enable: true,
      format: "point.x : point.y%",
      builder: (data, point, series, pointIndex, seriesIndex) {
        var chart = data as ChartSampleData;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                point.x,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
              Text(
                "${Utils.convertMoney(chart.thirdSeriesYValue!.toInt(), decimalDigits: 0)} Transactions",
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
        );
      },
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
        animationDuration: 500,
        legendIconType: LegendIconType.circle,
        animationDelay: 500,
        radius: '90%',
        // explode: true,
        // explodeOffset: '10%',
        dataSource: <ChartSampleData>[
          ChartSampleData(x: 'Cloud PMS', y: 55, text: '45%', thirdSeriesYValue: 56357),
          ChartSampleData(x: 'GuestAps', y: 21, text: '21%', thirdSeriesYValue: 30057),
          ChartSampleData(x: 'Orderbil', y: 24, text: '24%', thirdSeriesYValue: 38823),
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
