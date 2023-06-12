import 'package:flutter/material.dart';
import 'package:insight_report/widgets/custom_dropdown_button.dart';
import 'package:insight_report/utils/app_theme.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/chart_sample_data.dart';
import '../../utils/utils.dart';

class InsightScreen extends StatelessWidget {
  const InsightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      padding: const EdgeInsets.all(16),
      children: [
        const Text("Goal", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
        const SizedBox(height: 8),
        const _GoalDropdown(),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Monthly Income > Rp. ${Utils.convertMoney(15000000, decimalDigits: 0)}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppTheme.primaryColor),
              ),
              Text(
                "It's 357.1% more likely to be "
                '"monthly incoming > ${Utils.convertMoney(15000000, decimalDigits: 0)}" than in other situations.',
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 16),
              SfCartesianChart(
                plotAreaBorderWidth: 0,
                primaryXAxis: CategoryAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                  isVisible: true,
                ),
                primaryYAxis: NumericAxis(
                  numberFormat: NumberFormat.compactCurrency(locale: "ID_id", symbol: ''),
                  maximum: 25000000,
                  minimum: 0,
                  interval: 5000000,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  axisLine: const AxisLine(width: 0),
                  majorTickLines: const MajorTickLines(size: 0),
                ),
                series: _getSeries(),
                // legend: Legend(isVisible: true, position: LegendPosition.bottom),
                tooltipBehavior: TooltipBehavior(enable: true, format: "point.y"),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Material(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.file_open_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Download Report",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Material(
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppTheme.primaryColor),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bookmark_outline,
                    color: AppTheme.primaryColor,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Add to favorite",
                    style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  List<ColumnSeries<ChartSampleData, String>> _getSeries() {
    List<ChartSampleData> chartData = [
      ChartSampleData(x: 'Januari', y: 22423500),
      ChartSampleData(x: 'Februari', y: 13523500),
      ChartSampleData(x: 'Maret', y: 14800000),
      ChartSampleData(x: 'April', y: 19053000),
      ChartSampleData(x: 'Mei', y: 17053000),
      ChartSampleData(x: 'Juni', y: 14053000),
    ];
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        legendIconType: LegendIconType.rectangle,
        animationDuration: 500,
        width: 0.8,
        spacing: 0.3,
        dataSource: chartData,
        color: AppTheme.primaryColor,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        name: 'Income',
      ),
    ];
  }
}

class _GoalDropdown extends StatefulWidget {
  const _GoalDropdown();

  @override
  State<_GoalDropdown> createState() => _GoalDropdownState();
}

class _GoalDropdownState extends State<_GoalDropdown> {
  String? value = "1";
  @override
  Widget build(BuildContext context) {
    return CustomDropdownButton<String>(
      verticalPadding: 8,
      value: value,
      isDense: true,
      items: [
        CustomDropdownMenuItem(
          text: "Monthly Income",
          value: "1",
        ),
        CustomDropdownMenuItem(
          text: "Monthly Customer",
          value: "2",
        ),
      ],
      onChanged: (value) => setState(() => this.value = value),
    );
  }
}

// Container(
//   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(8),
//   ),
//   child: Row(
//     children: [
//       Container(
//         height: 50,
//         width: 50,
//         decoration: BoxDecoration(
//           color: Colors.grey[100],
//           borderRadius: BorderRadius.circular(4),
//         ),
//         child: const Icon(
//           Icons.upcoming,
//           color: AppTheme.primaryColor,
//           size: 28,
//         ),
//       ),
//       const SizedBox(width: 12),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Your business is increasing by ${Utils.convertMoney(2.5)}%",
//             style: const TextStyle(fontWeight: FontWeight.w500),
//           ),
//           const Text("Keep it going!", style: TextStyle(fontSize: 13, color: Colors.grey)),
//         ],
//       ),
//     ],
//   ),
// ),
