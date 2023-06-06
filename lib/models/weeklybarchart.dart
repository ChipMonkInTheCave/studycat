//import 'package:fl_chart_app/presentation/resources/app_resources.dart';
//import 'package:fl_chart_app/presentation/widgets/legend_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Legend {
  final String name;
  final Color color;

  Legend(this.name, this.color);
}

class WeeklyChart extends StatelessWidget {
  WeeklyChart({super.key});

  final MonColor = Colors.purple;
  final TueColor = Colors.blue;
  final WedColor = Colors.cyan;
  final ThuColor = Colors.black;
  final FriColor = Colors.black;
  final SatColor = Colors.black;
  final SunColor = Colors.black;
  final betweenSpace = 0.2;

  List<Legend> legends = [
    Legend('Mon', Colors.purple),
    Legend('Tue', Colors.blue),
    Legend('Wed', Colors.cyan),
    Legend('Thu', Colors.cyan),
    Legend('Fri', Colors.cyan),
    Legend('Sat', Colors.cyan),
    Legend('Sun', Colors.cyan),
  ];

  BarChartGroupData generateGroupData(
    int x,
    double Mon,
    double Tue,
    double Wed,
    double Thu,
    double Fri,
    double Sat,
    double Sun,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: Mon,
          color: MonColor,
          width: 15,
        ),
        BarChartRodData(
          fromY: Mon + betweenSpace,
          toY: Mon + betweenSpace + Tue,
          color: TueColor,
          width: 15,
        ),
        BarChartRodData(
          fromY: Mon + betweenSpace + Tue + betweenSpace,
          toY: Mon + betweenSpace + Tue + betweenSpace + Wed,
          color: WedColor,
          width: 15,
        ),
        BarChartRodData(
          fromY: Mon + betweenSpace + Tue + betweenSpace + Wed,
          toY: Mon +
              betweenSpace +
              Tue +
              betweenSpace +
              Wed +
              betweenSpace +
              Thu,
          color: WedColor,
          width: 15,
        ),
        BarChartRodData(
          fromY: Mon +
              betweenSpace +
              Tue +
              betweenSpace +
              Wed +
              betweenSpace +
              Thu,
          toY: Mon +
              betweenSpace +
              Tue +
              betweenSpace +
              Wed +
              betweenSpace +
              Thu +
              betweenSpace +
              Fri,
          color: WedColor,
          width: 15,
        ),
        BarChartRodData(
          fromY: Mon +
              betweenSpace +
              Tue +
              betweenSpace +
              Wed +
              betweenSpace +
              Thu +
              betweenSpace +
              Fri,
          toY: Mon +
              betweenSpace +
              Tue +
              betweenSpace +
              Wed +
              betweenSpace +
              Thu +
              betweenSpace +
              Fri +
              betweenSpace +
              Sat,
          color: WedColor,
          width: 15,
        ),
        BarChartRodData(
          fromY: Mon +
              betweenSpace +
              Tue +
              betweenSpace +
              Wed +
              betweenSpace +
              Thu +
              betweenSpace +
              Fri +
              betweenSpace +
              Sat,
          toY: Mon +
              betweenSpace +
              Tue +
              betweenSpace +
              Wed +
              betweenSpace +
              Thu +
              betweenSpace +
              Fri +
              betweenSpace +
              Sat +
              betweenSpace +
              Sun,
          color: WedColor,
          width: 15,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Week1';
        break;
      case 1:
        text = 'Week2';
        break;
      case 2:
        text = 'Week3';
        break;
      case 3:
        text = 'Week4';
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
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Activity',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 300),
          const SizedBox(height: 14),
          AspectRatio(
            aspectRatio: 2,
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
                      reservedSize: 15,
                    ),
                  ),
                ),
                barTouchData: BarTouchData(enabled: false),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),
                barGroups: [
                  generateGroupData(0, 2, 3, 2, 4, 2, 1, 2),
                  generateGroupData(1, 2, 5, 1.7, 5, 3, 4, 6),
                  generateGroupData(2, 1.3, 3.1, 2.8, 1, 7, 5, 4),
                  generateGroupData(3, 3.1, 4, 3.1, 8, 6, 4, 5),
                ],
                maxY: 11 + (betweenSpace * 3),
                extraLinesData: ExtraLinesData(
                  horizontalLines: [
                    HorizontalLine(
                      y: 3.3,
                      color: MonColor,
                      strokeWidth: 1,
                      dashArray: [15, 4],
                    ),
                    HorizontalLine(
                      y: 8,
                      color: TueColor,
                      strokeWidth: 1,
                      dashArray: [15, 4],
                    ),
                    HorizontalLine(
                      y: 11,
                      color: WedColor,
                      strokeWidth: 1,
                      dashArray: [15, 4],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
