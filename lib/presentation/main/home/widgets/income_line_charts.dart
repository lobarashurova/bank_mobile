import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class InComeLine extends StatelessWidget {
  InComeLine({
    super.key,
  });

  List<FlSpot> points = const [
    FlSpot(0, 1),
    FlSpot(1, 3),
    FlSpot(2, 10),
    FlSpot(3, 7),
    FlSpot(4, 12),
    FlSpot(5, 13),
    FlSpot(6, 17),
    FlSpot(7, 15),
    FlSpot(8, 20),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      width: 370,
      height: 300,
      child: LineChart(
        LineChartData(
            maxX: 10,
            maxY: 30,
            lineBarsData: [
              LineChartBarData(
                  spots: points, color: context.colors.greenHeadline),
            ],
            borderData: FlBorderData(
              border: Border(
                  bottom: BorderSide(color: context.colors.onPrimary),
                  left: BorderSide(color: context.colors.onPrimary)),
            ),
            titlesData: FlTitlesData(
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return value
                              .toInt()
                              .toString()
                              .s(12)
                              .w(600)
                              .c(context.colors.onPrimary);
                        })),
                leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return value
                              .toInt()
                              .toString()
                              .s(12)
                              .w(600)
                              .c(context.colors.onPrimary);
                        }))),
            gridData: FlGridData(show: false)),
      ),
    );
  }
}
