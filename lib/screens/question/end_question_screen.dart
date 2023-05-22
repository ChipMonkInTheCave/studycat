import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:studycat/screens/home_screen.dart';
import 'package:studycat/widgets/question_top_widget.dart';

class EndQuestionScreen extends StatefulWidget {
  final int cat, queLen;
  const EndQuestionScreen({super.key, required this.cat, required this.queLen});

  @override
  State<EndQuestionScreen> createState() => _EndQuestionScreenState();
}

class _EndQuestionScreenState extends State<EndQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String per = '${((widget.cat / widget.queLen) * 100).toInt()}%';
    List<Widget> pp = [];

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: const [
              QuestionTopWidget(
                screenName: "",
                screenExplain: '정답률',
                icon: Icons.home,
                destination: HomeScreen(),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.black87,
                      width: 10,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "${widget.cat}/${widget.queLen}",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ZoomIn(
                            child: Text(
                              per.toString()[0],
                              style: const TextStyle(
                                fontSize: 100,
                              ),
                            ),
                          ),
                          ZoomIn(
                            delay: const Duration(milliseconds: 500),
                            child: Text(
                              per.toString()[1],
                              style: const TextStyle(
                                fontSize: 100,
                              ),
                            ),
                          ),
                          ZoomIn(
                            delay: const Duration(milliseconds: 1000),
                            child: const Text(
                              '%',
                              style: TextStyle(
                                fontSize: 100,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.9),
            child: Center(
              child: Container(
                height: height * 0.07,
                width: width * 0.9,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                  child: Text(
                    '확인',
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
