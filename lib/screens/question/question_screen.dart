import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/question/end_question_screen.dart';
import 'package:studycat/screens/question/select_question_screen.dart';
import 'package:studycat/widgets/question_realtop_widget.dart';
import 'package:transition/transition.dart';

class QuestionScreen extends StatefulWidget {
  final String id, subject, difficulty;
  final int num, cat;

  const QuestionScreen({
    super.key,
    required this.id,
    required this.subject,
    required this.difficulty,
    required this.num,
    required this.cat,
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
    var color = context.watch<ThemeColor>();
    //--스크린 크기--//
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var data = context.watch<CloudData>().myQuestion.question[widget.subject]
        [widget.difficulty];
    //--객관식 답안들
    List<dynamic> answers = data['options'][widget.num].split(",");
    //--버튼 클릭 시 그 버튼 선택
    void toggleSelect(value) {
      for (var i = 0; i < isSelected.length; i++) {
        isSelected[i] = false;
      }
      isSelected[value] = true;
      choice = value;
      setState(() {});
    }

    //--답안 버튼 디자인
    ElevatedButton optionsButton(int num) {
      return ElevatedButton(
        onPressed: () {
          toggleSelect(num);
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
              color: answerChk & (data['answers'][widget.num] == num)
                  ? Colors.green.shade400
                  : Colors.white,
              width: answerChk & (data['answers'][widget.num] == num) ? 5 : 0,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
              isSelected[num] ? color.background : color.box),
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
        child: AutoSizeText(answers[num], maxLines: 1),
      );
    }

    //--확인 버튼 클릭 시 실행
    void next() {
      answerChk = true;
      setState(() {
        answerChk = true;
      });
    }

    return Scaffold(
      body: Stack(
        children: [
          QuestionScreenTopWidget(
            icon: Icons.arrow_back,
            destination: const SelectQuestion(),
            questionLength: data['questions'].length,
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
                        child: AutoSizeText(
                          '다음 문제의 답을 선택하세요!!',
                          style: TextStyle(
                              fontSize: 25,
                              color: color.background,
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
                        child: AutoSizeText(
                          data['questions'][widget.num],
                          style: TextStyle(
                              fontSize: 40,
                              color: color.background,
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
                          child: optionsButton(0),
                        ), //-----------1번 버튼 끝
                        SizedBox(
                          width: width * 0.05,
                        ),
                        FadeInRight(
                            duration: const Duration(milliseconds: 250),
                            child: optionsButton(1)), //-----------2번 버튼 끝
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
                          child: optionsButton(2),
                        ), //-----------3번 버튼 끝
                        SizedBox(
                          width: width * 0.05,
                        ),
                        FadeInUp(
                          duration: const Duration(milliseconds: 250),
                          child: optionsButton(3),
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
                  color: color.background,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  onPressed: () {
                    answerChk
                        ? Navigator.push(
                            context,
                            Transition(
                              child: widget.num != data['questions'].length - 1
                                  ? QuestionScreen(
                                      id: widget.id,
                                      subject: widget.subject,
                                      difficulty: widget.difficulty,
                                      num: widget.num + 1,
                                      cat: data['answers'][widget.num] == choice
                                          ? widget.cat + 1
                                          : widget.cat,
                                    )
                                  : EndQuestionScreen(
                                      cat: data['answers'][widget.num] == choice
                                          ? widget.cat + 1
                                          : widget.cat,
                                      queLen: data['questions'].length,
                                      subject: widget.subject,
                                    ),
                              transitionEffect: TransitionEffect.FADE,
                            ),
                          )
                        : next();
                  },
                  child: AutoSizeText(
                    answerChk ? '다음 문제' : '확인',
                    style: TextStyle(
                      color: color.text,
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
