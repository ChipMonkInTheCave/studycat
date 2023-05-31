import 'package:flutter/material.dart';
import 'package:studycat/database/db.dart';
import 'package:studycat/models/question_model.dart';
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<String> abc = ['math', 'eng'];
    SystemChrome.setEnabledSystemUIMode;

    return FutureBuilder(
        future: setQuestionData('001', abc, '01'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print(snapshot.data![abc.indexOf('eng')][abc[1]]!.question
                .toString());
            QuestionModel math = snapshot.data![abc.indexOf('math')]['math']!;
            QuestionModel eng = snapshot.data![abc.indexOf('eng')]['eng']!;
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
                              children: [
                                SelectQuetionWidget(
                                  id: '001',
                                  subject: 'math',
                                  difficulty: '01',
                                  num: 0,
                                  data: math,
                                ),
                                SelectQuetionWidget(
                                  id: '001',
                                  subject: 'eng',
                                  difficulty: '01',
                                  num: 0,
                                  data: eng,
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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Stack(
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
                            children: [
                              Container(
                                width: width * 0.375,
                                height: height * 0.184,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 50,
                                  horizontal: 40,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).focusColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Container(
                                width: width * 0.375,
                                height: height * 0.184,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 50,
                                  horizontal: 40,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).focusColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
            );
          }
          return const Text('hi');
        });
  }
}
