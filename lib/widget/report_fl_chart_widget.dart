import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ReportFlChartWidget extends StatefulWidget {
  const ReportFlChartWidget({super.key});

  @override
  State<ReportFlChartWidget> createState() => _ReportFlChartWidgetState();
}

class _ReportFlChartWidgetState extends State<ReportFlChartWidget> {
  final List<double> percentages = [12, 3, 5, 32, 21, 7, 13];

  final List<String> days = ["1", "5", "10", "15", "20", "25", "31"];

  final List<Color> barColors = [
    Colors.pinkAccent.shade100,
    Colors.blue.shade200,
    Colors.amber.shade200,
    Colors.greenAccent.shade200,
    Colors.purple.shade200,
    Colors.cyanAccent.shade100,
    Colors.pink.shade200,
    Colors.amber.shade200,
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: BarChart(
        BarChartData(
          maxY: 40, // since highest is 32%
          barGroups: List.generate(percentages.length, (index) {
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: percentages[index],
                  color: barColors[index],
                  width: 20,
                  borderRadius: BorderRadius.circular(8),
                ),
              ],
              showingTooltipIndicators: [0],
            );
          }),
          titlesData: FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false), // Hide left Y-axis
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  int index = value.toInt();
                  if (index < days.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        days[index],
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ),
          ),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              // tooltipPadding: EdgeInsets.zero,
              // tooltipMargin: 0,
              // // tooltipRoundedRadius: 0,
              // getTooltipColor: (_)=> TColors.black,
              // getTooltipItem: (group, groupIndex, rod, rodIndex) {
              //   return
              //     BarTooltipItem(
              //     "${percentages[groupIndex].toInt()}%",
              //     const TextStyle(
              //       color: Colors.white, // 👈 force text color to white
              //       fontWeight: FontWeight.bold,
              //       fontSize: 14,
              //     ),
              //   );
              // },
            ),
            // touchCallback: TDeviveceGestureCallback((event, response) {}
          ),

          extraLinesData: ExtraLinesData(horizontalLines: []),
        ),
      ),
    );
  }
}

// class ExpenseChartWithLabels extends StatelessWidget {
//   const ExpenseChartWithLabels({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         ReportFlChartWidget(),
//         Positioned.fill(
//           child: LayoutBuilder(
//             builder: (context, constraints) {
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   for (int i = 0; i < [12, 3, 5, 32, 21, 7, 13, 5].length; i++)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Text(
//                           "${[12, 3, 5, 32, 21, 7, 13, 5][i]}%",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 12,
//                           ),
//                         ),
//                         SizedBox(height: 60), // Adjust to align above bars
//                       ],
//                     ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
