import 'package:flutter/material.dart';
import 'package:studycat/screens/question/question_screen.dart';

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
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionScreen(
              id: widget.id,
              subject: widget.subject,
              difficulty: widget.difficulty,
              num: widget.num,
              cat: 0,
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
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
