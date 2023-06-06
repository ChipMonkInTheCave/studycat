import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studycat/models/data_models.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//이미 있는 프로바이더 사용법 : context.watch<사용할 프로바이더 클래스 이름>().클래스에 들어있는 변수 이름
//                              색깔 데이터를 사용하는 예제 )
//                                      사용할 스크린의 Text의 style: TextStyle(color: context.watch<ThemeColor>().background)

//많이 사용해야한다면 미리 변수 선언 후 사용 가능 var 아무변수이름 = context.watch<ThemeColor>()
//                                               이렇게 선언 후 나중에 사용할 때 = 아무변수이름.background

//---색깔 데이터--------------------
class ThemeColor with ChangeNotifier {
  Color _color = const Color.fromARGB(255, 103, 58, 183);
  Color get color => _color;

  Color background = const Color.fromARGB(255, 135, 74, 248)
      .withOpacity(0.9); //Color.fromARGB(
  //255, 113, 124, 219); //Color.fromARGB(255, 103, 58, 183);
  Color box = const Color.fromARGB(255, 156, 120, 255); // Color.fromARGB(
  //255, 157, 164, 232); //Color.fromARGB(255, 148, 104, 225);
  Color text = Colors.white.withOpacity(0.9);

  void changeColor(Color color) {
    _color = color;
    notifyListeners();
  }
}

//---유저 데이터--------------------
class UserData with ChangeNotifier {
  late String _id = '001';
  late double _width = 100;
  late double _height = 100;
  late final Map<String, String> _subject = {};
  String get id => _id;
  double get width => _width;
  double get height => _height;
  Map<String, String> get subject => _subject;

  void changeId(String id) {
    _id = id;
    notifyListeners();
  }

  void changeScreenSize(double width, double height) {
    _width = width;
    _height = height;
    notifyListeners();
  }

  void addSubject(String eng, String kor) {
    if (_subject.containsKey(eng)) {
    } else {
      _subject.addAll({eng: kor});
    }
    notifyListeners();
  }

  void removeSubject(String eng) {
    if (_subject.containsKey(eng)) {
      _subject.remove(eng);
    } else {}
    notifyListeners();
  }
}

//---클라우드 데이터--------------------
class CloudData with ChangeNotifier {
  late QuestionModel _myQuestion = QuestionModel(question: {'error': 321});
  late ScoreModel _myScore = ScoreModel(score: {'error': 123});
  late UserDataModel _myUserData = UserDataModel(userdata: {'error': 123});

  QuestionModel get myQuestion => _myQuestion;
  ScoreModel get myScore => _myScore;
  UserDataModel get myUserData => _myUserData;

  Future<void> fetchData() async {
    var data = await fetchDataFromFirestore('001');
    _myQuestion = data['question'];
    _myScore = data['score'];
    _myUserData = data['userdata'];
    notifyListeners();
  }
}

//데이터 가져오는 법(점수 데이터) : 사용할 스크린으로 간 뒤 context.watch<QuestionData>().myScore.score['data']['2023-05-23']['eng']의 출력 결과 = int형의 90
//                                 한번에 많은 양의 데이터 가져오기 = for문 사용 String date = '2023-05-' + i.toString(); 한 다음
//                                                                              list.add(context.watch<QuestionData>().myScore.score['data'][date]['eng'])
//                                                                              리스트에 지정한 날짜만큼 차곡차곡 쌓임
Future<Map<String, dynamic>> fetchDataFromFirestore(String id) async {
  DocumentSnapshot questionSnapshot =
      await FirebaseFirestore.instance.collection(id).doc('question').get();

  Map<String, dynamic> questionData =
      questionSnapshot.data() as Map<String, dynamic>;

  DocumentSnapshot scoreSnapshot =
      await FirebaseFirestore.instance.collection(id).doc('score').get();

  Map<String, dynamic> scoreData = scoreSnapshot.data() as Map<String, dynamic>;

  DocumentSnapshot userDataSnapshot =
      await FirebaseFirestore.instance.collection(id).doc('userdata').get();

  Map<String, dynamic> userData =
      userDataSnapshot.data() as Map<String, dynamic>;

  return {
    'question': QuestionModel(question: questionData),
    'score': ScoreModel(score: scoreData),
    'userdata': UserDataModel(userdata: userData),
  };
}
