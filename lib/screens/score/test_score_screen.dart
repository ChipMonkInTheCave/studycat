import 'package:flutter/material.dart';
import 'package:studycat/screens/home_screen.dart';

class TestScore extends StatefulWidget {
  const TestScore({Key? key}) : super(key: key);

  @override
  TestScoreState createState() => TestScoreState();
}

class TestScoreState extends State<TestScore> {
  int selectedButtonIndex = -1;
  List<Color> buttonColors = [
    const Color.fromARGB(255, 148, 104, 225),
    const Color.fromARGB(255, 148, 104, 225),
    const Color.fromARGB(255, 148, 104, 225)
  ];
  List<String> buttonLabels = ['국어', '영어', '수학'];
  List<bool> showDetails1 = [false, false, false, false, false];
  List<bool> showDetails2 = [false, false, false, false, false];
  List<bool> showDetails3 = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 103, 58, 183),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        title: const Text(
          '나의 공부 기록표',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton1(0),
              buildButton1(1),
              buildButton1(2),
            ],
          ),
          const SizedBox(height: 30),
          if (selectedButtonIndex == 0)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton2(0),
                const SizedBox(height: 10),
                buildButton2(1),
                const SizedBox(height: 10),
                buildButton2(2),
                const SizedBox(height: 10),
                buildButton2(3),
                const SizedBox(height: 10),
                buildButton2(4),
              ],
            ),
          if (selectedButtonIndex == 1)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton3(0),
                const SizedBox(height: 10),
                buildButton3(1),
                const SizedBox(height: 10),
                buildButton3(2),
                const SizedBox(height: 10),
                buildButton3(3),
                const SizedBox(height: 10),
                buildButton3(4),
              ],
            ),
          if (selectedButtonIndex == 2)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton4(0),
                const SizedBox(height: 10),
                buildButton4(1),
                const SizedBox(height: 10),
                buildButton4(2),
                const SizedBox(height: 10),
                buildButton4(3),
                const SizedBox(height: 10),
                buildButton4(4),
              ],
            ),
        ],
      ),
    );
  }

  Widget buildButton1(int index) {
    return SizedBox(
      height: 65,
      width: 140,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (selectedButtonIndex == index) {
              selectedButtonIndex = -1;
            } else {
              selectedButtonIndex = index;
            }

            buttonColors = List.generate(buttonColors.length, (i) {
              return (i == selectedButtonIndex)
                  ? const Color.fromARGB(255, 108, 68, 176)
                  : const Color.fromARGB(255, 148, 104, 225);
            });
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColors[index],
        ),
        child: Text(
          buttonLabels[index],
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  Widget buildButton2(int index2) {
    return Column(
      children: [
        SizedBox(
          height: 65,
          width: 420,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                showDetails1[index2] = !showDetails1[index2];
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: Text(
              showDetails1[index2] ? '상세 내용' : '기록기록',
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ),
        const SizedBox(height: 2),
        if (showDetails1[index2])
          Container(
            height: 100,
            width: 420,
            color: Colors.blue,
            child: const Text('상세 내용'),
          ),
      ],
    );
  }

  Widget buildButton3(int index2) {
    return Column(
      children: [
        SizedBox(
          height: 65,
          width: 420,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                showDetails1[index2] = !showDetails1[index2];
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text(
              showDetails1[index2] ? '상세 내용' : '기록기록',
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ),
        const SizedBox(height: 2),
        if (showDetails1[index2])
          Container(
            height: 100,
            width: 420,
            color: Colors.red,
            child: const Text('상세 내용'),
          ),
      ],
    );
  }

  Widget buildButton4(int index2) {
    return Column(
      children: [
        SizedBox(
          height: 65,
          width: 420,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                showDetails1[index2] = !showDetails1[index2];
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            child: Text(
              showDetails1[index2] ? '상세 내용' : '기록기록',
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ),
        const SizedBox(height: 2),
        if (showDetails1[index2])
          Container(
            height: 100,
            width: 420,
            color: Colors.black,
            child: const Text('상세 내용'),
          ),
      ],
    );
  }
}
