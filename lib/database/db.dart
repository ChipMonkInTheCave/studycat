import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studycat/models/graph_model.dart';
import 'package:studycat/models/question_model.dart';
import 'package:studycat/screens/graph/graph_screen.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<Map<String, QuestionModel?>> readQuestionData(
    String id, String subject, String difficulty) async {
  final ref = db
      .collection(id)
      .doc('question')
      .collection(subject)
      .doc(difficulty)
      .withConverter(
        fromFirestore: QuestionModel.fromFirestore,
        toFirestore: (QuestionModel question, _) => question.toFirestore(),
      );
  final docSnap = await ref.get();
  final myInstance = docSnap.data();
  final myMap = {subject: myInstance};
  if (myInstance != null) {
    return myMap;
  } else {
    return {
      'error': QuestionModel(
          question: ['error'], answer: [0, 0, 0, 0], rightAnswer: ['error'])
    };
  }
}

Future<List<Map<String, QuestionModel?>>> setQuestionData(
    String id, List<String> subject, String difficulty) async {
  List<Map<String, QuestionModel?>> myData = [];
  for (var sub in subject) {
    myData.add(await readQuestionData(id, sub, difficulty));
  }
  if (myData != null) {
    print(myData);
    return myData;
  } else {
    return [
      {
        'error': QuestionModel(
            question: ['error'], answer: [0, 0, 0, 0], rightAnswer: ['error'])
      }
    ];
  }
}

Future<GraphModel?> readGraphData(String id) async {
  final ref = db.collection(id).doc('record').withConverter(
        fromFirestore: GraphModel.fromFirestore,
        toFirestore: (GraphModel graph, _) => graph.toFirestore(),
      );
  final docSnap = await ref.get();
  final myInstance = docSnap.data();
  print(myInstance.toString());
  if (myInstance != null) {
    return myInstance;
  } else {
    return GraphModel(
      date: ['error'],
      eng: [0],
      kor: [0],
      math: [0],
    );
  }
}

Future<GraphModel?> setGraphData(String id) async {
  print(db.collection(id).doc('record'));
  GraphModel? myData;
  myData = await readGraphData(id);

  if (myData != null) {
    print('1111' + myData.date.toString());
    return myData;
  } else {
    return GraphModel(
      date: ['error'],
      eng: [0],
      kor: [0],
      math: [0],
    );
  }
}
