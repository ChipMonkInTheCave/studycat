import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/home_screen.dart';

class TestScore extends StatefulWidget {
  const TestScore({Key? key}) : super(key: key);

  @override
  TestScoreState createState() => TestScoreState();
}

class TestScoreState extends State<TestScore> {
  int selectedButtonIndex = -1;
  List<Color> buttonColors = [
    const Color.fromARGB(255, 148, 104, 225),
    const Color.fromARGB(255, 148, 104, 225),
    const Color.fromARGB(255, 148, 104, 225),
    const Color.fromARGB(255, 148, 104, 225)
  ];
  List<String> buttonLabels = ['1주차', '2주차', '3주차', '4주차'];
  List<bool> showDetails1 = [false, false, false, false, false, false, false];
  List<bool> showDetails2 = [false, false, false, false, false, false, false];
  List<bool> showDetails3 = [false, false, false, false, false, false, false];
  List<bool> showDetails4 = [false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: context.watch<ThemeColor>().color,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
        ),
        body: ListView(children: [
          SizedBox(height: height * 0.015),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: width * 0.01),
                buildButton1(0),
                buildButton1(1),
                buildButton1(2),
                buildButton1(3),
                SizedBox(width: width * 0.01),
              ],
            ),
          ),
          SizedBox(height: height * 0.037),
          if (selectedButtonIndex == 0)
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              buildButton2(0),
              SizedBox(height: height * 0.012),
              buildButton2(1),
              SizedBox(height: height * 0.012),
              buildButton2(2),
              SizedBox(height: height * 0.012),
              buildButton2(3),
              SizedBox(height: height * 0.012),
              buildButton2(4),
              SizedBox(height: height * 0.012),
              buildButton2(5),
              SizedBox(height: height * 0.012),
              buildButton2(6)
            ]),
          if (selectedButtonIndex == 1)
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              buildButton3(0),
              SizedBox(height: height * 0.012),
              buildButton3(1),
              SizedBox(height: height * 0.012),
              buildButton3(2),
              SizedBox(height: height * 0.012),
              buildButton3(3),
              SizedBox(height: height * 0.012),
              buildButton3(4),
              SizedBox(height: height * 0.012),
              buildButton3(5),
              SizedBox(height: height * 0.012),
              buildButton3(6)
            ]),
          if (selectedButtonIndex == 2)
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              buildButton4(0),
              SizedBox(height: height * 0.012),
              buildButton4(1),
              SizedBox(height: height * 0.012),
              buildButton4(2),
              SizedBox(height: height * 0.012),
              buildButton4(3),
              SizedBox(height: height * 0.012),
              buildButton4(4),
              SizedBox(height: height * 0.012),
              buildButton4(5),
              SizedBox(height: height * 0.012),
              buildButton4(6)
            ]),
          if (selectedButtonIndex == 3)
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              buildButton5(0),
              SizedBox(height: height * 0.012),
              buildButton5(1),
              SizedBox(height: height * 0.012),
              buildButton5(2),
              SizedBox(height: height * 0.012),
              buildButton5(3),
              SizedBox(height: height * 0.012),
              buildButton5(4),
              SizedBox(height: height * 0.012),
              buildButton5(5),
              SizedBox(height: height * 0.012),
              buildButton5(6)
            ]),
          SizedBox(height: height * 0.08)
        ]));
  }

  Widget buildButton1(int index) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
        height: height * 0.076,
        width: width * 0.32,
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                if (selectedButtonIndex == index) {
                  selectedButtonIndex = -1;
                } else {
                  selectedButtonIndex = index;
                }

                buttonColors = List.generate(buttonColors.length, (i) {
                  return (i == selectedButtonIndex)
                      ? const Color.fromARGB(255, 108, 68, 176)
                      : const Color.fromARGB(255, 148, 104, 225);
                });
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColors[index],
            ),
            child: Text(
              buttonLabels[index],
              style: const TextStyle(fontSize: 30),
            )));
  }

  Widget buildButton2(int index2) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var data = context.watch<CloudData>().myScore.score;
    // ignore: unused_local_variable
    var list1 = data['능률 VOCA : DAY1'][index2].values.first;
    return Column(children: [
      SizedBox(
          height: height * 0.076,
          width: width * 0.96,
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  showDetails1[index2] = !showDetails1[index2];
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text(
                  data['능률 VOCA : DAY1'][index2].keys.elementAt(0).toString(),
                  style: const TextStyle(fontSize: 30)))),
      SizedBox(height: height * 0.002),
      if (showDetails1[index2])
        Container(
            height: height * 0.115,
            width: width * 0.96,
            color: Colors.blue,
            child: Text("Score : ${list1[0].toString()}",
                style: const TextStyle(fontSize: 30)))
    ]);
  }

  Widget buildButton3(int index3) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var data = context.watch<CloudData>().myScore.score;
    var list2 = data['능률 VOCA : DAY1'][index3 + 7].values.first;
    return Column(
      children: [
        SizedBox(
          height: height * 0.076,
          width: width * 0.96,
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  showDetails2[index3] = !showDetails2[index3];
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                  data['능률 VOCA : DAY1'][index3 + 7]
                      .keys
                      .elementAt(0)
                      .toString(),
                  style: const TextStyle(fontSize: 30))),
        ),
        SizedBox(height: height * 0.002),
        if (showDetails2[index3])
          Container(
            height: height * 0.115,
            width: width * 0.96,
            color: Colors.red,
            child: Text("Score : ${list2[0].toString()}",
                style: const TextStyle(fontSize: 30)),
          ),
      ],
    );
  }

  Widget buildButton4(int index4) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var data = context.watch<CloudData>().myScore.score;
    var list3 = data['능률 VOCA : DAY1'][index4 + 14].values.first;
    return Column(
      children: [
        SizedBox(
          height: height * 0.076,
          width: width * 0.96,
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  showDetails3[index4] = !showDetails3[index4];
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: Text(data['능률 VOCA : DAY1'][index4 + 14],
                  style: const TextStyle(fontSize: 30))),
        ),
        SizedBox(height: height * 0.002),
        Container(
          height: height * 0.115,
          width: width * 0.96,
          color: Colors.black,
          child: Text("Score : ${list3[0].toString()}",
              style: const TextStyle(fontSize: 30)),
        ),
      ],
    );
  }

  Widget buildButton5(int index5) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var data = context.watch<CloudData>().myScore.score;
    var list4 = data['능률 VOCA : DAY1'][index5 + 21].values.first;
    return Column(
      children: [
        SizedBox(
          height: height * 0.076,
          width: width * 0.96,
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  showDetails4[index5] = !showDetails4[index5];
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                  data['능률 VOCA : DAY1'][index5 + 21]
                      .keys
                      .elementAt(0)
                      .toString(),
                  style: const TextStyle(fontSize: 30))),
        ),
        SizedBox(height: height * 0.002),
        if (showDetails4[index5])
          Container(
            height: height * 0.115,
            width: width * 0.96,
            color: Colors.green,
            child: Text("Score : ${list4[0].toString()}",
                style: const TextStyle(fontSize: 30)),
          ),
      ],
    );
  }
}
