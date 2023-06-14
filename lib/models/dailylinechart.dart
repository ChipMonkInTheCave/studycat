import 'dart:ffi';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/database/db.dart';
import 'package:studycat/provider/provider.dart';

class _LineChart extends StatefulWidget {
  const _LineChart({
    required this.isShowingMainData,
  });

  final bool isShowingMainData;

  @override
  State<_LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<_LineChart> {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1,
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: 14,
        maxY: 100,
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor:
              const Color.fromARGB(255, 127, 75, 239).withOpacity(0.9),
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -10,
          getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
            final List<LineTooltipItem> tooltipItems = lineBarsSpot.map((spot) {
              String weekDay;
              switch (spot.x.toInt()) {
                case 1:
                  weekDay = 'Mon';
                  break;
                case 3:
                  weekDay = 'Tue';
                  break;
                case 5:
                  weekDay = 'Wed';
                  break;
                case 7:
                  weekDay = 'Thu';
                  break;
                case 9:
                  weekDay = 'Fri';
                  break;
                case 11:
                  weekDay = 'Sat';
                  break;
                case 13:
                  weekDay = 'Sun';
                  break;
                default:
                  weekDay = '';
                  break;
              }

              return LineTooltipItem(
                '$weekDay\n',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (spot.y).toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }).toList();

            return tooltipItems;
          },
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
      ];

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 20:
        text = '20';
        break;
      case 40:
        text = '40';
        break;
      case 60:
        text = '60';
        break;
      case 80:
        text = '80';
        break;
      case 100:
        text = '100';
        break;
      default:
        return Container();
    }
    return Text(
      text,
      style: style,
      textAlign: TextAlign.center,
    );
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 15,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('M', style: style);
        break;
      case 3:
        text = const Text('T', style: style);
        break;
      case 5:
        text = const Text('W', style: style);
        break;
      case 7:
        text = const Text('T', style: style);
        break;
      case 9:
        text = const Text('F', style: style);
        break;
      case 11:
        text = const Text('S', style: style);
        break;
      case 13:
        text = const Text('S', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10, //차트와 레이블 사이 공간
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 25,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Colors.grey, width: 2),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: const Color.fromARGB(255, 13, 0, 255).withOpacity(0.45),
        barWidth: 6,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: [
          //1~5
          //context.watch<CloudData>().myScore.score['section1'][0]['2023-05-01'],
          //for (double i = 0; i < 7; i++)
          // FlSpot(
          //     context.watch<CloudData>().myScore.score['section1'][0]
          //         ['2023-05-01'][1],
          //     context.watch<CloudData>().myScore.score['section1'][0]
          //         ['2023-05-01'][0])
          //FlSpot(1 + (2 * i), Random().nextInt(99 + 1).toDouble()),
          FlSpot(
              1,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['능률 VOCA : DAY1'][context
                              .watch<CloudData>()
                              .myScore
                              .score['능률 VOCA : DAY1']
                              .length -
                          7][
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['능률 VOCA : DAY1'][context
                                  .watch<CloudData>()
                                  .myScore
                                  .score['능률 VOCA : DAY1']
                                  .length -
                              7]
                          .keys
                          .elementAt(0)][0]
                  .toDouble()),
          FlSpot(
              3,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['능률 VOCA : DAY1'][context
                              .watch<CloudData>()
                              .myScore
                              .score['능률 VOCA : DAY1']
                              .length -
                          6][
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['능률 VOCA : DAY1'][context
                                  .watch<CloudData>()
                                  .myScore
                                  .score['능률 VOCA : DAY1']
                                  .length -
                              6]
                          .keys
                          .elementAt(0)][0]
                  .toDouble()),
          FlSpot(
              5,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['능률 VOCA : DAY1'][context
                              .watch<CloudData>()
                              .myScore
                              .score['능률 VOCA : DAY1']
                              .length -
                          5][
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['능률 VOCA : DAY1'][context
                                  .watch<CloudData>()
                                  .myScore
                                  .score['능률 VOCA : DAY1']
                                  .length -
                              5]
                          .keys
                          .elementAt(0)][0]
                  .toDouble()),
          FlSpot(
              7,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['능률 VOCA : DAY1'][context
                              .watch<CloudData>()
                              .myScore
                              .score['능률 VOCA : DAY1']
                              .length -
                          4][
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['능률 VOCA : DAY1'][context
                                  .watch<CloudData>()
                                  .myScore
                                  .score['능률 VOCA : DAY1']
                                  .length -
                              4]
                          .keys
                          .elementAt(0)][0]
                  .toDouble()),
          FlSpot(
              9,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['능률 VOCA : DAY1'][context
                              .watch<CloudData>()
                              .myScore
                              .score['능률 VOCA : DAY1']
                              .length -
                          3][
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['능률 VOCA : DAY1'][context
                                  .watch<CloudData>()
                                  .myScore
                                  .score['능률 VOCA : DAY1']
                                  .length -
                              3]
                          .keys
                          .elementAt(0)][0]
                  .toDouble()),
          FlSpot(
              11,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['능률 VOCA : DAY1'][context
                              .watch<CloudData>()
                              .myScore
                              .score['능률 VOCA : DAY1']
                              .length -
                          2][
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['능률 VOCA : DAY1'][context
                                  .watch<CloudData>()
                                  .myScore
                                  .score['능률 VOCA : DAY1']
                                  .length -
                              2]
                          .keys
                          .elementAt(0)][0]
                  .toDouble()),
          FlSpot(
              13,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['능률 VOCA : DAY1'][context
                              .watch<CloudData>()
                              .myScore
                              .score['능률 VOCA : DAY1']
                              .length -
                          1][
                      context
                          .watch<CloudData>()
                          .myScore
                          .score['능률 VOCA : DAY1'][context
                                  .watch<CloudData>()
                                  .myScore
                                  .score['능률 VOCA : DAY1']
                                  .length -
                              1]
                          .keys
                          .elementAt(0)][0]
                  .toDouble()),
        ],
      );
}

class DailyLineChart extends StatefulWidget {
  const DailyLineChart({super.key});

  @override
  State<StatefulWidget> createState() => DailyLineChartState();
}

class DailyLineChartState extends State<DailyLineChart> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390,
      height: 400,
      child: FutureBuilder(
        future: setGraphData('001'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 14, left: 6),
                        child: _LineChart(
                          isShowingMainData: isShowingMainData,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ],
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text('loading'),
            );
          }
          return const Center(
            child: Text('none'),
          );
        },
      ),
    );
  }
}
