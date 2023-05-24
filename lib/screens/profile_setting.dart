import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Profileset extends StatelessWidget {
  const Profileset({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).focusColor,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
              width * 0.13,
              height * 0.50,
              width * 0.1,
              height * 0.1,
            ),
            child: const Center(
              child: Column(
                children: [
                  Row(
                    children: [],
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
