import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/question/input_question_screen.dart';
import 'package:studycat/screens/question/select_question_screen.dart';
import 'package:studycat/widgets/question_top_widget.dart';
import 'package:transition/transition.dart';

class ShowQuestionScreen extends StatefulWidget {
  final int subjectnum;
  const ShowQuestionScreen({super.key, required this.subjectnum});

  @override
  State<ShowQuestionScreen> createState() => _ShowQuestionScreenState();
}

class _ShowQuestionScreenState extends State<ShowQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var question = context.watch<CloudData>().myQuestion.question;
    var color = context.watch<ThemeColor>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const QuestionTopWidget(
              screenName: "문제 확인",
              screenExplain: "여기선 문제를 확인하고 수정할 수 있어요",
              icon: Icons.arrow_back,
              destination: SelectQuestion(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  width * 0.02, height * 0.18, width * 0.02, height * 0.1),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                BorderSide(
                                  color: color.background,
                                  width: 4.0,
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(color.text),
                              minimumSize: MaterialStateProperty.all(
                                  Size(width * 0.45, height * 0.08))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              Transition(
                                child: const InputQuestion(),
                                transitionEffect: TransitionEffect.FADE,
                              ),
                            );
                          },
                          child: AutoSizeText(
                            '문제 추가',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: color.background,
                              fontSize: width * 0.06,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        TextButton(
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                BorderSide(
                                  color: color.background,
                                  width: 4.0,
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(color.text),
                              minimumSize: MaterialStateProperty.all(
                                  Size(width * 0.45, height * 0.08))),
                          onPressed: () {},
                          child: AutoSizeText(
                            '문제 삭제',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: color.background,
                              fontSize: width * 0.06,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    for (var i = 0;
                        i <
                            question[question.keys.elementAt(widget.subjectnum)]
                                    ['01']['questions']
                                .length;
                        i++)
                      FadeIn(
                        delay: Duration(milliseconds: 200 * i),
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: color.background,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            leading: AutoSizeText(
                              "${i + 1}",
                              style: TextStyle(
                                color: color.background,
                                fontSize: 30,
                              ),
                            ),
                            title: AutoSizeText(
                              question[question.keys
                                          .elementAt(widget.subjectnum)]['01']
                                      ['questions'][i]
                                  .toString(),
                              style: TextStyle(
                                color: color.background,
                                fontSize: 30,
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () =>
                                  questionMenu(context, i, widget.subjectnum),
                              icon: Icon(
                                Icons.menu,
                                color: color.background,
                                size: width * 0.08,
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void questionMenu(
  BuildContext context,
  int num,
  int subjectnum,
) async {
  List<String> list1 = ['문제', '선택지', '정답 번호'];
  List<String> list2 = ['questions', 'options', 'answers'];
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
              style: TextStyle(
                color: context.watch<ThemeColor>().background,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                for (var i = 0; i < 3; i++)
                  Column(
                    children: [
                      Text(
                        list1[i],
                        style: TextStyle(
                          color: context.watch<ThemeColor>().background,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: context.watch<ThemeColor>().background,
                          width: 3.0,
                        )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            i == 2
                                ? (context
                                                    .watch<CloudData>()
                                                    .myQuestion
                                                    .question[
                                                context
                                                    .watch<CloudData>()
                                                    .myQuestion
                                                    .question
                                                    .keys
                                                    .elementAt(subjectnum)]
                                            ['01'][list2[i]][num] +
                                        1)
                                    .toString()
                                : context
                                    .watch<CloudData>()
                                    .myQuestion
                                    .question[context
                                            .watch<CloudData>()
                                            .myQuestion
                                            .question
                                            .keys
                                            .elementAt(subjectnum)]['01']
                                        [list2[i]][num]
                                    .toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: context.watch<ThemeColor>().background,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
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
                        child: const InputQuestion(),
                        transitionEffect: TransitionEffect.FADE,
                      ),
                    );
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
                        '문제수정',
                        style: TextStyle(
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
                  onPressed: () {},
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
                        '문제삭제',
                        style: TextStyle(
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
