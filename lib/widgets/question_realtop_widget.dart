import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/widgets/background_widget.dart';
import 'package:studycat/widgets/iconbutton_widget.dart';

class QuestionScreenTopWidget extends StatelessWidget {
  final IconData icon;
  final Widget destination;
  final int questionLength;
  final int currentNum;

  const QuestionScreenTopWidget(
      {super.key,
      required this.icon,
      required this.destination,
      required this.questionLength,
      required this.currentNum});

  @override
  Widget build(BuildContext context) {
    var color = context.watch<ThemeColor>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(children: [
      const BackgroundWidget(num: 0.2),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButtonWidget(
                icon: icon,
                destination: destination,
              ),
              Stack(
                children: [
                  Container(
                    width: width * 0.7,
                    height: height * 0.03,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: color.text,
                    ),
                    // child: const Text(''),
                  ),
                  Container(
                    width: ((width * 0.7) / questionLength) * currentNum,
                    height: height * 0.03,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: color.box,
                    ),
                    // child: const Text(''),
                  ),
                ],
              ),
              Container(
                width: width * 0.12,
              )
            ],
          ),
          SizedBox(
            height: height * 0.030,
          ),
        ],
      ),
    ]);
  }
}
