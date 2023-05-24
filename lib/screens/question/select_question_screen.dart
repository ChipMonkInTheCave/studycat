import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:studycat/widgets/question_top_widget.dart';
import 'package:studycat/widgets/select_question_widget.dart';

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SystemChrome.setEnabledSystemUIMode;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const QuestionTopWidget(
              screenName: '문제 풀기',
              screenExplain: '과목을 선택해주세요',
              icon: Icons.home,
              destination: HomeScreen(),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                width * 0.07,
                height * 0.22,
                width * 0.07,
                height * 0.2,
              ),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        SelectQuetionWidget(
                          id: '001',
                          subject: 'math',
                          difficulty: '01',
                          num: 0,
                        ),
                        SelectQuetionWidget(
                          id: '001',
                          subject: 'eng',
                          difficulty: '01',
                          num: 0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
