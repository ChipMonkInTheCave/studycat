import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:studycat/screens/home_screen.dart';
import 'package:studycat/screens/question/input_question_screen.dart';
import 'package:studycat/widgets/background_widget.dart';
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
    return FutureBuilder(
        future: context.read<CloudData>().fetchData(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    const BackgroundWidget(num: 0.18),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  Transition(
                                    child: const HomeScreen(),
                                    transitionEffect: TransitionEffect.FADE,
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.home,
                                color: color.text,
                                size: 40,
                              ),
                            ),
                            Text(
                              '문제 풀기',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.jua(
                                color: color.text,
                                fontSize: width * 0.1,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.12,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.017,
                        ),
                        Center(
                          child: Text(
                            '어떤 단어를 공부할까요??',
                            style: GoogleFonts.jua(
                              color: color.text,
                              fontSize: width * 0.05,
                            ),
                          ),
                        ),
                      ],
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
                          for (var i = 0; i < question.length; i++)
                            SelectQuetionWidget(
                                num: 0,
                                nn: i,
                                sub: question[i].keys.elementAt(0).toString()),
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
                                side: BorderSide(color: color.box, width: 5),
                                borderRadius: BorderRadius.circular(17),
                              ),
                              tileColor: color.text,
                              title: Icon(
                                Icons.add,
                                size: width * 0.15,
                                color: color.box,
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
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
                backgroundColor:
                    const Color.fromARGB(255, 135, 74, 248).withOpacity(0.9),
                body: Center(
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.asset('assets/roading.png')),
                ));
          } else {
            return Scaffold(
              body: Center(
                child: Text("재시작해주세요."),
              ),
            );
          }
        }));
  }
}
