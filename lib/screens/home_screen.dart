import 'package:flutter/material.dart';
import 'package:studycat/screens/graph/graph_screen.dart';
import 'question/select_question_screen.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  final List<Widget> _widgetOptions = <Widget>[
    const Page(),
    const Page(),
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        currentIndex: _currentSelected,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey[800],
        selectedItemColor: Theme.of(context).focusColor,
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
          CustomPaint(
            painter: BackgroundPainter(),
            child: SizedBox(
              height: height * 0.3,
              width: width,
            ),
          ),
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

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path1 = Path();
    path1.moveTo(0, size.height);
    path1.quadraticBezierTo(size.width * 0.25, size.height * 0.9,
        size.width * 0.5, size.height * 0.9);
    path1.quadraticBezierTo(
        size.width * 0.75, size.height * 0.9, size.width, size.height);
    path1.lineTo(size.width, 0);
    path1.lineTo(0, 0);
    path1.close();

    Paint paint1 = Paint();
    paint1.shader = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF7B73FF),
        Color(0xFFC499FF),
      ],
    ).createShader(path1.getBounds());

    canvas.drawPath(path1, paint1);

    Path path2 = Path();
    path2.moveTo(0, size.height); // Update starting point
    path2.quadraticBezierTo(size.width * 0.15, size.height * 0.7,
        size.width * 0.3, size.height * 0.8);
    path2.quadraticBezierTo(size.width * 0.45, size.height * 0.9,
        size.width * 0.6, size.height * 0.6);
    path2.lineTo(size.width, size.height * 0.6); // Update ending point
    path2.lineTo(size.width, 0);
    path2.lineTo(0, 0);
    path2.close();

    Paint paint2 = Paint();
    paint2.shader = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFB992FF),
        Color(0xFF7B73FF),
      ],
    ).createShader(path2.getBounds());

    //canvas.drawPath(path2, paint2);

    Path path3 = Path();
    path3.moveTo(0, size.height); // Update starting point
    path3.quadraticBezierTo(size.width * 0.45, size.height * 0.7,
        size.width * 0.6, size.height * 0.8);
    path3.quadraticBezierTo(
        size.width * 0.75, size.height * 0.9, size.width, size.height * 0.6);
    path3.lineTo(size.width, size.height * 0.6); // Update ending point
    path3.lineTo(size.width, 0);
    path3.lineTo(0, 0);
    path3.close();

    Paint paint3 = Paint();
    paint3.shader = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF7B73FF),
        Color(0xFF3E0DFF),
      ],
    ).createShader(path3.getBounds());

    //canvas.drawPath(path3, paint3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

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
}
