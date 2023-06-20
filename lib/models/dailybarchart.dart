import 'dart:async';

// import 'package:resources/appcolors.dart';
// import 'package:fl_chart_app/util/extensions/color_extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';

class DailyBarChart extends StatefulWidget {
  const DailyBarChart({super.key});
  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<DailyBarChart> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              //color: Colors.white,
              // color: const Color.fromARGB(255, 13, 0, 255).withOpacity(0.45),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: BarChart(
                      isPlaying ? randomData() : mainBarData(),
                      swapAnimationDuration: animDuration,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//막대부분
  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          width: width,
          color: const Color.fromARGB(255, 13, 0, 255).withOpacity(0.45),
          borderSide: isTouched
              ? const BorderSide(color: Colors.black87) //.darken(80))
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 100,
            color: const Color.fromARGB(255, 239, 239, 239),
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

//데이터 입력부분
  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        var scores = [];
        for (var j = 0; j < 7; j++) {
          if (context.watch<CloudData>().scoreList["능률 VOCA : DAY1"] != null) {
            if (context.watch<CloudData>().scoreList["능률 VOCA : DAY1"].length -
                    1 -
                    i >=
                0) {
              scores.add(context
                  .watch<CloudData>()
                  .scoreList["능률 VOCA : DAY1"][context
                          .watch<CloudData>()
                          .scoreList["능률 VOCA : DAY1"]
                          .length -
                      7 +
                      i]
                  .toDouble());
            } else {
              scores.add(0.0);
            }
          } else {
            scores.add(0.0);
          }
        }

        switch (i) {
          case 0:
            return makeGroupData(0, scores[0], isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, scores[1], isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, scores[2], isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, scores[3], isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, scores[4], isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, scores[5], isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, scores[6], isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor:
              const Color.fromARGB(255, 127, 75, 239).withOpacity(0.9),
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = 'Mon';
                break;
              case 1:
                weekDay = 'Tue';
                break;
              case 2:
                weekDay = 'Wed';
                break;
              case 3:
                weekDay = 'Thu';
                break;
              case 4:
                weekDay = 'Fri';
                break;
              case 5:
                weekDay = 'Sat';
                break;
              case 6:
                weekDay = 'Sun';
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
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
            showTitles: true, //요일
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            reservedSize: 32,
            interval: 20,
            showTitles: true, //왼쪽 타이틀
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false, //그래프 테두리
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('M', style: style);
        break;
      case 1:
        text = const Text('T', style: style);
        break;
      case 2:
        text = const Text('W', style: style);
        break;
      case 3:
        text = const Text('T', style: style);
        break;
      case 4:
        text = const Text('F', style: style);
        break;
      case 5:
        text = const Text('S', style: style);
        break;
      case 6:
        text = const Text('S', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      gridData: FlGridData(show: false),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 50),
    );
    if (isPlaying) {
      await refreshState();
    }
  }
}
