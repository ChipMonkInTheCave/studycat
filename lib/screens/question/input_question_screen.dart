import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/question/select_question_screen.dart';
import 'package:studycat/widgets/question_top_widget.dart';
import 'package:studycat/widgets/textfield_widget.dart';

class InputQuestion extends StatefulWidget {
  const InputQuestion({super.key});

  @override
  State<InputQuestion> createState() => _InputQuestionState();
}

class _InputQuestionState extends State<InputQuestion> {
  TextEditingController inputSubject = TextEditingController();
  TextEditingController inputquestion = TextEditingController();
  TextEditingController inputoptions = TextEditingController();
  TextEditingController inputanswer = TextEditingController();
  String subject = "math";
  String question = "";
  String options = "";
  int answer = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var color = context.watch<ThemeColor>();
    var questions = context.watch<CloudData>().myQuestion.question;
    var list1;
    var list2;
    var list3;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
            child: Stack(
          children: [
            const QuestionTopWidget(
                screenName: '문제 입력하기',
                screenExplain: '과목과 난이도를 입력하고\n     다음을 눌러주세요!',
                icon: Icons.arrow_back,
                destination: SelectQuestion()),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  width * 0.05,
                  height * 0.2,
                  width * 0.05,
                  height * 0.12,
                ),
                child: Container(
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.08, vertical: height * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            controller: inputSubject,
                            decoration:
                                TextFieldDeco('과목을 입력해주세요', '기존 과목이나 새 과목 입력'),
                            style: TextStyle(
                              fontSize: 20,
                              color: color.box,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            controller: inputquestion,
                            decoration:
                                TextFieldDeco('문제를 입력해주세요', 'ex) 1 + 1 = ??'),
                            style: TextStyle(
                              fontSize: 20,
                              color: color.box,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            controller: inputoptions,
                            decoration: TextFieldDeco(
                                '선택지를 4개 입력해주세요', 'ex) 1,2,3,4(쉼표로 구분)'),
                            style: TextStyle(
                              fontSize: 20,
                              color: color.box,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            controller: inputanswer,
                            decoration:
                                TextFieldDeco('답의 번호를 입력해주세요', '1번이 답이면 1'),
                            style: TextStyle(
                              fontSize: 20,
                              color: color.box,
                            ),
                          ),
                        ),
                        Text(subject),
                        SizedBox(
                          height: height * 0.03,
                        ),
                      ],
                    ),
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
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 127, 134, 220),
                        Color.fromARGB(255, 125, 135, 222),
                        Color.fromARGB(255, 157, 164, 232),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        subject = inputSubject.text;
                        question = inputquestion.text;
                        options = inputoptions.text;
                        answer = int.parse(inputanswer.text);
                        list1 = questions[subject]['01']['questions'];
                        list2 = questions[subject]['01']['options'];
                        list3 = questions[subject]['01']['answers'];
                        list1.add(inputquestion.text);
                        list2.add(inputoptions.text);
                        list3.add(int.parse(inputanswer.text) - 1);
                      });
                      if (questions.keys.contains(subject)) {
                        FirebaseFirestore.instance
                            .collection('001')
                            .doc('question')
                            .set({
                          subject: {
                            "01": {
                              "questions": list1,
                              "options": list2,
                              "answers": list3,
                            },
                          }
                        }, SetOptions(merge: true)).onError((error, _) =>
                                print('input question screen 확인 버튼error났어요'));
                      } else {
                        FirebaseFirestore.instance
                            .collection('001')
                            .doc('question')
                            .set({
                          subject: {
                            "01": {
                              "questions": list1,
                              "options": list2,
                              "answers": list3,
                            },
                            "kor": subject,
                          }
                        }, SetOptions(merge: true)).onError((error, _) =>
                                print('input question screen 확인 버튼error났어요'));
                      }
                      inputQuestion(
                        context,
                      );
                    },
                    child: AutoSizeText(
                      '확인',
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
        )),
      ),
    );
  }
}

void inputQuestion(
  BuildContext context,
) async {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: ((context) {
      return SizedBox(
        width: 300,
        height: 200,
        child: AlertDialog(
          title: const Text('입력 완료!'),
          content: SingleChildScrollView(
            child: Column(
              children: const [
                Text('123'),
              ],
            ),
          ),
        ),
      );
    }),
  );
}
