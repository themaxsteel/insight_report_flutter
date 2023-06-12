import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../utils/utils.dart';

class CostPerWebsiteChart extends StatefulWidget {
  const CostPerWebsiteChart({super.key});

  @override
  State<CostPerWebsiteChart> createState() => _CostPerWebsiteChartState();
}

class _CostPerWebsiteChartState extends State<CostPerWebsiteChart> {
  List<_ChartData> chartData = [
    _ChartData(DateTime(2023, 1, 1), 140000),
    _ChartData(DateTime(2023, 1, 5), 160000.42),
    _ChartData(DateTime(2023, 1, 13), 180000),
    _ChartData(DateTime(2023, 1, 20), 140000),
    _ChartData(DateTime(2023, 1, 28), 180000),
    _ChartData(DateTime(2023, 2, 1), 80000),
    _ChartData(DateTime(2023, 2, 10), 140000),
    _ChartData(DateTime(2023, 2, 13), 180000),
    _ChartData(DateTime(2023, 2, 19), 150000),
    _ChartData(DateTime(2023, 2, 23), 120000),
    _ChartData(DateTime(2023, 2, 25), 130000),
    _ChartData(DateTime(2023, 3, 1), 50000),
    _ChartData(DateTime(2023, 3, 5), 160000),
    _ChartData(DateTime(2023, 3, 12), 50000),
    _ChartData(DateTime(2023, 3, 23), 120000),
    _ChartData(DateTime(2023, 4, 10), 140000),
    _ChartData(DateTime(2023, 4, 17), 100000),
    _ChartData(DateTime(2023, 4, 28), 170000),
    _ChartData(DateTime(2023, 5, 7), 100000),
    _ChartData(DateTime(2023, 5, 13), 180000),
    _ChartData(DateTime(2023, 5, 23), 50000),
    _ChartData(DateTime(2023, 6, 1), 70000),
    _ChartData(DateTime(2023, 6, 8), 80000),
    _ChartData(DateTime(2023, 6, 12), 50000),
    _ChartData(DateTime(2023, 6, 23), 120000),
    _ChartData(DateTime(2023, 7, 1), 140000),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cost per Website Purchase",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.grey[800]),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SfCartesianChart(
              series: _getDefaultPanningSeries(),
              primaryXAxis: DateTimeAxis(
                dateFormat: DateFormat("MMM"),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                interval: 1,
                majorGridLines: const MajorGridLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                numberFormat: NumberFormat.compactCurrency(decimalDigits: 0, symbol: '', locale: "ID_id"),
                maximum: 200000,
                interval: 40000,
                minimum: 0,
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                axisLine: const AxisLine(width: 0),
                labelStyle: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),
                majorTickLines: const MajorTickLines(color: Colors.transparent),
              ),
              tooltipBehavior: TooltipBehavior(
                enable: true,
                builder: (data, point, series, pointIndex, seriesIndex) {
                  _ChartData item = data;
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(DateFormat("dd MMM").format(item.x), style: TextStyle(fontSize: 12)),
                        const SizedBox(height: 2),
                        Container(height: 0.6, width: 50, color: Colors.black),
                        const SizedBox(height: 2),
                        Text(
                          "Rp. ${Utils.convertMoney(item.y)}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<AreaSeries<_ChartData, DateTime>> _getDefaultPanningSeries() {
    return <AreaSeries<_ChartData, DateTime>>[
      AreaSeries<_ChartData, DateTime>(
        dataSource: chartData,
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.y,
        borderColor: const Color(0xFF40b58e),
        animationDelay: 500,
        borderWidth: 2,
        gradient: LinearGradient(
          colors: <Color>[
            Colors.transparent,
            const Color(0xFF40b58e).withOpacity(0.1),
            const Color(0xFF40b58e).withOpacity(0.5)
          ],
          stops: const <double>[0.0, 0.4, 1.0],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      )
    ];
  }
}

class _ChartData {
  final DateTime x;
  final double y;

  _ChartData(this.x, this.y);
}
