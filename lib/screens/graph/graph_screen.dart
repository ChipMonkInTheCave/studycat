//import 'package:fl_chart/fl_chart.dart';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/models/dailybarchart.dart';
import 'package:studycat/models/dailylinechart.dart';
import 'package:studycat/models/piechart.dart';
import 'package:studycat/models/weeklybarchart.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/widgets/background_widget.dart';

class Graph extends StatefulWidget {
  const Graph({Key? key}) : super(key: key);

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  bool isLineSelected = true;
  bool isBarSelected = false;
  bool isDailySelected = true;
  bool isWeeklySelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(num: 0.3),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ToggleButtons(
                      borderRadius: BorderRadius.circular(10),
                      isSelected: [isLineSelected, isBarSelected],
                      onPressed: toggleGraphType,
                      selectedColor: Colors.white.withOpacity(0.8),
                      fillColor: const Color.fromARGB(255, 107, 45, 213)
                          .withOpacity(1),
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14),
                          child: Text('꺾은선',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text('막대',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                    ToggleButtons(
                      borderRadius: BorderRadius.circular(10),
                      isSelected: [
                        isDailySelected,
                        isWeeklySelected,
                      ],
                      onPressed: toggleTimeRange,
                      selectedColor: Colors.white.withOpacity(0.8),
                      fillColor:
                          Color.fromARGB(255, 107, 45, 213).withOpacity(1),
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text('D',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'W',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    if (isLineSelected) const LineChartSample1(),
                    if (isBarSelected && isDailySelected) DailyChart(),
                    if (isBarSelected && isWeeklySelected) WeeklyChart(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void toggleGraphType(int index) {
    setState(() {
      if (index == 0) {
        isLineSelected = true;
        isBarSelected = false;
      } else if (index == 1) {
        isLineSelected = false;
        isBarSelected = true;
      }
    });
  }

  void toggleTimeRange(int index) {
    setState(() {
      isDailySelected = false;
      isWeeklySelected = false;
      if (index == 0) {
        isDailySelected = true;
      } else if (index == 1) {
        isWeeklySelected = true;
      }
    });
  }
}
