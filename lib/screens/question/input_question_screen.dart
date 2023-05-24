import 'package:flutter/material.dart';
import 'package:studycat/screens/home_screen.dart';

class InputQuestion extends StatelessWidget {
  const InputQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 700,
          child: Stack(
            children: [
              Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()),
                                  );
                                },
                                iconSize: 40,
                                color: Theme.of(context).cardColor,
                                icon: const Icon(Icons.home),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Text(
                                '문제 입력',
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Theme.of(context).cardColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '입력할 과목을 선택해주세요.',
                                style: TextStyle(
                                  color: Theme.of(context).cardColor,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 180, 30, 150),
                child: Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          inputQuestion(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 100,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        child: const Text(
                          '국어1',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          inputQuestion(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 100,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        child: const Text(
                          '수학1',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<dynamic> inputQuestion(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: ((context) {
      return const AlertDialog(
        title: Text('문제입력'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: '과목',
                  hintText: '과목을 입력해주세요.',
                ),
              ),
            ],
          ),
        ),
      );
    }),
  );
}
