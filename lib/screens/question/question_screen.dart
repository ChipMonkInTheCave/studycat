import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:studycat/models/question_model.dart';
import 'package:studycat/screens/question/end_question_screen.dart';
import 'package:studycat/screens/question/select_question_screen.dart';
import 'package:studycat/widgets/question_bottom_widget.dart';
import 'package:studycat/widgets/question_realtop_widget.dart';
import 'package:transition/transition.dart';

class QuestionScreen extends StatefulWidget {
  final String id, subject, difficulty;
  final int num, cat;
  final QuestionModel data;

  const QuestionScreen({
    super.key,
    required this.id,
    required this.subject,
    required this.difficulty,
    required this.num,
    required this.cat,
    required this.data,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int choice = 0;
  bool isOne = true;
  bool isTwo = false, isThree = false, isFour = false;
  late List<bool> isSelected = [isOne, isTwo, isThree, isFour];
  bool answerChk = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void toggleSelect(value) {
      if (value == 0) {
        isOne = true;
        isTwo = false;
        isThree = false;
        isFour = false;
        choice = 0;
      } else if (value == 1) {
        isOne = false;
        isTwo = true;
        isThree = false;
        isFour = false;
        choice = 1;
      } else if (value == 2) {
        isOne = false;
        isTwo = false;
        isThree = true;
        isFour = false;
        choice = 2;
      } else if (value == 3) {
        isOne = false;
        isTwo = false;
        isThree = false;
        isFour = true;
        choice = 3;
      }
      setState(() {
        isSelected = [isOne, isTwo, isThree, isFour];
      });
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<dynamic> answers = widget.data.answer[widget.num].split(",");

    Widget next() {
      answerChk = true;
      setState(() {
        answerChk = true;
      });
      return const QuestionBottomWidget();
    }

    return Scaffold(
      body: Stack(
        children: [
          QuestionRealTopWidget(
            screenName: widget.subject,
            screenExplain: widget.data.question[widget.num],
            icon: Icons.arrow_back,
            destination: const SelectQuestion(),
            questionLength: widget.data.question.length,
            currentNum: widget.num,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              width * 0.05,
              height * 0.10,
              width * 0.05,
              height * 0.12,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 0,
                  )
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: BounceInDown(
                        from: 30,
                        child: Text(
                          '다음 문제의 답을 선택하세요!!',
                          style: TextStyle(
                              fontSize: 25,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.1,
                    ),
                    Center(
                      child: FadeIn(
                        duration: const Duration(milliseconds: 700),
                        child: Text(
                          widget.data.question[widget.num],
                          style: TextStyle(
                              fontSize: 40,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeInDown(
                          duration: const Duration(milliseconds: 250),
                          child: ElevatedButton(
                            //-----------1번 버튼 시작
                            onPressed: () {
                              toggleSelect(0);
                            },
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                Size(width * 0.4, height * 0.08),
                              ),
                              maximumSize: MaterialStateProperty.all(
                                Size(width * 0.4, height * 0.08),
                              ),
                              side: MaterialStateProperty.all(
                                BorderSide(
                                  color: answerChk &
                                          (widget.data
                                                  .rightAnswer[widget.num] ==
                                              0)
                                      ? Colors.green.shade400
                                      : Colors.white,
                                  width: answerChk &
                                          (widget.data
                                                  .rightAnswer[widget.num] ==
                                              0)
                                      ? 5
                                      : 0,
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(isOne
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).focusColor),
                              textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            child: AutoSizeText(answers[0], maxLines: 1),
                          ),
                        ), //-----------1번 버튼 끝
                        SizedBox(
                          width: width * 0.05,
                        ),
                        FadeInRight(
                          duration: const Duration(milliseconds: 250),
                          child: ElevatedButton(
                            //-----------2번 버튼 시작
                            onPressed: () {
                              toggleSelect(1);
                            },
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                Size(width * 0.4, height * 0.08),
                              ),
                              maximumSize: MaterialStateProperty.all(
                                Size(width * 0.4, height * 0.08),
                              ),
                              backgroundColor: MaterialStateProperty.all(isTwo
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).focusColor),
                              textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              side: MaterialStateProperty.all(
                                BorderSide(
                                  color: answerChk &
                                          (widget.data
                                                  .rightAnswer[widget.num] ==
                                              1)
                                      ? Colors.green.shade400
                                      : Colors.white,
                                  width: answerChk &
                                          (widget.data
                                                  .rightAnswer[widget.num] ==
                                              1)
                                      ? 5
                                      : 0,
                                ),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            child: AutoSizeText(answers[1], maxLines: 1),
                          ),
                        ), //-----------2번 버튼 끝
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeInLeft(
                          duration: const Duration(milliseconds: 250),
                          child: ElevatedButton(
                            //-----------3번 버튼 시작
                            onPressed: () {
                              toggleSelect(2);
                            },
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                Size(width * 0.4, height * 0.08),
                              ),
                              maximumSize: MaterialStateProperty.all(
                                Size(width * 0.4, height * 0.08),
                              ),
                              backgroundColor: MaterialStateProperty.all(isThree
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).focusColor),
                              textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              side: MaterialStateProperty.all(
                                BorderSide(
                                  color: answerChk &
                                          (widget.data
                                                  .rightAnswer[widget.num] ==
                                              2)
                                      ? Colors.green.shade400
                                      : Colors.white,
                                  width: answerChk &
                                          (widget.data
                                                  .rightAnswer[widget.num] ==
                                              2)
                                      ? 5
                                      : 0,
                                ),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            child: AutoSizeText(answers[2], maxLines: 1),
                          ),
                        ), //-----------3번 버튼 끝
                        SizedBox(
                          width: width * 0.05,
                        ),
                        FadeInUp(
                          duration: const Duration(milliseconds: 250),
                          child: ElevatedButton(
                            //-----------4번 버튼 시작
                            onPressed: () {
                              toggleSelect(3);
                            },
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                Size(width * 0.4, height * 0.08),
                              ),
                              maximumSize: MaterialStateProperty.all(
                                Size(width * 0.4, height * 0.08),
                              ),
                              backgroundColor: MaterialStateProperty.all(isFour
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).focusColor),
                              textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              side: MaterialStateProperty.all(
                                BorderSide(
                                  color: answerChk &
                                          (widget.data
                                                  .rightAnswer[widget.num] ==
                                              3)
                                      ? Colors.green.shade400
                                      : Colors.white,
                                  width: answerChk &
                                          (widget.data
                                                  .rightAnswer[widget.num] ==
                                              3)
                                      ? 5
                                      : 0,
                                ),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            child: AutoSizeText(
                              answers[3],
                              maxLines: 1,
                            ),
                          ),
                        ), //-----------4번 버튼 끝
                      ],
                    ),
                    SizedBox(
                      height: height * 0.06,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.87),
            child: Center(
              child: Container(
                width: width * 0.9,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  onPressed: () {
                    answerChk
                        ? Navigator.push(
                            context,
                            Transition(
                              child: widget.num !=
                                      widget.data.question.length - 1
                                  ? QuestionScreen(
                                      id: widget.id,
                                      subject: widget.subject,
                                      difficulty: widget.difficulty,
                                      num: widget.num + 1,
                                      cat:
                                          widget.data.rightAnswer[widget.num] ==
                                                  choice
                                              ? widget.cat + 1
                                              : widget.cat,
                                      data: widget.data,
                                    )
                                  : EndQuestionScreen(
                                      cat:
                                          widget.data.rightAnswer[widget.num] ==
                                                  choice
                                              ? widget.cat + 1
                                              : widget.cat,
                                      queLen: widget.data.question.length,
                                    ),
                              transitionEffect: TransitionEffect.FADE,
                            ),
                          )
                        : next();
                  },
                  child: Text(
                    answerChk ? '다음 문제' : '확인',
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
