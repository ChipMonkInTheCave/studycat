import 'package:flutter/material.dart';
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(top: height * 0.025),
      height: height * 0.5,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).focusColor,
          Theme.of(context).cardColor,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
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
              Text(
                screenName,
                style: TextStyle(
                  fontSize: 35,
                  color: Theme.of(context).cardColor,
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
