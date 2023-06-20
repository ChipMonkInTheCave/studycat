import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/question/question_screen.dart';
import 'package:studycat/screens/question/show_question_screen.dart';
import 'package:transition/transition.dart';
import 'package:studycat/widgets/alert_widget.dart';

class SelectQuetionWidget extends StatefulWidget {
  final int num, nn;
  final String sub;
  const SelectQuetionWidget({
    super.key,
    required this.num,
    required this.nn,
    required this.sub,
  });

  @override
  State<SelectQuetionWidget> createState() => _SelectQuetionWidgetState();
}

class _SelectQuetionWidgetState extends State<SelectQuetionWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var color = context.watch<ThemeColor>();
    var question = context.watch<CloudData>().myQuestion.question;

    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
              onTap: () {
                question[widget.nn][question[widget.nn].keys.elementAt(0)]
                            .keys
                            .length >=
                        4
                    ? Navigator.push(
                        context,
                        Transition(
                          child: QuestionScreen(
                            id: context.read<CloudData>().id,
                            subject: widget.sub,
                            section: widget.nn,
                            difficulty: '01',
                            num: 0,
                            cat: 0,
                          ),
                          transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                        ),
                      )
                    : nullAlert(context, '단어가 4개 이상 되어야합니다!\n 단어를 추가해주세요');
              },
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              leading: Icon(
                Icons.book,
                size: 45,
                color: color.box,
              ),
              title: AutoSizeText(
                question[widget.nn].keys.elementAt(0).toString(),
                style: GoogleFonts.jua(
                  color: color.box,
                  fontSize: 30,
                ),
              ),
              subtitle: AutoSizeText(
                '단어 ${question[widget.nn][question[widget.nn].keys.elementAt(0)].length}개, 최고 점수 ${context.read<CloudData>().myUserData.userdata['highscore'][widget.sub]}점',
                style: GoogleFonts.jua(
                  color: color.box,
                ),
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: color.box, width: 5),
                borderRadius: BorderRadius.circular(17),
              ),
              tileColor: color.text,
              trailing: IconButton(
                onPressed: () {
                  questionMenu(
                    context,
                    widget.nn,
                  );
                },
                icon: Icon(
                  Icons.menu,
                  size: 35,
                  color: color.box,
                ),
              )),
        ),
        SizedBox(
          height: height * 0.02,
        ),
      ],
    );
  }
}

void questionMenu(
  BuildContext context,
  num subjectnum,
) async {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: ((context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.watch<ThemeColor>().background,
            width: 10.0,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: context.watch<ThemeColor>().text,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '무엇을 할까요?',
              style: GoogleFonts.jua(
                color: context.watch<ThemeColor>().background,
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.17,
            child: Column(
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      context.watch<ThemeColor>().background.withOpacity(0.8),
                    ),
                  ),
                  onPressed: () {
                    var menu = context.read<CloudData>().myQuestion.question;
                    menu.removeAt(subjectnum.toInt());
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(context.read<CloudData>().id)
                        .update({'question': menu});
                    context.read<CloudData>().fetchData();
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.keyboard_alt_outlined,
                        color: context.watch<ThemeColor>().text,
                        size: MediaQuery.of(context).size.width * 0.08,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.07,
                      ),
                      AutoSizeText(
                        '단어장삭제',
                        style: GoogleFonts.jua(
                          color: context.watch<ThemeColor>().text,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      context.watch<ThemeColor>().background.withOpacity(0.8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      Transition(
                        child: ShowQuestionScreen(
                          subjectnum: subjectnum.toInt(),
                        ),
                        transitionEffect: TransitionEffect.FADE,
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.dangerous_outlined,
                        color: context.watch<ThemeColor>().text,
                        size: MediaQuery.of(context).size.width * 0.08,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.07,
                      ),
                      AutoSizeText(
                        '단어목록',
                        style: GoogleFonts.jua(
                          color: context.watch<ThemeColor>().text,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }),
  );
}
