//import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/models/barchart.dart';
import 'package:studycat/models/graph.dart';
import 'package:studycat/models/piechart.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/home_screen.dart';
import 'package:studycat/widgets/background_widget.dart';
import 'package:studycat/widgets/menu_widget.dart';

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
  // bool isMonthlySelected = false;

  @override
  Widget build(BuildContext context) {
    var color = context.watch<ThemeColor>();
    //double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(num: 0.13),
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
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  "학습 그래프",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
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
                        // isMonthlySelected
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
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 8),
                        //   child: Text('M',
                        //       style: TextStyle(
                        //         fontSize: 20,
                        //         fontWeight: FontWeight.w500,
                        //       )),
                        // ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      textAlign: TextAlign.center,
                      '성적 그래프',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (isLineSelected) const LineChartSample1(),
                    if (isBarSelected) const BarChartSample2(),
                    const Text(
                      textAlign: TextAlign.center,
                      "학습 비율",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const PieChartSample2()
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
      // isMonthlySelected = false;
      if (index == 0) {
        isDailySelected = true;
      } else if (index == 1) {
        isWeeklySelected = true;
      }
      // else if (index == 2) {
      //   isMonthlySelected = true;
      // }
    });
  }
}
