import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/question/input_question_screen.dart';
import 'package:studycat/screens/question/select_question_screen.dart';
import 'package:studycat/widgets/background_widget.dart';
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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var question = context.watch<CloudData>().myQuestion.question;
    var color = context.watch<ThemeColor>();
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
                width * 0.02, height * 0.23, width * 0.02, height * 0.1),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0;
                      i <
                          question[widget.subjectnum][
                                  question[widget.subjectnum].keys.elementAt(0)]
                              .length;
                      i++)
                    FadeIn(
                      delay: Duration(milliseconds: 100 * i),
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
                            question[widget.subjectnum][
                                    question[widget.subjectnum]
                                        .keys
                                        .elementAt(0)]
                                .keys
                                .elementAt(i)
                                .toString(),
                            style: TextStyle(
                              color: color.background,
                              fontSize: 30,
                            ),
                          ),
                          subtitle: AutoSizeText(
                            question[widget.subjectnum][
                                    question[widget.subjectnum]
                                        .keys
                                        .elementAt(0)]
                                .values
                                .elementAt(i)
                                .toString(),
                            style: TextStyle(
                              color: color.background,
                              fontSize: 15,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () => questionMenu(
                                context,
                                i,
                                widget.subjectnum,
                                question[widget.subjectnum][
                                        question[widget.subjectnum]
                                            .keys
                                            .elementAt(0)]
                                    .keys
                                    .elementAt(i)
                                    .toString()),
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
          ),
          const BackgroundWidget(num: 0.18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        Transition(
                          child: const SelectQuestion(),
                          transitionEffect: TransitionEffect.FADE,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.home,
                      color: color.text,
                      size: 40,
                    ),
                  ),
                  Text(
                    '단어 목록',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: color.text,
                      fontSize: width * 0.1,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.12,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.017,
              ),
              Center(
                child: Text(
                  '여기선 단어들을 볼 수 있어요',
                  style: TextStyle(
                    color: color.text,
                    fontSize: width * 0.05,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void questionMenu(
  BuildContext context,
  num num,
  num subjectnum,
  String word,
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
                        '단어수정',
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
                  onPressed: () {
                    removeWordAlert(context, subjectnum, num, word);
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
                        '단어삭제',
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

void removeWordAlert(
    BuildContext context, num subjectnum, num num, String word) async {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: ((context) {
      return AlertDialog(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: context.watch<ThemeColor>().box,
              width: 10.0,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: context.watch<ThemeColor>().text,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '단어를 삭제합니다',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: context.watch<ThemeColor>().box,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Column(
              children: [
                const Text('삭제할 단어',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20,
                    )),
                Text(
                    context
                        .watch<CloudData>()
                        .myQuestion
                        .question[subjectnum.toInt()][context
                            .watch<CloudData>()
                            .myQuestion
                            .question[subjectnum.toInt()]
                            .keys
                            .elementAt(0)]
                        .keys
                        .elementAt(num),
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20,
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          context.watch<ThemeColor>().box.withOpacity(0.8),
                        ),
                      ),
                      onPressed: () {
                        var menu =
                            context.read<CloudData>().myQuestion.question;
                        var keys = menu[subjectnum.toInt()].keys.elementAt(0);
                        var list1 = menu[subjectnum.toInt()][keys];
                        list1.remove(word);
                        menu[subjectnum.toInt()][keys] = list1;
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc('jPwmXxGJpMZqGbPZqtNddImSTju1')
                            .update({'question': menu});
                        context.read<CloudData>().fetchData();
                      },
                      child: Text(
                        '    확인    ',
                        style: TextStyle(
                          color: context.watch<ThemeColor>().text,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          context.watch<ThemeColor>().box.withOpacity(0.8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        '    취소    ',
                        style: TextStyle(
                          color: context.watch<ThemeColor>().text,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ));
    }),
  );
}
