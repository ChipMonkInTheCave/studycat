import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studycat/widgets/background_widget.dart';

class Recommend extends StatelessWidget {
  const Recommend({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(num: 0.2),
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
