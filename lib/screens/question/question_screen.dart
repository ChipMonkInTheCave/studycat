import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studycat/database/db.dart';
import 'package:studycat/screens/question/end_question_screen.dart';
import 'package:studycat/screens/question/select_question_screen.dart';
import 'package:studycat/widgets/question_top_widget.dart';

enum answer { one, two, three, four }

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
  int _counter = 0;
  final _isChecked = false;
  answer _answer = answer.one;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  final Stream<QuerySnapshot> _stream =
      FirebaseFirestore.instance.collection('question').snapshots();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: setQuestionData(widget.id, widget.subject, widget.difficulty),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // return Text(snapshot.data!.question.toString());
          List<dynamic> answers = snapshot.data!.answer[widget.num].split(",");
          return Scaffold(
            body: Stack(
              children: [
                QuestionTopWidget(
                  screenName: widget.subject,
                  screenExplain: snapshot.data!.question[widget.num],
                  icon: Icons.arrow_back,
                  destination: const SelectQuestion(),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    width * 0.08,
                    height * 0.23,
                    width * 0.08,
                    height * 0.22,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RadioListTile(
                            title: Text(
                              answers[0],
                              style: const TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            value: answer.one,
                            groupValue: _answer,
                            onChanged: ((value) {
                              setState(
                                () {
                                  _answer = answer.one;
                                },
                              );
                            }),
                          ),
                          RadioListTile(
                            title: Text(
                              answers[1],
                              style: const TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            value: answer.two,
                            groupValue: _answer,
                            onChanged: ((value) {
                              setState(
                                () {
                                  _answer = answer.two;
                                },
                              );
                            }),
                          ),
                          RadioListTile(
                            title: Text(
                              answers[2],
                              style: const TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            value: answer.three,
                            groupValue: _answer,
                            onChanged: ((value) {
                              setState(
                                () {
                                  _answer = answer.three;
                                },
                              );
                            }),
                          ),
                          RadioListTile(
                            title: Text(
                              answers[3],
                              style: const TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            value: answer.four,
                            groupValue: _answer,
                            onChanged: ((value) {
                              setState(
                                () {
                                  _answer = answer.four;
                                },
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.8),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(0.27),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => widget.num !=
                                      snapshot.data!.question.length - 1
                                  ? QuestionScreen(
                                      id: widget.id,
                                      subject: widget.subject,
                                      difficulty: widget.difficulty,
                                      num: widget.num + 1,
                                      cat: snapshot.data!
                                                  .rightAnswer[widget.num] ==
                                              _answer.index
                                          ? widget.cat + 1
                                          : widget.cat,
                                    )
                                  : EndQuestionScreen(
                                      cat: snapshot.data!
                                                  .rightAnswer[widget.num] ==
                                              _answer.index
                                          ? widget.cat + 1
                                          : widget.cat,
                                      queLen: snapshot.data!.question.length,
                                    ),
                            ),
                          );
                        },
                        child: Text(
                          '확인',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.background,
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
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Stack(children: [
              const QuestionTopWidget(
                screenName: '불러오는중..',
                screenExplain: '불러오는중..',
                icon: Icons.arrow_back,
                destination: SelectQuestion(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  width * 0.08,
                  height * 0.23,
                  width * 0.08,
                  height * 0.22,
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
                ),
              ),
            ]),
          );
        }
        return const Text('no');
      },
    );
  }
}
