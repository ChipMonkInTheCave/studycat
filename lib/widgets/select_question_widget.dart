import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/question/question_screen.dart';
import 'package:studycat/screens/question/show_question_screen.dart';
import 'package:transition/transition.dart';

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
                Navigator.push(
                  context,
                  Transition(
                    child: QuestionScreen(
                      id: context.read<UserData>().id,
                      subject: widget.sub,
                      section: widget.nn,
                      difficulty: '01',
                      num: 0,
                      cat: 0,
                    ),
                    transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                  ),
                );
              },
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              leading: const Icon(
                Icons.book,
                size: 45,
                color: Color.fromARGB(255, 163, 129, 255),
              ),
              title: AutoSizeText(
                question['menu'][widget.nn].keys.elementAt(0).toString(),
                style: TextStyle(
                  color: color.box,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: AutoSizeText(
                '단어 ${question['menu'][widget.nn][question['menu'][widget.nn].keys.elementAt(0)].length}개',
                style: TextStyle(
                  color: color.box,
                ),
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: color.box, width: 7),
                borderRadius: BorderRadius.circular(17),
              ),
              tileColor: color.text,
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    Transition(
                      child: ShowQuestionScreen(subjectnum: widget.nn),
                      transitionEffect: TransitionEffect.FADE,
                    ),
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
