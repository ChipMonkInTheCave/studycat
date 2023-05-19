import 'package:flutter/material.dart';
import 'package:studycat/models/question_model.dart';
import 'package:studycat/screens/question/question_screen.dart';
import 'package:transition/transition.dart';

class SelectQuetionWidget extends StatefulWidget {
  final String id, subject, difficulty;
  final int num;
  final QuestionModel data;
  const SelectQuetionWidget({
    super.key,
    required this.subject,
    required this.id,
    required this.difficulty,
    required this.num,
    required this.data,
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
    List<String> abc = ['math', 'eng'];

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
              data: widget.data,
            ),
            transitionEffect: TransitionEffect.FADE,
          ),
        );
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).focusColor,
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 40,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
      child: Text(
        widget.subject == 'math' ? '수학' : '영어',
        style: const TextStyle(
          fontSize: 40,
        ),
      ),
    );
  }
}
