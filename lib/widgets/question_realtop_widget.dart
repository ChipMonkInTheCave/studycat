import 'package:flutter/material.dart';
import 'package:studycat/widgets/iconbutton_widget.dart';

class QuestionRealTopWidget extends StatelessWidget {
  final String screenName, screenExplain;
  final IconData icon;
  final Widget destination;
  final int questionLength;
  final int currentNum;

  const QuestionRealTopWidget(
      {super.key,
      required this.screenName,
      required this.screenExplain,
      required this.icon,
      required this.destination,
      required this.questionLength,
      required this.currentNum});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(top: height * 0.025),
      height: height * 0.3,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
                      color: Theme.of(context).cardColor,
                    ),
                    child: const Text(''),
                  ),
                  Container(
                    width: ((width * 0.7) / questionLength) * currentNum,
                    height: height * 0.03,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Theme.of(context).focusColor,
                    ),
                    child: const Text(''),
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
          Center(
            child: Text(
              screenExplain,
              style: TextStyle(
                color: Theme.of(context).cardColor,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
