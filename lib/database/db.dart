import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studycat/models/graph_model.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

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
    print('1111${myData.date}');
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
