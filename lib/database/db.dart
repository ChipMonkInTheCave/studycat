import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studycat/models/question_model.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class dBase {
  QuestionModel? question;
}

dBase myDataBase = dBase();

Future<QuestionModel?> readQuestionData(
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
  if (myInstance != null) {
    return myInstance;
  } else {
    return QuestionModel(
        question: ['error'], rightAnswer: [0], answer: ['error']);
  }
}

Future<QuestionModel?> setQuestionData(
    String id, String subject, String difficulty) async {
  QuestionModel? myData = await readQuestionData(id, subject, difficulty);
  if (myData != null) {
    return myData;
  } else {
    return null;
  }
}
