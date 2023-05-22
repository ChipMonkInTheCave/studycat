import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class QuestionBottomWidget extends StatelessWidget {
  const QuestionBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            child: const Text(
              'hi',
              style: TextStyle(
                fontSize: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
