import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/widgets/iconbutton_widget.dart';

class QuestionTopWidget extends StatelessWidget {
  final String screenName, screenExplain;
  final IconData icon;
  final Widget destination;

  const QuestionTopWidget(
      {super.key,
      required this.screenName,
      required this.screenExplain,
      required this.icon,
      required this.destination});

  @override
  Widget build(BuildContext context) {
    var color = context.watch<ThemeColor>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(top: height * 0.025),
      height: height * 0.35,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 127, 134, 220),
            const Color.fromARGB(255, 125, 135, 222),
            const Color.fromARGB(255, 157, 164, 232),
            color.text,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
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
              AutoSizeText(
                screenName,
                style: TextStyle(
                  fontSize: 35,
                  color: color.text,
                ),
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
            child: AutoSizeText(
              screenExplain,
              style: TextStyle(
                color: color.text,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
