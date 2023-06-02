import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/utils.dart';

class TotalEarningCard extends StatelessWidget {
  const TotalEarningCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Total Earning",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                "\$${Utils.convertMoney(923724.23)}",
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
              Text(
                "Updated today at ${Utils.clock24h(DateTime.now())}",
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          SizedBox(
            height: 90,
            width: 90,
            child: SfRadialGauge(
              axes: [
                RadialAxis(
                  showLabels: false,
                  showTicks: false,
                  startAngle: 270,
                  endAngle: 270,
                  radiusFactor: 0.8,
                  axisLineStyle: const AxisLineStyle(thicknessUnit: GaugeSizeUnit.factor, thickness: 0.20),
                  annotations: [
                    GaugeAnnotation(
                      angle: 180,
                      widget: Text(
                        "+${Utils.convertMoney(7.5, decimalDigits: 1)}%",
                        style: const TextStyle(fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                  pointers: [
                    RangePointer(
                      value: 75,
                      sizeUnit: GaugeSizeUnit.factor,
                      enableAnimation: true,
                      animationDuration: 500,
                      width: 0.20,
                      color: AppTheme.primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
