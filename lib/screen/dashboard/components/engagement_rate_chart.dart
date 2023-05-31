import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EngagementRateChart extends StatefulWidget {
  const EngagementRateChart({
    super.key,
  });

  @override
  State<EngagementRateChart> createState() => _EngagementRateChartState();
}

class _EngagementRateChartState extends State<EngagementRateChart> {
  List<_ChartData> chartData = [];

  @override
  void initState() {
    super.initState();
    chartData = [
      _ChartData(DateTime(2023, 5, DateTime.monday), 500, 10000),
      _ChartData(DateTime(2023, 5, DateTime.tuesday), 10000, 6000),
      _ChartData(DateTime(2023, 5, DateTime.wednesday), 9000, 14050),
      _ChartData(DateTime(2023, 5, DateTime.thursday), 16500, 10034),
      _ChartData(DateTime(2023, 5, DateTime.friday), 10000, 11232),
      _ChartData(DateTime(2023, 5, DateTime.saturday), 15049, 6050),
      _ChartData(DateTime(2023, 5, DateTime.sunday), 5302, 7900)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Engagement Rate (24% vs 27-30 July)",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                Text(
                  "19,324.24",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                ),
                Text(
                  "+21,25%",
                  style: TextStyle(color: Color(0xFF40b58e), fontSize: 13),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 250,
            child: SfCartesianChart(
              series: _getDefaultLineSeries(),
              primaryXAxis: DateTimeAxis(
                dateFormat: DateFormat("EEE"),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                interval: 1,
                majorGridLines: const MajorGridLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                numberFormat: NumberFormat.compactCurrency(decimalDigits: 0, symbol: ''),
                maximum: 20000,
                minimum: 0,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                axisLine: const AxisLine(width: 0),
                majorTickLines: const MajorTickLines(color: Colors.transparent),
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
            ),
          ),
        ],
      ),
    );
  }

  List<SplineSeries<_ChartData, DateTime>> _getDefaultLineSeries() {
    return <SplineSeries<_ChartData, DateTime>>[
      SplineSeries<_ChartData, DateTime>(
        splineType: SplineType.natural,
        color: Colors.orange[100],
        animationDuration: 500,
        dataSource: chartData,
        width: 3,
        name: 'England',
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.y2,
        markerSettings: const MarkerSettings(isVisible: false),
      ),
      SplineSeries<_ChartData, DateTime>(
        splineType: SplineType.natural,
        color: const Color(0xFF40b58e),
        animationDuration: 1000,
        dataSource: chartData,
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.y,
        width: 3,
        name: 'Germany',
        markerSettings: const MarkerSettings(isVisible: true, borderWidth: 4),
      ),
    ];
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.y2);
  final DateTime x;
  final double y;
  final double y2;
}
