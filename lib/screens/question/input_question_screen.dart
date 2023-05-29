import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/question/select_question_screen.dart';
import 'package:studycat/widgets/question_top_widget.dart';
import 'package:studycat/widgets/textfield_widget.dart';

class InputQuestion extends StatefulWidget {
  const InputQuestion({super.key});

  @override
  State<InputQuestion> createState() => _InputQuestionState();
}

class _InputQuestionState extends State<InputQuestion> {
  final _valueList = ['01', '02', '03'];
  String? _selectValue = '01';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var color = context.watch<ThemeColor>();
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
            child: Stack(
          children: [
            const QuestionTopWidget(
                screenName: '문제 입력하기',
                screenExplain: '과목과 난이도를 입력하고 다음을 눌러주세요!',
                icon: Icons.arrow_back,
                destination: SelectQuestion()),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  width * 0.05,
                  height * 0.2,
                  width * 0.05,
                  height * 0.12,
                ),
                child: Container(
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.08, vertical: height * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            decoration:
                                TextFieldDeco('과목을 입력해주세요', '기존 과목이나 새 과목 입력'),
                            style: TextStyle(
                              fontSize: 20,
                              color: color.box,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 5,
                              ),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: color.box, width: 2),
                                borderRadius: BorderRadius.circular(17),
                              ),
                              tileColor: color.text,
                              title: AutoSizeText(
                                '난이도',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: color.box,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: DropdownButton(
                                style: TextStyle(
                                  fontSize: 20,
                                  color: color.box,
                                  fontWeight: FontWeight.bold,
                                ),
                                borderRadius: BorderRadius.circular(17),
                                dropdownColor: color.text,
                                value: _selectValue,
                                items: _valueList
                                    .map((value) => DropdownMenuItem(
                                          value: value,
                                          child: Text(value),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectValue = value;
                                  });
                                },
                              )),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.87),
              child: Center(
                child: Container(
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 127, 134, 220),
                        Color.fromARGB(255, 125, 135, 222),
                        Color.fromARGB(255, 157, 164, 232),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: AutoSizeText(
                      '확인',
                      style: TextStyle(
                        color: color.text,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

Future<dynamic> inputQuestion(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: ((context) {
      return AlertDialog(
        title: const Text('문제입력'),
        content: SingleChildScrollView(
          child: Column(
            children: const [
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
