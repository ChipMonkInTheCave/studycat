import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/question/question_screen.dart';
import 'package:transition/transition.dart';

class SelectQuetionWidget extends StatefulWidget {
  final String id, subject, difficulty;
  final int num;
  const SelectQuetionWidget({
    super.key,
    required this.subject,
    required this.id,
    required this.difficulty,
    required this.num,
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
    var color = context.watch<ThemeColor>();

    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          Transition(
            child: QuestionScreen(
              id: widget.id,
              subject: widget.subject,
              difficulty: widget.difficulty,
              num: widget.num,
              cat: 0,
            ),
            transitionEffect: TransitionEffect.FADE,
          ),
        );
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: color.box,
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 40,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
      child: AutoSizeText(
        widget.subject == 'math' ? '수학' : '영어',
        style: const TextStyle(
          fontSize: 40,
        ),
      ),
    );
  }
}
