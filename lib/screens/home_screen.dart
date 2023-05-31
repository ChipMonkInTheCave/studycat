import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/graph/graph_screen.dart';
import 'question/select_question_screen.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:studycat/widgets/background_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  final List<Widget> _widgetOptions = <Widget>[
    const Page(),
    const SelectQuestion(),
    const Graph(),
  ];
  int _currentSelected = 0;
  final GlobalKey<ScaffoldState> _endDrawerKey = GlobalKey();

  void _onItemTapped(int index) {
    index == 3
        ? _endDrawerKey.currentState!.openEndDrawer()
        : setState(() {
            _currentSelected = index;
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _endDrawerKey,
      body: _widgetOptions.elementAt(_currentSelected),
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
                  color: context.watch<ThemeColor>().background,
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        currentIndex: _currentSelected,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey[800],
        selectedItemColor: const Color.fromARGB(255, 103, 58, 183),
        iconSize: 40,
        selectedFontSize: 20,
        unselectedFontSize: 15,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: '홈',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: '학습',
            icon: Icon(Icons.menu_book),
          ),
          BottomNavigationBarItem(
            label: '그래프',
            icon: Icon(Icons.bar_chart),
          ),
          BottomNavigationBarItem(
            label: '메뉴',
            icon: Icon(Icons.menu),
          )
        ],
      ),
    );
  }
}

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            color: Colors.white,
          ),
          const BackgroundWidget(num: 0.35),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(
                width * 0.1,
                height * 0.05,
                width * 0.1,
                height * 0.1,
              ),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(3, 5),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('assets/profile.png'),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            width: 200,
                            height: 200,
                            child: CircularProgressIndicator(
                              strokeWidth: 5,
                              value: 0.7,
                              backgroundColor: Colors.white.withOpacity(0.3),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '23',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'Level',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 100,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '53%',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'Progress',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 100,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '70%',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'EXP',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectQuestion(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 4,
                        backgroundColor: Colors.white,
                        fixedSize: Size(width * 0.8, height * 0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Icon(
                        Icons.calendar_month,
                        size: 40,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SelectQuestion(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 4,
                            backgroundColor: Colors.white,
                            fixedSize: Size(width * 0.35, height * 0.125),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Icon(
                            Icons.people_outline,
                            size: 40,
                            color: Colors.purple,
                          ),
                        ),
                        const SizedBox(width: 40),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SelectQuestion(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 4,
                            backgroundColor: Colors.white,
                            fixedSize: Size(width * 0.35, height * 0.125),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            shadowColor: Colors.black.withOpacity(0.8),
                          ),
                          child: const Icon(
                            Icons.quiz,
                            size: 40,
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectQuestion(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 4,
                        backgroundColor: Colors.white,
                        fixedSize: Size(width * 0.8, height * 0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Icon(
                        Icons.recommend,
                        size: 40,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectQuestion(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 4,
                        backgroundColor: Colors.white,
                        fixedSize: Size(width * 0.8, height * 0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Icon(
                        Icons.bar_chart,
                        size: 40,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

<<<<<<< HEAD
Future<dynamic> inputQuestion(BuildContext context) async {
  return showDialog(
    context: context,
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
=======
class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime(2023, 1, 1),
      lastDay: DateTime(2023, 1, 31),
      locale: 'ko-KR',
      daysOfWeekHeight: 30,
    );
  }
>>>>>>> 84067617bc70e3520d4f38962ae44a06461ff732
}
