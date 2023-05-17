import 'package:flutter/material.dart';
import 'package:studycat/screens/calender/calender_screen.dart';
import 'package:studycat/screens/graph/graph_screen.dart';
import 'package:studycat/screens/question/select_question_screen.dart';
import 'package:studycat/screens/profile_screen.dart';
import 'package:studycat/screens/recommend_screen.dart';
import 'package:flutter/services.dart';
import 'package:studycat/screens/score/test_score_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(Icons.search),
        //     onPressed: () {
        //       // 아이콘 버튼 실행
        //     },
        //   ),
        // ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                // 현재 계정 이미지
                backgroundImage: AssetImage('assets/profile.png'),
                backgroundColor: Colors.white,
              ),
              otherAccountsPictures: const <Widget>[
                // 다른 계정 이미지
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/profile2.png'),
                ),
              ],
              accountName: const Text(
                '승재',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              accountEmail: const Text(
                'Gimbuk00@gmail.com',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onDetailsPressed: () {
                // 계정변경버튼
              },
              decoration: BoxDecoration(
                  color: Theme.of(context).focusColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                size: 30,
                color: Colors.grey[850],
              ),
              title: const Text(
                '메인화면',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () {
                // Home
              },
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                size: 30,
                color: Colors.grey[850],
              ),
              title: const Text(
                '설정',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () {
                // 설정창으로
              },
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                size: 30,
                color: Colors.grey[850],
              ),
              title: const Text(
                '문의하기',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () {
                // Q&A창으로
              },
              trailing: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: width * 0.1,
            left: height * 0.015,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 4,
                backgroundColor: Theme.of(context).focusColor,
                fixedSize: Size(width * 0.45, height * 0.20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: const Text(
                '프로필',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Airal',
                ),
              ),
            ),
          ),
          Positioned(
            top: width * 0.1,
            left: height * 0.235,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Calender(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 4,
                backgroundColor: Theme.of(context).focusColor,
                fixedSize: Size(width * 0.45, height * 0.20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                '캘린더',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Airal',
                ),
              ),
            ),
          ),
          Positioned(
            top: width * 0.6,
            left: height * 0.02,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestScore(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 4,
                backgroundColor: Theme.of(context).focusColor,
                fixedSize: Size(width * 0.9, height * 0.15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                '학습기록',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Airal',
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
              width * 0.13,
              height * 0.35,
              width * 0.1,
              height * 0.1,
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.09,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SelectQuestion()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 4,
                            backgroundColor: Theme.of(context).focusColor,
                            fixedSize: Size(width * 0.32, height * 0.15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        child: const Text(
                          '학습하기',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Airal',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.13,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Graph()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 4,
                            backgroundColor: Theme.of(context).focusColor,
                            fixedSize: Size(width * 0.32, height * 0.15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        child: const Text(
                          '그래프',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Airal',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: width * 1.325,
            left: height * 0.05,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Graph(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 4,
                backgroundColor: Theme.of(context).focusColor,
                fixedSize: Size(width * 0.8, height * 0.25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                '그래프',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Airal',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<dynamic> inputQuestion(BuildContext context) async {
  return showDialog(
    context: context,
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
