import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:studycat/database/db.dart';

class _LineChart extends StatefulWidget {
  List<dynamic> date;
  List<dynamic> kor;
  List<dynamic> eng;
  List<dynamic> math;

  _LineChart({
    required this.isShowingMainData,
    required this.date,
    required this.kor,
    required this.eng,
    required this.math,
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
        maxY: 5,
        minY: 0,
      );

  // LineChartData get sampleData2 => LineChartData(
  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor:
              const Color.fromARGB(255, 216, 224, 227).withOpacity(0.8),
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
      ];

  // LineTouchData get lineTouchData2 => LineTouchData(
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

  // List<LineChartBarData> get lineBarsData2 => [
  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '20';
        break;
      case 2:
        text = '40';
        break;
      case 3:
        text = '60';
        break;
      case 4:
        text = '80';
        break;
      case 5:
        text = '100';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
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
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Mon', style: style);
        break;
      case 3:
        text = const Text('Tue', style: style);
        break;
      case 5:
        text = const Text('Wed', style: style);
        break;
      case 7:
        text = const Text('Thu', style: style);
        break;
      case 9:
        text = const Text('Fri', style: style);
        break;
      case 11:
        text = const Text('Sat', style: style);
        break;
      case 13:
        text = const Text('Sun', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0, //차트와 레이블 사이 공간
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 22,
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
        color: const Color.fromARGB(255, 119, 66, 243),
        barWidth: 7,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: [
          //1~5
          FlSpot(1, (widget.kor[0] / 20).toDouble()),
          FlSpot(3, (widget.kor[1] / 20).toDouble()),
          FlSpot(5, (widget.kor[2] / 20).toDouble()),
          FlSpot(7, (widget.kor[3] / 20).toDouble()),
          FlSpot(9, (widget.kor[4] / 20).toDouble()),
          FlSpot(11, (widget.kor[5] / 20).toDouble()),
          FlSpot(13, (widget.kor[6] / 20).toDouble()),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        color: const Color.fromARGB(255, 67, 26, 147),
        barWidth: 7,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
          color: Colors.greenAccent,
        ),
        spots: [
          FlSpot(1, widget.eng[0] / 20.toDouble()),
          FlSpot(3, widget.eng[1] / 20.toDouble()),
          FlSpot(5, widget.eng[2] / 20.toDouble()),
          FlSpot(7, widget.eng[3] / 20.toDouble()),
          FlSpot(9, widget.eng[4] / 20.toDouble()),
          FlSpot(11, widget.eng[5] / 20.toDouble()),
          FlSpot(13, widget.eng[6] / 20.toDouble()),
        ],
      );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
        isCurved: true,
        color: const Color.fromARGB(255, 35, 44, 150),
        barWidth: 7,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: [
          FlSpot(1, widget.math[0] / 20.toDouble()),
          FlSpot(3, widget.math[1] / 20.toDouble()),
          FlSpot(5, widget.math[2] / 20.toDouble()),
          FlSpot(7, widget.math[3] / 20.toDouble()),
          FlSpot(9, widget.math[4] / 20.toDouble()),
          FlSpot(11, widget.math[5] / 20.toDouble()),
          FlSpot(13, widget.math[6] / 20.toDouble()),
        ],
      );
}

class LineChartSample1 extends StatefulWidget {
  const LineChartSample1({super.key});

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  late bool isShowingMainData;
  List<dynamic> date = [];
  List<dynamic> kor = [];
  List<dynamic> eng = [];
  List<dynamic> math = [];

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: FutureBuilder(
          future: setGraphData('001'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 14, left: 6),
                          child: _LineChart(
                              date: snapshot.data!.date,
                              kor: snapshot.data!.kor,
                              eng: snapshot.data!.eng,
                              math: snapshot.data!.math,
                              isShowingMainData: isShowingMainData),
                        ),
                      ),
                      const SizedBox(
                        height: 25, //
                      ),
                    ],
                  ),
                ],
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text('wating'),
              );
            }
            return const Center(
              child: Text('none'),
            );
          }),
    );
  }
}
