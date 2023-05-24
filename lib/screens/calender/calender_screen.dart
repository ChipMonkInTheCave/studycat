import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/widgets/question_top_widget.dart';
import '/screens/home_screen.dart';

class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    var color = context.watch<ThemeColor>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      body: Stack(
        children: [
          const QuestionTopWidget(
            screenName: '',
            screenExplain: '',
            icon: Icons.home,
            destination: HomeScreen(),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
              width * 0.13,
              height * 0.50,
              width * 0.1,
              height * 0.1,
            ),
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: const [],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
