import 'package:flutter/material.dart';
import 'package:studycat/database/db.dart';
import 'package:studycat/models/graph_model.dart';

class GraphTest extends StatefulWidget {
  const GraphTest({super.key});

  @override
  State<GraphTest> createState() => _GraphTestState();
}

class _GraphTestState extends State<GraphTest> {
  List<dynamic> date = [];
  List<dynamic> kor = [];
  List<dynamic> eng = [];
  List<dynamic> math = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: setGraphData('001'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              date = snapshot.data!.date;
              kor = snapshot.data!.kor;
              eng = snapshot.data!.eng;
              math = snapshot.data!.math;
              print(snapshot.data);
              return Center(
                child: Text('done'),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text('waiting'),
              );
            }
            return Center(
              child: Text('none'),
            );
          }),
    );
  }
}
