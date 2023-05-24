import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studycat/models/question_model.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class dBase {
  QuestionModel? question;
}

dBase myDataBase = dBase();

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
  print(db.collection("001").doc('question'));
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
