import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/home_screen.dart';
import 'package:studycat/screens/question/select_question_screen.dart';
import 'package:studycat/widgets/question_top_widget.dart';

class EndQuestionScreen extends StatefulWidget {
  final int cat, queLen;
  final String subject;
  const EndQuestionScreen(
      {super.key,
      required this.cat,
      required this.queLen,
      required this.subject});

  @override
  State<EndQuestionScreen> createState() => _EndQuestionScreenState();
}

class _EndQuestionScreenState extends State<EndQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    var color = context.watch<ThemeColor>();
    var now = DateTime.now();
    String nowDate = DateFormat('yyyy-MM-dd').format(now);
    String nowWeek = DateFormat('E').format(now);
    //yy 23 yyyy 2023 M 8 MM 08 MMM Aug MMMM August dd 31 EEEE Tuesday E Tue mm 15 ss 45
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String per = '${((widget.cat / widget.queLen) * 100).toInt()}%';

    return Scaffold(
      body: Stack(
        children: [
          const QuestionTopWidget(
              screenName: "학습 완료!",
              screenExplain: '정답률을 확인하세요!',
              icon: Icons.home,
              destination: SelectQuestion()),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "정답률",
                  style: TextStyle(
                    fontSize: 40,
                    color: color.background,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: color.background,
                      width: 10,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < per.length; i++)
                        ZoomIn(
                          delay: Duration(milliseconds: 500 * i),
                          child: AutoSizeText(
                            per.toString()[i],
                            style: TextStyle(
                              fontSize: 100,
                              color: color.background,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.9),
            child: Center(
              child: Container(
                height: height * 0.07,
                width: width * 0.9,
                decoration: BoxDecoration(
                  color: color.background,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  onPressed: () {
                    //col 001 doc score {data :{ nowDate : [{eng : 90}, {kor : 80}, {math: 100}]}}
                    for (var i = 15; i < 30; i++) {
                      int day11 = 0 + i;
                      var then =
                          new DateTime(2023, 05, day11, 15, 23, 58, 0, 0);
                      var then2 = DateFormat('yyyy-MM-dd').format(then);
                      var ww = DateFormat('E').format(then);
                      List list1 =
                          context.read<CloudData>().myScore.score['수학'];
                      list1.add({then2: Random().nextInt(99) + 1, 'week': ww});

                      FirebaseFirestore.instance
                          .collection('001')
                          .doc('score')
                          .set({
                        "민수": list1,
                      }, SetOptions(merge: true)).onError((error, _) =>
                              print('end question screen 확인 버튼error났어요'));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    }
                    ;
                  },
                  child: Text(
                    '확인',
                    style: TextStyle(
                      color: color.text,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
