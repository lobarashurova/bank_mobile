import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarWidget extends StatelessWidget {
  const BarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      width: MediaQuery.of(context).size.width,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceEvenly,
          maxY: 20,
          minY: 0,
          barTouchData: BarTouchData(enabled: true),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toString(),
                    style: TextStyle(color: Colors.white),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return const Text('Mon',
                          style: TextStyle(color: Colors.white));
                    case 1:
                      return const Text('Tue',
                          style: TextStyle(color: Colors.white));
                    case 2:
                      return const Text('Wed',
                          style: TextStyle(color: Colors.white));
                    case 3:
                      return const Text('Thu',
                          style: TextStyle(color: Colors.white));
                    case 4:
                      return const Text('Fri',
                          style: TextStyle(color: Colors.white));
                    default:
                      return const Text('',
                          style: TextStyle(color: Colors.white));
                  }
                },
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.black),
          ),
          barGroups: [10, 12, 8, 15, 7]
              .asMap()
              .entries
              .map((e) => BarChartGroupData(
                    x: e.key,
                    barRods: [
                      BarChartRodData(
                        toY: e.value.toDouble(),
                        color: context.colors.lightBlue,
                        width: 20,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
