//import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:studycat/models/dailybarchart.dart';
import 'package:studycat/models/dailylinechart.dart';
import 'package:studycat/models/weeklybarchart.dart';
import 'package:studycat/models/weeklylinechart.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/widgets/background_widget.dart';
import 'package:transition/transition.dart';

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
  String select = "능률 VOCA : DAY1";
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(num: 0.3),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height * 0.07),
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
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14),
                          child: Text('꺾은선',
                              style: GoogleFonts.jua(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text('막대',
                              style: GoogleFonts.jua(
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
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text('D',
                              style: GoogleFonts.jua(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'W',
                            style: GoogleFonts.jua(
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
                        children: [
                          Text(
                            '성적 그래프',
                            style: GoogleFonts.jua(
                              color: Color.fromARGB(255, 46, 5, 77),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '일주일 기록',
                            style: GoogleFonts.jua(
                              color: Color.fromARGB(255, 104, 70, 200),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isLineSelected && isDailySelected)
                      DailyLineChart(
                        name: select,
                      ),
                    if (isBarSelected && isDailySelected)
                      DailyBarChart(
                        name: select,
                      ),
                    if (isBarSelected && isWeeklySelected)
                      WeeklyBarChart(
                        name: select,
                      ),
                    if (isLineSelected && isWeeklySelected)
                      WeeklyLineChart(
                        name: select,
                      ),
                  ],
                ),
                Container(
                  width: width * 0.8,
                  height: height * 0.1,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (var i = 0;
                          i <
                              context
                                  .read<CloudData>()
                                  .myScore
                                  .score
                                  .keys
                                  .length;
                          i++)
                        TextButton(
                          onPressed: () {
                            setState(() {
                              select = context
                                  .read<CloudData>()
                                  .myQuestion
                                  .question[i]
                                  .keys
                                  .elementAt(0)
                                  .toString();
                            });
                          },
                          child: Text(
                              context
                                  .read<CloudData>()
                                  .myQuestion
                                  .question[i]
                                  .keys
                                  .elementAt(0)
                                  .toString(),
                              style: GoogleFonts.jua(
                                color: Colors.black,
                              )),
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                              Size(
                                width * 0.22,
                                height * 0.1,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
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
