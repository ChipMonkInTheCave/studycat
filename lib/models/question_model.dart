import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  List<dynamic> question;
  List<dynamic> rightAnswer;
  List<dynamic> answer;

  QuestionModel({
    required this.question,
    required this.rightAnswer,
    required this.answer,
  });

  factory QuestionModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return QuestionModel(
      question: data?['question'],
      rightAnswer: data?['answer'],
      answer: data?['choice'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'question': question,
      'answer': rightAnswer,
      'choice': answer,
    };
  }
}
