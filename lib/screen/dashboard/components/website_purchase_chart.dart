import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WebsitePurchaseChart extends StatelessWidget {
  const WebsitePurchaseChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Website Purchase",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.grey[800]),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 250,
            child: SfCartesianChart(
              series: _getDefaultPanningSeries(),
              primaryXAxis: DateTimeAxis(
                dateFormat: DateFormat("MMM"),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                interval: 1,
                majorGridLines: const MajorGridLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                // numberFormat: NumberFormat.compactCurrency(decimalDigits: 2, symbol: '\$'),
                maximum: 100,
                minimum: 0,
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                axisLine: const AxisLine(width: 0),
                labelStyle: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),
                majorTickLines: const MajorTickLines(color: Colors.transparent),
              ),
              tooltipBehavior: TooltipBehavior(
                enable: true,
                builder: (data, point, series, pointIndex, seriesIndex) {
                  _ChartData _data = data;
                  return Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(DateFormat("dd MMM").format(_data.x)),
                        Container(height: 0.6, width: 50, color: Colors.black),
                        Text(
                          "${data.y.toString()} Websites",
                          style: TextStyle(fontWeight: FontWeight.w500),
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
    List<_ChartData> chartData = [
      _ChartData(DateTime(2023, 1, 1), 55),
      _ChartData(DateTime(2023, 1, 5), 27),
      _ChartData(DateTime(2023, 1, 10), 49),
      _ChartData(DateTime(2023, 1, 15), 3),
      _ChartData(DateTime(2023, 1, 20), 53),
      _ChartData(DateTime(2023, 1, 25), 80),
      _ChartData(DateTime(2023, 2, 1), 34),
      _ChartData(DateTime(2023, 2, 5), 45),
      _ChartData(DateTime(2023, 2, 10), 43),
      _ChartData(DateTime(2023, 2, 15), 38),
      _ChartData(DateTime(2023, 2, 20), 92),
      _ChartData(DateTime(2023, 2, 25), 12),
      _ChartData(DateTime(2023, 3, 1), 83),
      _ChartData(DateTime(2023, 3, 5), 76),
      _ChartData(DateTime(2023, 3, 10), 21),
      _ChartData(DateTime(2023, 3, 15), 42),
      _ChartData(DateTime(2023, 3, 20), 12),
      _ChartData(DateTime(2023, 3, 25), 10),
      _ChartData(DateTime(2023, 4, 1), 16),
      _ChartData(DateTime(2023, 4, 5), 43),
      _ChartData(DateTime(2023, 4, 10), 32),
      _ChartData(DateTime(2023, 4, 15), 70),
      _ChartData(DateTime(2023, 4, 20), 42),
      _ChartData(DateTime(2023, 4, 25), 53),
      _ChartData(DateTime(2023, 5, 1), 38),
      _ChartData(DateTime(2023, 5, 5), 85),
      _ChartData(DateTime(2023, 5, 10), 22),
      _ChartData(DateTime(2023, 5, 15), 31),
      _ChartData(DateTime(2023, 5, 20), 12),
      _ChartData(DateTime(2023, 5, 25), 20),
      _ChartData(DateTime(2023, 6, 1), 33),
      _ChartData(DateTime(2023, 6, 5), 62),
      _ChartData(DateTime(2023, 6, 10), 43),
      _ChartData(DateTime(2023, 6, 15), 11),
      _ChartData(DateTime(2023, 6, 20), 23),
      _ChartData(DateTime(2023, 6, 25), 45),
      _ChartData(DateTime(2023, 7, 1), 64),
      _ChartData(DateTime(2023, 7, 5), 45),
      _ChartData(DateTime(2023, 7, 10), 23),
      _ChartData(DateTime(2023, 7, 15), 64),
      _ChartData(DateTime(2023, 7, 20), 76),
      _ChartData(DateTime(2023, 7, 25), 65),
    ];
    return <AreaSeries<_ChartData, DateTime>>[
      AreaSeries<_ChartData, DateTime>(
        dataSource: chartData,
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.y,
        borderColor: Colors.orange[100],
        borderDrawMode: BorderDrawMode.top,
        animationDelay: 500,
        borderWidth: 2,
        gradient: LinearGradient(
          colors: <Color>[
            Colors.transparent,
            Colors.orange.withOpacity(0.1),
            Colors.orange.withOpacity(0.4),
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
  final int y;

  _ChartData(this.x, this.y);
}
