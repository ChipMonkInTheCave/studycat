import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/question/select_question_screen.dart';
import 'package:studycat/widgets/background_widget.dart';
import 'package:studycat/widgets/textfield_widget.dart';
import 'package:transition/transition.dart';

class InputQuestion extends StatefulWidget {
  const InputQuestion({super.key});

  @override
  State<InputQuestion> createState() => _InputQuestionState();
}

class _InputQuestionState extends State<InputQuestion> {
  TextEditingController inputController = TextEditingController();
  String inputText = '';
  String question = "";
  String options = "";
  int answer = 0;

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
            const BackgroundWidget(num: 0.22),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          Transition(
                            child: const SelectQuestion(),
                            transitionEffect: TransitionEffect.FADE,
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.home,
                        color: color.text,
                        size: 40,
                      ),
                    ),
                    Text(
                      '단어장 추가',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: color.text,
                        fontSize: width * 0.1,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.12,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.022,
                ),
                Center(
                  child: Text(
                    '나만의 새로운 단어장을 만들 수 있어요!',
                    style: TextStyle(
                      color: color.text,
                      fontSize: width * 0.05,
                    ),
                  ),
                ),
              ],
            ),
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
                            controller: inputController,
                            decoration:
                                TextFieldDeco('과목을 입력해주세요', '기존 과목이나 새 과목 입력'),
                            style: TextStyle(
                              fontSize: 20,
                              color: color.box,
                            ),
                          ),
                        ),
                        Center(
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                context
                                    .watch<ThemeColor>()
                                    .box
                                    .withOpacity(0.8),
                              ),
                            ),
                            onPressed: () {
                              inputText = inputController.text;
                              if (inputText.isEmpty) {
                                nullAlert(context, true);
                              } else {
                                questionMenu(context, inputText);
                              }
                            },
                            child: AutoSizeText(
                              '    단어 추가하기    ',
                              style: TextStyle(
                                color: context.watch<ThemeColor>().text,
                                fontSize: 30,
                              ),
                            ),
                          ),
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

void questionMenu(
  BuildContext context,
  String sub,
) async {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: ((context) {
      TextEditingController engController = TextEditingController();
      TextEditingController korController = TextEditingController();
      List eng = [];
      List kor = [];
      return AlertDialog(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.watch<ThemeColor>().box,
            width: 10.0,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: context.watch<ThemeColor>().text,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '어떤 단어를 넣을까요??',
              style: TextStyle(
                color: context.watch<ThemeColor>().box,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.34,
            child: Column(
              children: [
                const Text(
                  '여러 개를 넣으려면 점으로 구분해주세요. \n 예시 : apple.banana.melon',
                  style: TextStyle(
                    color: Color.fromARGB(255, 156, 120, 255),
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: engController,
                  decoration: TextFieldDeco(
                    '영단어를 입력해주세요',
                    'apple',
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextField(
                  controller: korController,
                  decoration: TextFieldDeco(
                    '뜻을 입력해주세요',
                    '사과',
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      context.watch<ThemeColor>().box.withOpacity(0.8),
                    ),
                  ),
                  onPressed: () {
                    eng = engController.text.split('.');
                    kor = korController.text.split('.');
                    if (eng.length != kor.length ||
                        engController.text.isEmpty ||
                        korController.text.isEmpty) {
                      nullAlert(context, false);
                    } else {
                      checkAlert(context, eng, kor, sub);
                    }
                  },
                  child: AutoSizeText(
                    '    단어 등록    ',
                    style: TextStyle(
                      color: context.watch<ThemeColor>().text,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }),
  );
}

void nullAlert(BuildContext context, bool sub) async {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: ((context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.watch<ThemeColor>().box,
            width: 10.0,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: context.watch<ThemeColor>().text,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              sub ? '과목을 입력한 후 선택해주세요' : '영단어 갯수와\n뜻의 갯수를 맞춰주세요',
              style: TextStyle(
                color: context.watch<ThemeColor>().box,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: const SingleChildScrollView(),
      );
    }),
  );
}

void checkAlert(BuildContext context, List eng, List kor, String sub) async {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: ((context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.watch<ThemeColor>().box,
            width: 10.0,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: context.watch<ThemeColor>().text,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "추가할 단어를 확인해주세요!!\n $sub에 추가됩니다!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.watch<ThemeColor>().box,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(children: [
            for (var i = 0; i < eng.length; i++)
              Text(
                '${i + 1}. 단어 : ${eng[i]}, 뜻 :${kor[i]}',
                style: TextStyle(
                  color: context.watch<ThemeColor>().box,
                  fontSize: 20,
                ),
              ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      context.watch<ThemeColor>().box.withOpacity(0.8),
                    ),
                  ),
                  onPressed: () {
                    var keylist = [];
                    for (var i = 0;
                        i <
                            context
                                .read<CloudData>()
                                .myQuestion
                                .question
                                .length;
                        i++) {
                      keylist.add(context
                          .read<CloudData>()
                          .myQuestion
                          .question[i]
                          .keys
                          .elementAt(0));
                    }
                    if (keylist.contains(sub)) {
                      var list1 = context.read<CloudData>().myQuestion.question;
                      var map1 = context
                          .read<CloudData>()
                          .myQuestion
                          .question[keylist.indexOf(sub)][sub];
                      for (var j = 0; j < eng.length; j++) {
                        map1[eng[j].toString()] = kor[j].toString();
                      }
                      list1[keylist.indexOf(sub)] = {sub: map1};
                      print(list1[keylist.indexOf(sub)]);
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc('jPwmXxGJpMZqGbPZqtNddImSTju1')
                          .update({'question': list1});
                    } else {
                      var list1 = context.read<CloudData>().myQuestion.question;
                      var map1 = {};
                      for (var j = 0; j < eng.length; j++) {
                        map1[eng[j].toString()] = kor[j].toString();
                      }
                      var map2 = {};
                      map2[sub] = map1;
                      list1.add(map2);
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc('jPwmXxGJpMZqGbPZqtNddImSTju1')
                          .update({'question': list1});
                    }
                    context.read<CloudData>().fetchData();
                    Navigator.pop(context);
                  },
                  child: Text(
                    '    확인    ',
                    style: TextStyle(
                      color: context.watch<ThemeColor>().text,
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      context.watch<ThemeColor>().box.withOpacity(0.8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    '    취소    ',
                    style: TextStyle(
                      color: context.watch<ThemeColor>().text,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
          ]),
        ),
      );
    }),
  );
}
