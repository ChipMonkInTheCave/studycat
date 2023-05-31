import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:studycat/screens/home_screen.dart';
import 'package:studycat/screens/question/input_question_screen.dart';
import 'package:studycat/widgets/question_top_widget.dart';
import 'package:studycat/widgets/select_question_widget.dart';
import 'package:transition/transition.dart';

class SelectQuestion extends StatefulWidget {
  const SelectQuestion({
    super.key,
  });

  @override
  State<SelectQuestion> createState() => _SelectQuestionState();
}

class _SelectQuestionState extends State<SelectQuestion> {
  @override
  Widget build(BuildContext context) {
    var color = context.watch<ThemeColor>();
    var question = context.watch<CloudData>().myQuestion.question;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SystemChrome.setEnabledSystemUIMode;
    // print(context.watch<CloudData>().myQuestion.question.keys.toString());
    // print(question[question.keys.elementAt(0)]['kor']);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const QuestionTopWidget(
              screenName: '문제 풀기',
              screenExplain: '어떤 문제를 풀까요?',
              icon: Icons.home,
              destination: HomeScreen(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                width * 0.05,
                height * 0.15,
                width * 0.05,
                height * 0.12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.05,
                  ),
                  for (var i = 0; i < question.keys.length; i++)
                    SelectQuetionWidget(
                      num: 0,
                      nn: i,
                    ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          Transition(
                              child: const InputQuestion(),
                              transitionEffect: TransitionEffect.FADE),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: color.background, width: 7),
                        borderRadius: BorderRadius.circular(17),
                      ),
                      tileColor: color.text,
                      title: Icon(
                        Icons.add,
                        size: 65,
                        color: color.background,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
