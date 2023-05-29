import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/question/question_screen.dart';
import 'package:transition/transition.dart';

class SelectQuetionWidget extends StatefulWidget {
  final int num, nn;
  const SelectQuetionWidget({
    super.key,
    required this.num,
    required this.nn,
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
                    subject: context
                        .read<CloudData>()
                        .myQuestion
                        .question
                        .keys
                        .elementAt(widget.nn),
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
            leading: Icon(
              Icons.book,
              size: 45,
              color: color.background,
            ),
            title: AutoSizeText(
              question[question.keys.elementAt(widget.nn)]['kor'],
              style: TextStyle(
                color: color.background,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: AutoSizeText(
              '총 ${question[question.keys.elementAt(widget.nn)]['01']['questions'].length}문제',
              style: TextStyle(
                color: color.background,
              ),
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: color.background, width: 7),
              borderRadius: BorderRadius.circular(17),
            ),
            tileColor: color.text,
            trailing: Icon(
              Icons.arrow_forward,
              size: 50,
              color: color.background,
              fill: 0.5,
            ),
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
      ],
    );
  }
}
