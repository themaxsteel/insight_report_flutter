import 'package:flutter/material.dart';
import 'package:insight_report/utils/app_theme.dart';
import 'package:insight_report/widgets/custom_dropdown_button.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../utils/utils.dart';

class RevenueChart extends StatelessWidget {
  const RevenueChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Revenue", style: TextStyle(fontSize: 16)),
            _RevenueFilter(),
          ],
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SfCartesianChart(
            series: _getDefaultPanningSeries(),
            primaryXAxis: DateTimeAxis(
              dateFormat: DateFormat("HH:mm"),
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              interval: 1,
              majorGridLines: const MajorGridLines(width: 0),
            ),
            primaryYAxis: NumericAxis(
              numberFormat: NumberFormat.compactCurrency(decimalDigits: 2, symbol: '', locale: "ID_id"),
              maximum: 15000,
              minimum: 0,
              interval: 3000,
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
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(DateFormat("HH:mm").format(item.x), style: TextStyle(fontSize: 12, color: Colors.white)),
                      const SizedBox(height: 2),
                      Container(height: 0.6, width: 50, color: Colors.white),
                      const SizedBox(height: 2),
                      Text(
                        "Rp. ${Utils.convertMoney(data.y)}",
                        style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  List<AreaSeries<_ChartData, DateTime>> _getDefaultPanningSeries() {
    List<_ChartData> chartData = [
      _ChartData(DateTime(2023, 6, 12, 8), 2000),
      _ChartData(DateTime(2023, 6, 12, 9), 3000),
      _ChartData(DateTime(2023, 6, 12, 10), 5000),
      _ChartData(DateTime(2023, 6, 12, 11), 2500),
      _ChartData(DateTime(2023, 6, 12, 12), 6000),
      _ChartData(DateTime(2023, 6, 12, 13), null),
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

class _RevenueFilter extends StatefulWidget {
  const _RevenueFilter();

  @override
  State<_RevenueFilter> createState() => _RevenueFilterState();
}

class _RevenueFilterState extends State<_RevenueFilter> {
  String type = "today";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _item(text: "Today", value: "today"),
        _item(text: "Weekly", value: "weekly"),
        _item(text: "Monthly", value: "monthly"),
      ],
    );
  }

  Widget _item({required String text, required String value}) {
    return Material(
      color: type == value ? AppTheme.primaryColor : Colors.grey[200],
      borderRadius: type == value ? BorderRadius.circular(4) : null,
      child: InkWell(
        onTap: () => setState(() => type = value),
        borderRadius: type == value ? BorderRadius.circular(4) : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 11,
              color: type == value ? Colors.white : Colors.black38,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _RevenueDropdown extends StatefulWidget {
  const _RevenueDropdown();

  @override
  State<_RevenueDropdown> createState() => _RevenueDropdownState();
}

class _RevenueDropdownState extends State<_RevenueDropdown> {
  String value = "today";
  @override
  Widget build(BuildContext context) {
    return CustomDropdownButton<String>(
      value: value,
      items: [
        CustomDropdownMenuItem(
          value: "today",
          text: "Today",
        ),
        CustomDropdownMenuItem(
          value: "weekly",
          text: "Weekly",
        ),
        CustomDropdownMenuItem(
          value: "monthly",
          text: "Monthly",
        ),
      ],
      onChanged: (value) => setState(() => this.value = value!),
    );
  }
}

class _ChartData {
  final DateTime x;
  final int? y;

  _ChartData(this.x, this.y);
}
