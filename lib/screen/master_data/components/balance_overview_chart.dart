import 'package:flutter/material.dart';
import 'package:insight_report/model/chart_sample_data.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/utils.dart';

class BalanceOverviewChart extends StatelessWidget {
  const BalanceOverviewChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Balance Overview",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              _BalanceOverviewDropdown(),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.only(top: 12, bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _listTile(
                        icon: const Icon(Icons.arrow_downward, color: AppTheme.primaryColor),
                        title: "Revenue",
                        subtitle: Utils.compactCurrency(234239082),
                      ),
                      _listTile(
                        icon: const Icon(Icons.arrow_upward, color: Colors.red),
                        title: "Expenses",
                        subtitle: Utils.compactCurrency(157239082),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SfCartesianChart(
                  series: _getDefaultLineSeries(),
                  primaryXAxis: DateTimeAxis(
                    dateFormat: DateFormat("MMM"),
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    interval: 1,
                    majorGridLines: const MajorGridLines(width: 0),
                  ),
                  primaryYAxis: NumericAxis(
                    numberFormat: NumberFormat.compactCurrency(locale: 'ID_id', symbol: '', decimalDigits: 0),
                    maximum: 2500000,
                    minimum: 0,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    axisLine: const AxisLine(width: 0),
                    majorTickLines: const MajorTickLines(color: Colors.transparent),
                  ),
                  tooltipBehavior: TooltipBehavior(enable: true),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<SplineAreaSeries<ChartSampleData, DateTime>> _getDefaultLineSeries() {
    List<ChartSampleData> chartData = [
      ChartSampleData(x: DateTime(2023, 1, DateTime.monday), y: 349000, secondSeriesYValue: 1000000),
      ChartSampleData(x: DateTime(2023, 2, DateTime.tuesday), y: 1000000, secondSeriesYValue: 600000),
      ChartSampleData(x: DateTime(2023, 3, DateTime.wednesday), y: 900000, secondSeriesYValue: 1205000),
      ChartSampleData(x: DateTime(2023, 4, DateTime.thursday), y: 1250000, secondSeriesYValue: 1003400),
      ChartSampleData(x: DateTime(2023, 5, DateTime.friday), y: 1000000, secondSeriesYValue: 1123200),
      ChartSampleData(x: DateTime(2023, 6, DateTime.saturday), y: 1204900, secondSeriesYValue: 605000),
      ChartSampleData(x: DateTime(2023, 7, DateTime.sunday), y: 1330200, secondSeriesYValue: 790000)
    ];
    return <SplineAreaSeries<ChartSampleData, DateTime>>[
      SplineAreaSeries<ChartSampleData, DateTime>(
        splineType: SplineType.natural,
        color: Colors.transparent,
        borderColor: Colors.red[200],
        enableTooltip: false,
        borderWidth: 2,
        animationDuration: 500,
        dataSource: chartData,
        name: 'Expenses',
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
      ),
      SplineAreaSeries<ChartSampleData, DateTime>(
        splineType: SplineType.natural,
        borderColor: AppTheme.primaryColor,
        borderWidth: 2,
        color: Colors.transparent,
        animationDuration: 1000,
        dataSource: chartData,
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        name: 'Revenue',
      ),
    ];
  }

  Widget _listTile({required Widget icon, required String title, required String subtitle}) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.grey[100],
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
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Text(
              subtitle,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}

class _BalanceOverviewDropdown extends StatefulWidget {
  const _BalanceOverviewDropdown();

  @override
  State<_BalanceOverviewDropdown> createState() => _BalanceOverviewDropdownState();
}

class _BalanceOverviewDropdownState extends State<_BalanceOverviewDropdown> {
  String type = "year";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: type,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
          isDense: true,
          items: const [
            DropdownMenuItem(
              value: "year",
              child: Text("Year   "),
            ),
            DropdownMenuItem(
              value: "month",
              child: Text("Month   "),
            ),
            DropdownMenuItem(
              value: "day",
              child: Text("Day   "),
            ),
          ],
          onChanged: (value) => setState(() => type = value!),
        ),
      ),
    );
  }
}
