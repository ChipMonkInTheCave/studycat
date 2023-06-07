//import 'package:fl_chart_app/presentation/resources/app_resources.dart';
//import 'package:fl_chart_app/presentation/widgets/legend_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';

class Legend {
  final String name;
  final Color color;

  Legend(this.name, this.color);
}

class WeeklyBarChart extends StatelessWidget {
  WeeklyBarChart({super.key});

  final Week1Color = const Color.fromARGB(255, 23, 14, 192).withOpacity(0.9);
  final Week2Color = const Color.fromARGB(255, 135, 74, 248).withOpacity(1);
  final Week3Color = const Color.fromARGB(255, 80, 49, 205).withOpacity(0.9);
  final Week4Color = const Color.fromARGB(255, 110, 102, 252).withOpacity(1);
  final betweenSpace = 0.9;

  List<Legend> legends = [
    Legend('1주차', const Color.fromARGB(255, 23, 14, 192).withOpacity(0.9)),
    Legend('2주차', const Color.fromARGB(255, 135, 74, 248).withOpacity(1)),
    Legend('3주차', const Color.fromARGB(255, 80, 49, 205).withOpacity(0.9)),
    Legend('4주차', const Color.fromARGB(255, 110, 102, 252).withOpacity(1)),
  ];

  BarChartGroupData generateGroupData(
    int x,
    double week1,
    double week2,
    double week3,
    double week4,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: week1,
          color: Week1Color,
          width: 17,
        ),
        BarChartRodData(
          fromY: week1 + betweenSpace,
          toY: week1 + betweenSpace + week2,
          color: Week2Color,
          width: 17,
        ),
        BarChartRodData(
          fromY: week1 + betweenSpace + week2 + betweenSpace,
          toY: week1 + betweenSpace + week2 + betweenSpace + week3,
          color: Week3Color,
          width: 17,
        ),
        BarChartRodData(
          fromY: week1 +
              betweenSpace +
              week2 +
              betweenSpace +
              week3 +
              betweenSpace,
          toY: week1 +
              betweenSpace +
              week2 +
              betweenSpace +
              week3 +
              betweenSpace +
              week4,
          color: Week4Color,
          width: 17,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 15, fontWeight: FontWeight.w600);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'M';
        break;
      case 1:
        text = 'T';
        break;
      case 2:
        text = 'W';
        break;
      case 3:
        text = 'T';
        break;
      case 4:
        text = 'F';
        break;
      case 5:
        text = 'S';
        break;
      case 6:
        text = 'S';
        break;
      default:
        text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceBetween,
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(),
                  rightTitles: AxisTitles(),
                  topTitles: AxisTitles(),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: bottomTitles,
                      reservedSize: 30,
                    ),
                  ),
                ),
                barTouchData: BarTouchData(enabled: false),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),
                barGroups: [
                  generateGroupData(
                      0,
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][0]['2023-05-01'][0]
                          .toDouble(),
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][7]['2023-05-08'][0]
                          .toDouble(),
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][14]['2023-05-15'][0]
                          .toDouble(),
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][21]['2023-05-22'][0]
                          .toDouble()), //Mon
                  generateGroupData(
                      1,
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][1]['2023-05-02'][0]
                          .toDouble(),
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][8]['2023-05-09'][0]
                          .toDouble(),
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][15]['2023-05-16'][0]
                          .toDouble(),
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][22]['2023-05-23'][0]
                          .toDouble()), //Tue
                  generateGroupData(
                      2,
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][2]['2023-05-03'][0]
                          .toDouble(),
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][9]['2023-05-10'][0]
                          .toDouble(),
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][16]['2023-05-17'][0]
                          .toDouble(),
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][23]['2023-05-24'][0]
                          .toDouble()), //Wed
                  generateGroupData(
                      3,
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][3]['2023-05-04'][0]
                          .toDouble(),
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][10]['2023-05-11'][0]
                          .toDouble(),
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][17]['2023-05-18'][0]
                          .toDouble(),
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][24]['2023-05-25'][0]
                          .toDouble()), //Thu
                  generateGroupData(
                      4,
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][4]['2023-05-05'][0]
                          .toDouble(),
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][11]['2023-05-12'][0]
                          .toDouble(),
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][18]['2023-05-19'][0]
                          .toDouble(),
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][25]['2023-05-26'][0]
                          .toDouble()), //Fri
                  generateGroupData(
                      5,
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][5]['2023-05-06'][0]
                          .toDouble(),
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][12]['2023-05-13'][0]
                          .toDouble(),
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][19]['2023-05-20'][0]
                          .toDouble(),
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][26]['2023-05-27'][0]
                          .toDouble()), //Sat
                  generateGroupData(
                      6,
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][6]['2023-05-07'][0]
                          .toDouble(),
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][13]['2023-05-14'][0]
                          .toDouble(),
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][20]['2023-05-21'][0]
                          .toDouble(),
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['section3'][27]['2023-05-28'][0]
                          .toDouble()), //Sun
                ],
                maxY: 400 + (betweenSpace * 3),
                extraLinesData: ExtraLinesData(
                  horizontalLines: [
                    HorizontalLine(
                      y: 0,
                      color: Week1Color,
                      strokeWidth: 1,
                      dashArray: [15, 4],
                    ),
                    HorizontalLine(
                      y: 100,
                      color: Week2Color,
                      strokeWidth: 1,
                      dashArray: [15, 4],
                    ),
                    HorizontalLine(
                      y: 200,
                      color: Week3Color,
                      strokeWidth: 1,
                      dashArray: [15, 4],
                    ),
                    HorizontalLine(
                      y: 300,
                      color: Week3Color,
                      strokeWidth: 1,
                      dashArray: [15, 4],
                    ),
                    HorizontalLine(
                      y: 400,
                      color: Week3Color,
                      strokeWidth: 1,
                      dashArray: [15, 4],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: legends.map((legend) {
              return Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: legend.color,
                    ),
                    // color: legend.color,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    legend.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
