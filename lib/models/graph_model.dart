import 'package:cloud_firestore/cloud_firestore.dart';

class GraphModel {
  List<dynamic> date;
  List<dynamic> eng;
  List<dynamic> math;
  List<dynamic> kor;

  GraphModel({
    required this.date,
    required this.eng,
    required this.math,
    required this.kor,
  });

  factory GraphModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return GraphModel(
        date: data?['record']['date'],
        eng: data?['record']['eng'],
        math: data?['record']['math'],
        kor: data?['record']['kor']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      'date': date,
      'eng': eng,
      'math': math,
      'kor': kor,
    };
  }
}
