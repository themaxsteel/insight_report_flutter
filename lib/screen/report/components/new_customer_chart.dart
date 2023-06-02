import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../model/chart_sample_data.dart';
import '../../../utils/app_theme.dart';

class NewCustomerChart extends StatelessWidget {
  const NewCustomerChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "138 New Customers",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Container(
          // height: 0,
          padding: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(width: 0),
              isVisible: true,
            ),
            primaryYAxis: NumericAxis(
              maximum: 25,
              minimum: 0,
              interval: 5,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              axisLine: const AxisLine(width: 0),
              majorTickLines: const MajorTickLines(size: 0),
            ),
            series: _getSeries(),
            legend: Legend(isVisible: true, position: LegendPosition.bottom),
            tooltipBehavior: TooltipBehavior(enable: true, format: "point.y Customers"),
          ),
        ),
      ],
    );
  }

  List<ColumnSeries<ChartSampleData, String>> _getSeries() {
    List<ChartSampleData> chartData = [
      ChartSampleData(x: 'Jan', y: 16, secondSeriesYValue: 8, thirdSeriesYValue: 5),
      ChartSampleData(x: 'Feb', y: 24, secondSeriesYValue: 10, thirdSeriesYValue: 6),
      ChartSampleData(x: 'Mar', y: 12, secondSeriesYValue: 16, thirdSeriesYValue: 5),
      ChartSampleData(x: 'Apr', y: 18, secondSeriesYValue: 8, thirdSeriesYValue: 16),
      ChartSampleData(x: 'May', y: 8, secondSeriesYValue: 5, thirdSeriesYValue: 23),
      ChartSampleData(x: 'Jun', y: 12, secondSeriesYValue: 5, thirdSeriesYValue: 6),
      ChartSampleData(x: 'Jul', y: 12, secondSeriesYValue: 22, thirdSeriesYValue: 20),
      ChartSampleData(x: 'Aug', y: 16, secondSeriesYValue: 20, thirdSeriesYValue: 7),
    ];
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        animationDuration: 500,
        dataSource: chartData,
        width: 0.8,
        spacing: 0.3,
        color: AppTheme.primaryColor,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.thirdSeriesYValue,
        name: 'PMS',
      ),
      ColumnSeries<ChartSampleData, String>(
        animationDuration: 500,
        width: 0.8,
        spacing: 0.3,
        dataSource: chartData,
        color: Colors.blue,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        name: 'OrderBil',
      ),
      ColumnSeries<ChartSampleData, String>(
        animationDuration: 500,
        dataSource: chartData,
        width: 0.8,
        spacing: 0.3,
        color: Colors.orange,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
        name: 'GuestAps',
      ),
    ];
  }
}
