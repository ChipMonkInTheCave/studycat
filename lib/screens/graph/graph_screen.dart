//import 'package:fl_chart/fl_chart.dart';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/models/barchart.dart';
import 'package:studycat/models/graph.dart';
import 'package:studycat/models/piechart.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/home_screen.dart';
import 'package:studycat/widgets/menu_widget.dart';
import 'package:studycat/widgets/question_top_widget.dart';

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
  bool isMonthlySelected = false;

  @override
  Widget build(BuildContext context) {
    var color = context.watch<ThemeColor>();
    //double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: color.background,
      //   centerTitle: true,
      //   titleTextStyle: const TextStyle(
      //     fontWeight: FontWeight.w600,
      //     fontSize: 22,
      //   ),
      //   title: const Text("학습 그래프"),
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back_ios_rounded),
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => const HomeScreen()),
      //       );
      //     },
      //   ),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => const Menu()));
      //         },
      //         icon: const Icon(Icons.menu))
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            QuestionTopWidget(
                screenName: '학습 그래프',
                screenExplain: '123',
                icon: Icons.abc,
                destination: HomeScreen()),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ToggleButtons(
                      borderRadius: BorderRadius.circular(10),
                      isSelected: [isLineSelected, isBarSelected],
                      onPressed: toggleGraphType,
                      selectedColor: Colors.white.withOpacity(0.8),
                      fillColor: const Color.fromARGB(255, 148, 104, 225)
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
                        isMonthlySelected
                      ],
                      onPressed: toggleTimeRange,
                      selectedColor: Colors.white.withOpacity(0.8),
                      fillColor: const Color.fromARGB(255, 148, 104, 225)
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
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text('M',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    // SizedBox(
                    //   height: height * 0.33,
                    // ),
                    if (isLineSelected) const LineChartSample1(),
                    // if (isBarSelected) const BarChartSample2(),

                    // SizedBox(
                    //   height: 5,
                    // ),
                    const Text(
                      "학습 비율",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const PieChartSample2()
                  ],
                ),
              ],
            ),
          ],
        ),
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
      isMonthlySelected = false;
      if (index == 0) {
        isDailySelected = true;
      } else if (index == 1) {
        isWeeklySelected = true;
      } else if (index == 2) {
        isMonthlySelected = true;
      }
    });
  }
}
