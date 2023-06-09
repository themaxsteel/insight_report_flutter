import 'package:flutter/material.dart';
import 'package:insight_report/utils/app_theme.dart';
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
        color: AppTheme.primaryColor,
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
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
                Text(
                  "19,324.24",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24, color: Colors.white),
                ),
                // Text(
                //   "+21,25%",
                //   style: TextStyle(color: Colors.white, fontSize: 13),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SfCartesianChart(
                backgroundColor: AppTheme.primaryColor,
                series: _getDefaultLineSeries(),
                primaryXAxis: DateTimeAxis(
                  dateFormat: DateFormat("EEE"),
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  interval: 1,
                  majorGridLines: const MajorGridLines(width: 0),
                  labelStyle: const TextStyle(color: Colors.white),
                ),
                primaryYAxis: NumericAxis(
                  numberFormat: NumberFormat.compactCurrency(decimalDigits: 0, symbol: ''),
                  maximum: 20000,
                  minimum: 0,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  axisLine: const AxisLine(width: 0),
                  majorTickLines: const MajorTickLines(color: Colors.transparent),
                ),
                tooltipBehavior: TooltipBehavior(enable: true),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<SplineAreaSeries<_ChartData, DateTime>> _getDefaultLineSeries() {
    return <SplineAreaSeries<_ChartData, DateTime>>[
      SplineAreaSeries<_ChartData, DateTime>(
        splineType: SplineType.natural,
        color: Colors.transparent,
        borderColor: Colors.orange[100],
        enableTooltip: false,
        borderWidth: 2,
        animationDuration: 500,
        dataSource: chartData,
        name: 'England',
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.y2,
        markerSettings: const MarkerSettings(isVisible: false),
      ),
      SplineAreaSeries<_ChartData, DateTime>(
        splineType: SplineType.natural,
        borderColor: Colors.white,
        borderWidth: 2,
        gradient: LinearGradient(
          colors: <Color>[
            Colors.transparent,
            Colors.white.withOpacity(0.15),
            Colors.white.withOpacity(0.45),
          ],
          stops: const <double>[0.0, 0.4, 1.0],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        // color: const Color(0xFF40b58e),
        animationDuration: 1000,
        dataSource: chartData,
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.y,
        name: 'Rate',
        markerSettings: const MarkerSettings(
          isVisible: true,
          borderWidth: 3,
          borderColor: Colors.white,
          color: AppTheme.primaryColor,
        ),
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
