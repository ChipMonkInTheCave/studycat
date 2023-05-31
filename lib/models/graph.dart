import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class _LineChart extends StatelessWidget {
  const _LineChart({required this.isShowingMainData});

  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1,
      //isShowingMainData ? sampleData1 : sampleData2,
      //swapAnimationDuration: const Duration(milliseconds: 250),
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
  //       lineTouchData: lineTouchData2,
  //       gridData: gridData,
  //       titlesData: titlesData2,
  //       borderData: borderData,
  //       lineBarsData: lineBarsData2,
  //       minX: 0,
  //       maxX: 14,
  //       maxY: 5,
  //       minY: 0,
  //     );

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
        lineChartBarData1_4
      ];

  // LineTouchData get lineTouchData2 => LineTouchData(
  //       enabled: false,
  //     );

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
  //       //lineChartBarData2_1,
  //       //lineChartBarData2_2,
  //       //lineChartBarData2_3,
  //     ];

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
        spots: const [
          //1~5
          FlSpot(1, 4),
          FlSpot(3, 1.5),
          FlSpot(5, 1.4),
          FlSpot(7, 3.4),
          FlSpot(9, 2),
          FlSpot(11, 2.2),
          FlSpot(13, 1.8),
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
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 4.3),
          FlSpot(5, 2.5),
          FlSpot(7, 1.2),
          FlSpot(9, 2.8),
          FlSpot(11, 2.6),
          FlSpot(13, 3.9),
        ],
      );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
        isCurved: true,
        color: const Color.fromARGB(255, 35, 44, 150),
        barWidth: 7,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 2.8),
          FlSpot(3, 1.9),
          FlSpot(5, 3),
          FlSpot(7, 1.6),
          FlSpot(9, 2.5),
          FlSpot(11, 3.5),
          FlSpot(13, 3),
        ],
      );
  LineChartBarData get lineChartBarData1_4 => LineChartBarData(
        isCurved: true,
        color: const Color.fromARGB(255, 160, 64, 239),
        barWidth: 7,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 3.3),
          FlSpot(3, 2.1),
          FlSpot(5, 4.2),
          FlSpot(7, 2.0),
          FlSpot(9, 3.5),
          FlSpot(11, 3.8),
          FlSpot(13, 3),
        ],
      );

  // LineChartBarData get lineChartBarData2_1 => LineChartBarData(
  //       isCurved: true,
  //       curveSmoothness: 0,
  //       color: const Color(0xff6C2DC7),
  //       barWidth: 7,
  //       isStrokeCapRound: true,
  //       dotData: FlDotData(show: false),
  //       belowBarData: BarAreaData(show: false),
  //       spots: const [
  //         FlSpot(1, 1),
  //         FlSpot(3, 4),
  //         FlSpot(5, 1.8),
  //         FlSpot(7, 5),
  //         FlSpot(10, 2),
  //         FlSpot(12, 2.2),
  //         FlSpot(13, 1.8),
  //       ],
  //     );

  // LineChartBarData get lineChartBarData2_2 => LineChartBarData(
  //       isCurved: true,
  //       color: Colors.redAccent,
  //       barWidth: 4,
  //       isStrokeCapRound: true,
  //       dotData: FlDotData(show: false),
  //       belowBarData: BarAreaData(show: true, color: Colors.deepPurple),
  //       spots: const [
  //         FlSpot(1, 1),
  //         FlSpot(3, 2.8),
  //         FlSpot(7, 1.2),
  //         FlSpot(10, 2.8),
  //         FlSpot(12, 2.6),
  //         FlSpot(13, 3.9),
  //       ],
  //     );

  // LineChartBarData get lineChartBarData2_3 => LineChartBarData(
  //       isCurved: true,
  //       curveSmoothness: 0,
  //       color: Colors.blue,
  //       barWidth: 2,
  //       isStrokeCapRound: true,
  //       dotData: FlDotData(show: true),
  //       belowBarData: BarAreaData(show: false),
  //       spots: const [
  //         FlSpot(1, 3.8),
  //         FlSpot(3, 1.9),
  //         FlSpot(6, 5),
  //         FlSpot(10, 3.3),
  //         FlSpot(13, 4.5),
  //       ],
  //     );
}

class LineChartSample1 extends StatefulWidget {
  const LineChartSample1({super.key});

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const Text(
                '성적 그래프',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 14, left: 6),
                  child: _LineChart(isShowingMainData: isShowingMainData),
                ),
              ),
              const SizedBox(
                height: 25, //
              ),
            ],
          ),
        ],
      ),
    );
  }
}
