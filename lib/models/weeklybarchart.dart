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

  final Week1Color = const Color(0xff84B1ED);
  final Week2Color = const Color(0xffC89EC4);
  final Week3Color = const Color(0xffEE7785);
  final Week4Color = const Color(0xff67D5B5);
  final betweenSpace = 1.0;

  List<Legend> legends = [
    Legend('1주차', const Color(0xff84B1ED)),
    Legend('2주차', const Color(0xffC89EC4)),
    Legend('3주차', const Color(0xffEE7785)),
    Legend('4주차', const Color(0xff67D5B5)),
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
    var scoreList = context.read<CloudData>().month();

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
                // 길이 : context.watch<CloudData>().myScore.score['능률 VOCA : DAY1'].length-7
                //key : context.watch<CloudData>().myScore.score['능률 VOCA : DAY1'][길이].keys.elementAt(0)
                //접근 context.watch<CloudData>().myScore.score['능률 VOCA : DAY1'][길이][key][0]
                barGroups: [
                  generateGroupData(
                    0,
                    scoreList[0],
                    scoreList[7],
                    scoreList[14],
                    scoreList[21], //Mon\
                  ),
                  generateGroupData(
                    1,
                    scoreList[1],
                    scoreList[8],
                    scoreList[15],
                    scoreList[22], //Tue
                  ),
                  generateGroupData(
                    2,
                    scoreList[2],
                    scoreList[9],
                    scoreList[16],
                    scoreList[23], //Wed
                  ),
                  generateGroupData(
                    3,
                    scoreList[3],
                    scoreList[10],
                    scoreList[17],
                    scoreList[24], //Thu
                  ),
                  generateGroupData(
                    4,
                    scoreList[4],
                    scoreList[11],
                    scoreList[18],
                    scoreList[25],
                  ), //Fri
                  generateGroupData(
                    5,
                    scoreList[5],
                    scoreList[12],
                    scoreList[19],
                    scoreList[26],
                  ), //Sat
                  generateGroupData(
                    6,
                    scoreList[6],
                    scoreList[13],
                    scoreList[20],
                    scoreList[27],
                  ), //Sun
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
