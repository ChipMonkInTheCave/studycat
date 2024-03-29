import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/home_screen.dart';
import 'package:studycat/widgets/background_widget.dart';

class EndQuestionScreen extends StatefulWidget {
  final num cat, queLen;
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
    SystemChrome.setEnabledSystemUIMode;
    num exp = context.read<CloudData>().myUserData.userdata['exp'];
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
          const BackgroundWidget(num: 0.22),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '수고했어요!!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.jua(
                      color: color.text,
                      fontSize: width * 0.1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.022,
              ),
              Center(
                child: Text(
                  '정답률을 확인해보세요!!',
                  style: GoogleFonts.jua(
                    color: color.text,
                    fontSize: width * 0.05,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "정답률",
                  style: GoogleFonts.jua(
                    fontSize: 40,
                    color: color.box,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: color.box,
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
                            style: GoogleFonts.jua(
                              fontSize: 100,
                              color: color.box,
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
                  color: color.box,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  onPressed: () {
                    var keylist = context.read<CloudData>().myScore.score.keys;
                    var list1 =
                        context.read<CloudData>().myScore.score[widget.subject];
                    var map1 = context.read<CloudData>().myScore.score;
                    list1 ??= [];
                    var highscore = context
                        .read<CloudData>()
                        .myUserData
                        .userdata['highscore'];
                    if (highscore[widget.subject] != null) {
                      if (highscore[widget.subject] <
                          ((widget.cat / widget.queLen) * 100).toInt()) {
                        highscore[widget.subject] =
                            ((widget.cat / widget.queLen) * 100).toInt();
                      }
                    } else {
                      highscore[widget.subject] =
                          ((widget.cat / widget.queLen) * 100).toInt();
                    }
                    if (keylist.contains(widget.subject)) {
                      if (list1.last.keys.elementAt(0) == nowDate) {
                        list1.last = {
                          nowDate: [
                            ((widget.cat / widget.queLen) * 100).toInt(),
                            nowWeek
                          ]
                        };
                      } else {
                        list1.add({
                          nowDate: [
                            ((widget.cat / widget.queLen) * 100).toInt(),
                            nowWeek
                          ]
                        });
                      }
                    } else {
                      list1.add({
                        nowDate: [
                          ((widget.cat / widget.queLen) * 100).toInt(),
                          nowWeek
                        ]
                      });
                    }
                    map1[widget.subject] = list1;
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(context.read<CloudData>().id)
                        .update({
                      'score': map1,
                    });
                    if (context.read<CloudData>().myUserData.userdata['exp'] +
                            (widget.cat / widget.queLen) * 100 >=
                        100) {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(context.read<CloudData>().id)
                          .update({
                        'userdata': {
                          'exp': exp +
                              ((widget.cat / widget.queLen) * 100).toInt() -
                              100,
                          'level': context
                                  .read<CloudData>()
                                  .myUserData
                                  .userdata['level'] +
                              1,
                          'recentScore':
                              ((widget.cat / widget.queLen) * 100).toInt(),
                          'recentWordnote': widget.subject,
                          'highscore': highscore,
                        }
                      });
                    } else {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(context.read<CloudData>().id)
                          .update({
                        'userdata': {
                          'exp': (context
                                  .read<CloudData>()
                                  .myUserData
                                  .userdata['exp'] +
                              (widget.cat / widget.queLen) * 100),
                          'level': context
                              .read<CloudData>()
                              .myUserData
                              .userdata['level'],
                          'recentScore':
                              ((widget.cat / widget.queLen) * 100).toInt(),
                          'recentWordnote': widget.subject,
                          'highscore': highscore,
                        }
                      });
                    }
                    context.read<CloudData>().fetchData();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (_) => false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                  child: Text(
                    '확인',
                    style: GoogleFonts.jua(
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
