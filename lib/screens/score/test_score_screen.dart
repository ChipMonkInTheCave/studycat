// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/home_screen.dart';
import 'package:studycat/widgets/background_widget.dart';
import 'package:transition/transition.dart';

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
        body: Stack(children: [
      SingleChildScrollView(
        child: Column(children: [
          if (selectedButtonIndex == 0) ...[
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: height * 0.23),
              SizedBox(width: width * 1),
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
              buildButton2(6),
              SizedBox(height: height * 0.012),
            ])
          ] else if (selectedButtonIndex == 1)
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: height * 0.23),
              SizedBox(width: width * 1),
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
              buildButton3(6),
              SizedBox(height: height * 0.012),
            ])
          else if (selectedButtonIndex == 2)
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: height * 0.23),
              SizedBox(width: width * 1),
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
              buildButton4(6),
              SizedBox(height: height * 0.012),
            ])
          else if (selectedButtonIndex == 3)
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: height * 0.23),
              SizedBox(width: width * 1),
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
              buildButton5(6),
              SizedBox(height: height * 0.012),
            ])
        ]),
      ),
      const BackgroundWidget(num: 0.19),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: height * 0.03),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  Transition(
                      child: const HomeScreen(),
                      transitionEffect: TransitionEffect.FADE),
                );
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white,
                size: 40,
              )),
          Text("나의 공부 기록표",
              textAlign: TextAlign.center,
              style: GoogleFonts.jua(
                color: Colors.white,
                fontSize: width * 0.1,
              )),
          SizedBox(width: width * 0.1)
        ]),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              SizedBox(width: width * 0.02),
              buildButton1(0),
              buildButton1(1),
              buildButton1(2),
              buildButton1(3),
              SizedBox(width: width * 0.02)
            ]))
      ]),
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
              style: GoogleFonts.jua(fontSize: 30, color: Colors.white),
            )));
  }

  Widget buildButton2(int index2) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var data = context.watch<CloudData>().myScore.score;
    var list1 = data['능률 VOCA : DAY1'][index2].values.first;
    var text;
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
                  style: GoogleFonts.jua(fontSize: 30, color: Colors.white)))),
      SizedBox(height: height * 0.002),
      if (showDetails1[index2])
        Container(
            height: height * 0.115,
            width: width * 0.96,
            color: Colors.blue,
            child: Text('Score : ${list1[0].toString()}',
                textAlign: TextAlign.center,
                style: GoogleFonts.jua(
                  color: Colors.white,
                  fontSize: width * 0.1,
                )))
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
                  style: GoogleFonts.jua(fontSize: 30, color: Colors.white))),
        ),
        SizedBox(height: height * 0.002),
        if (showDetails2[index3])
          Container(
              height: height * 0.115,
              width: width * 0.96,
              color: Colors.red,
              child: Text("Score : ${list2[0].toString()}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.jua(
                    color: Colors.white,
                    fontSize: width * 0.1,
                  ))),
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
              child: Text(
                  data['능률 VOCA : DAY1'][index4 + 14]
                      .keys
                      .elementAt(0)
                      .toString(),
                  style: GoogleFonts.jua(fontSize: 30, color: Colors.white))),
        ),
        SizedBox(height: height * 0.002),
        if (showDetails3[index4])
          Container(
              height: height * 0.115,
              width: width * 0.96,
              color: Colors.black,
              child: Text("Score : ${list3[0].toString()}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.jua(
                      color: Colors.white, fontSize: width * 0.1))),
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
                  style: GoogleFonts.jua(fontSize: 30, color: Colors.white))),
        ),
        SizedBox(height: height * 0.002),
        if (showDetails4[index5])
          Container(
              height: height * 0.115,
              width: width * 0.96,
              color: Colors.green,
              child: Text("Score : ${list4[0].toString()}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.jua(
                      color: Colors.white, fontSize: width * 0.1))),
      ],
    );
  }
}
