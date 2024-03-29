import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/question/select_question_screen.dart';
import 'package:studycat/widgets/alert_widget.dart';
import 'package:studycat/widgets/background_widget.dart';
import 'package:studycat/widgets/textfield_widget.dart';

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
    SystemChrome.setEnabledSystemUIMode;
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
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: color.text,
                        size: 40,
                      ),
                    ),
                    Text(
                      '단어장 추가',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.jua(
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
                    style: GoogleFonts.jua(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            controller: inputController,
                            decoration: TextFieldDeco(
                                '단어장 이름을 입력해주세요', '기존 단어장이나 새 단어장 입력'),
                            style: GoogleFonts.jua(
                              fontSize: 20,
                              color: color.box,
                            ),
                          ),
                        ),
                        Text(
                            '\n**입력 방법**\n 새로운 이름을 입력하면 새로운 단어장이 생깁니다.\n 기존 단어장을 입력하면 기존 단어장에 단어가 추가됩니다.',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.jua(
                              color: color.background,
                              fontSize: width * 0.05,
                            )),
                        Text(
                            '\n**주의할 점**\n 새 단어장을 입력할때는 단어를 4개이상 입력해주세요.\n 단어나 뜻은 .(점)으로 구분합니다.\n',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.jua(
                              color: color.background,
                              fontSize: width * 0.05,
                            )),
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
                                nullAlert(context, '과목을 입력한 후 선택해주세요');
                              } else {
                                questionMenu(context, inputText);
                              }
                            },
                            child: AutoSizeText(
                              '    단어 추가하기    ',
                              style: GoogleFonts.jua(
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
              style: GoogleFonts.jua(
                color: context.watch<ThemeColor>().box,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              children: [
                Text(
                  '여러 개를 넣으려면 점으로 구분해주세요. \n 예시 : apple.banana.melon',
                  style: GoogleFonts.jua(
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
                  style: GoogleFonts.jua(
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
                  style: GoogleFonts.jua(
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
                      nullAlert(context, '영단어 갯수와\n뜻의 갯수를 맞춰주세요');
                    } else {
                      checkAlert(context, eng, kor, sub);
                    }
                  },
                  child: AutoSizeText(
                    '    단어 등록    ',
                    style: GoogleFonts.jua(
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
              style: GoogleFonts.jua(
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
                style: GoogleFonts.jua(
                  color: context.watch<ThemeColor>().box,
                  fontSize: 20,
                ),
              ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                          .doc(context.read<CloudData>().id)
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
                          .doc(context.read<CloudData>().id)
                          .update({'question': list1});
                    }
                    context.read<CloudData>().fetchData();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (_) => false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectQuestion()),
                    );
                  },
                  child: Text(
                    '    확인    ',
                    style: GoogleFonts.jua(
                      color: context.watch<ThemeColor>().text,
                      fontSize: MediaQuery.of(context).size.width * 0.07,
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
                    style: GoogleFonts.jua(
                      color: context.watch<ThemeColor>().text,
                      fontSize: MediaQuery.of(context).size.width * 0.07,
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
