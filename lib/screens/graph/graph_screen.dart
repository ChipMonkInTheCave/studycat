//import 'package:fl_chart/fl_chart.dart';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/models/dailybarchart.dart';
import 'package:studycat/models/dailylinechart.dart';
import 'package:studycat/models/piechart.dart';
import 'package:studycat/models/weeklybarchart.dart';
import 'package:studycat/models/weeklylinechart.dart';
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
                      fillColor: const Color.fromARGB(255, 107, 45, 213)
                          .withOpacity(1),
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          Text(
                            '성적 그래프',
                            style: TextStyle(
                              color: Color.fromARGB(255, 46, 5, 77),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '일주일 기록',
                            style: TextStyle(
                              color: Color.fromARGB(255, 104, 70, 200),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (isLineSelected && isDailySelected)
                      const DailyLineChart(),
                    if (isBarSelected && isDailySelected) DailyBarChart(),
                    if (isBarSelected && isWeeklySelected) WeeklyBarChart(),
                    if (isLineSelected && isWeeklySelected)
                      const WeeklyLineChart(),
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
