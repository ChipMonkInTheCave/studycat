import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample2 extends StatefulWidget {
  const BarChartSample2({super.key});
  final Color firstBarColor = const Color.fromARGB(255, 119, 66, 243);
  final Color secondBarColor = const Color.fromARGB(255, 67, 26, 147);
  final Color thirdBarColor = const Color.fromARGB(255, 35, 44, 150);
  final Color fourthBarColor = const Color.fromARGB(255, 10, 50, 230);
  final Color avgColor = Colors.black87;
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12, 13, 11);
    final barGroup2 = makeGroupData(1, 16, 12, 10, 17);
    final barGroup3 = makeGroupData(2, 18, 5, 10, 8);
    final barGroup4 = makeGroupData(3, 20, 16, 14, 10);
    final barGroup5 = makeGroupData(4, 17, 6, 9, 14);
    final barGroup6 = makeGroupData(5, 19, 8, 19, 13);
    final barGroup7 = makeGroupData(6, 10, 9, 15, 12);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 38,
                ),
                Text(
                  '성적 그래프',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 38,
            ),
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: 20,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.grey,
                      getTooltipItem: (a, b, c, d) => null,
                    ),
                    touchCallback: (FlTouchEvent event, response) {
                      if (response == null || response.spot == null) {
                        setState(() {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                        });
                        return;
                      }

                      touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                      setState(() {
                        if (!event.isInterestedForInteractions) {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                          return;
                        }
                        showingBarGroups = List.of(rawBarGroups);
                        if (touchedGroupIndex != -1) {
                          var sum = 0.0;
                          for (final rod
                              in showingBarGroups[touchedGroupIndex].barRods) {
                            sum += rod.toY;
                          }
                          final avg = sum /
                              showingBarGroups[touchedGroupIndex]
                                  .barRods
                                  .length;

                          showingBarGroups[touchedGroupIndex] =
                              showingBarGroups[touchedGroupIndex].copyWith(
                            barRods: showingBarGroups[touchedGroupIndex]
                                .barRods
                                .map((rod) {
                              return rod.copyWith(
                                  toY: avg, color: widget.avgColor);
                            }).toList(),
                          );
                        }
                      });
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitles,
                        reservedSize: 42,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        interval: 1,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: showingBarGroups,
                  gridData: FlGridData(show: false),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 4) {
      text = '20';
    } else if (value == 8) {
      text = '40';
    } else if (value == 12) {
      text = '60';
    } else if (value == 16) {
      text = '80';
    } else if (value == 20) {
      text = '100';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 3,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 3, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y1,
    double y2,
    double y3,
    double y4,
  ) {
    return BarChartGroupData(
      barsSpace: 5,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: widget.firstBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: widget.secondBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y3,
          color: widget.thirdBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y4,
          color: widget.fourthBarColor,
          width: width,
        ),
      ],
    );
  }

//   Widget makeTransactionsIcon() {
//     const width = 4.5;
//     const space = 3.5;
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Container(
//           width: width,
//           height: 10,
//           color: Colors.white.withOpacity(0.4),
//         ),
//         const SizedBox(
//           width: space,
//         ),
//         Container(
//           width: width,
//           height: 28,
//           color: Colors.white.withOpacity(0.8),
//         ),
//         const SizedBox(
//           width: space,
//         ),
//         Container(
//           width: width,
//           height: 42,
//           color: Colors.white.withOpacity(1),
//         ),
//         const SizedBox(
//           width: space,
//         ),
//         Container(
//           width: width,
//           height: 28,
//           color: Colors.white.withOpacity(0.8),
//         ),
//         const SizedBox(
//           width: space,
//         ),
//         Container(
//           width: width,
//           height: 10,
//           color: Colors.white.withOpacity(0.4),
//         ),
//       ],
//     );
//   }
}
