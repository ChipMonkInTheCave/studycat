import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/home_screen.dart';

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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.black87,
                      width: 10,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "${widget.cat}/${widget.queLen}",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var i = 0; i < per.length; i++)
                            ZoomIn(
                              delay: Duration(milliseconds: 500 * i),
                              child: AutoSizeText(
                                per.toString()[i],
                                style: const TextStyle(
                                  fontSize: 100,
                                ),
                              ),
                            )
                        ],
                      ),
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
                    FirebaseFirestore.instance
                        .collection('001')
                        .doc('score')
                        .set({
                      'data': {
                        nowDate: {
                          widget.subject:
                              ((widget.cat / widget.queLen) * 100).toInt(),
                          'date': nowDate,
                          'week': nowWeek,
                        }
                      }
                    }, SetOptions(merge: true)).onError((error, _) =>
                            print('end question screen 확인 버튼error났어요'));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
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
