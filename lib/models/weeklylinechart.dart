import 'dart:ffi';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/database/db.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/widgets/indicator.dart';

class _LineChart extends StatefulWidget {
  _LineChart({
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
          tooltipBgColor: Colors.white.withOpacity(0.6),
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -10,
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
        lineChartBarData1_2,
        lineChartBarData1_3,
        lineChartBarData1_4
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
        color: const Color.fromARGB(255, 23, 14, 192).withOpacity(0.9),
        barWidth: 4,
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
                  .score['section3'][0]['2023-05-01'][0]
                  .toDouble()),
          FlSpot(
              3,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][1]['2023-05-02'][0]
                  .toDouble()),
          FlSpot(
              5,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][2]['2023-05-03'][0]
                  .toDouble()),
          FlSpot(
              7,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][3]['2023-05-04'][0]
                  .toDouble()),
          FlSpot(
              9,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][4]['2023-05-05'][0]
                  .toDouble()),
          FlSpot(
              11,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][5]['2023-05-06'][0]
                  .toDouble()),
          FlSpot(
              13,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][6]['2023-05-07'][0]
                  .toDouble()),
        ],
      );
  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        color: const Color.fromARGB(255, 135, 74, 248).withOpacity(1),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: [
          FlSpot(
              1,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][7]['2023-05-08'][0]
                  .toDouble()),
          FlSpot(
              3,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][8]['2023-05-09'][0]
                  .toDouble()),
          FlSpot(
              5,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][9]['2023-05-10'][0]
                  .toDouble()),
          FlSpot(
              7,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][10]['2023-05-11'][0]
                  .toDouble()),
          FlSpot(
              9,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][11]['2023-05-12'][0]
                  .toDouble()),
          FlSpot(
              11,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][12]['2023-05-13'][0]
                  .toDouble()),
          FlSpot(
              13,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][13]['2023-05-14'][0]
                  .toDouble()),
        ],
      );
  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
        isCurved: true,
        color: const Color.fromARGB(255, 80, 49, 205).withOpacity(0.9),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: [
          FlSpot(
              1,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][14]['2023-05-15'][0]
                  .toDouble()),
          FlSpot(
              3,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][15]['2023-05-16'][0]
                  .toDouble()),
          FlSpot(
              5,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][16]['2023-05-17'][0]
                  .toDouble()),
          FlSpot(
              7,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][17]['2023-05-18'][0]
                  .toDouble()),
          FlSpot(
              9,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][18]['2023-05-19'][0]
                  .toDouble()),
          FlSpot(
              11,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][19]['2023-05-20'][0]
                  .toDouble()),
          FlSpot(
              13,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][20]['2023-05-21'][0]
                  .toDouble()),
        ],
      );
  LineChartBarData get lineChartBarData1_4 => LineChartBarData(
        isCurved: true,
        color: const Color.fromARGB(255, 110, 102, 252).withOpacity(1),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: [
          FlSpot(
              1,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][21]['2023-05-22'][0]
                  .toDouble()),
          FlSpot(
              3,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][22]['2023-05-23'][0]
                  .toDouble()),
          FlSpot(
              5,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][23]['2023-05-24'][0]
                  .toDouble()),
          FlSpot(
              7,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][24]['2023-05-25'][0]
                  .toDouble()),
          FlSpot(
              9,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][25]['2023-05-26'][0]
                  .toDouble()),
          FlSpot(
              11,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][26]['2023-05-27'][0]
                  .toDouble()),
          FlSpot(
              13,
              context
                  .watch<CloudData>()
                  .myScore
                  .score['section3'][27]['2023-05-28'][0]
                  .toDouble()),
        ],
      );
}

class WeeklyLineChart extends StatefulWidget {
  const WeeklyLineChart({super.key});

  @override
  State<StatefulWidget> createState() => WeeklyLineChartState();
}

class WeeklyLineChartState extends State<WeeklyLineChart> {
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
      height: 420,
      child: FutureBuilder(
        future: setGraphData('001'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[],
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Indicator(
                            color: const Color.fromARGB(255, 23, 14, 192)
                                .withOpacity(0.9),
                            text: '1주차',
                            isSquare: false,
                            //size: touchedIndex == 0?18:16,
                            textColor: Colors.black),
                        Indicator(
                          color: const Color.fromARGB(255, 135, 74, 248)
                              .withOpacity(1),
                          text: '2주차',
                          isSquare: false,
                          textColor: Colors.black,
                        ),
                        Indicator(
                          color: const Color.fromARGB(255, 80, 49, 205)
                              .withOpacity(0.9),
                          text: '3주차',
                          isSquare: false,
                          textColor: Colors.black,
                        ),
                        Indicator(
                          color: const Color.fromARGB(255, 110, 102, 252)
                              .withOpacity(1),
                          text: '4주차',
                          isSquare: false,
                          textColor: Colors.black,
                        )
                      ],
                    )
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
