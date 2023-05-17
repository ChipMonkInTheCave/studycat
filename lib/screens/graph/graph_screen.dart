import 'package:flutter/material.dart';
import 'package:studycat/screens/home_screen.dart';
import 'package:studycat/widgets/menu_widget.dart';
//import 'package:flutter_bezier_chart/flutter_bezier_chart.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 103, 58, 183),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
        title: const Text("학습 그래프"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Menu()));
              },
              icon: const Icon(Icons.menu))
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ToggleButtons(
                borderRadius: BorderRadius.circular(10),
                isSelected: [isLineSelected, isBarSelected],
                onPressed: toggleGraphType,
                selectedColor: Colors.white.withOpacity(0.8),
                fillColor:
                    const Color.fromARGB(255, 148, 104, 225).withOpacity(1),
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Text('꺾은선',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('막대',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
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
                fillColor:
                    const Color.fromARGB(255, 148, 104, 225).withOpacity(1),
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('D',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'W',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('M',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ],
              ),
            ],
          ),
          const Column(
            children: [
              Text(
                "성적그래프",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 270,
              ),
              Text(
                "학습비율",
                style: TextStyle(fontSize: 22),
              ),
            ],
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
