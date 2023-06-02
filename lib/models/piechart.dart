// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:studycat/provider/provider.dart';

// class PieChartSample2 extends StatefulWidget {
//   const PieChartSample2({Key? key});

//   @override
//   State<StatefulWidget> createState() => PieChart2State();
// }

// class PieChart2State extends State<PieChartSample2> {
//   int touchedIndex = -1;

//   @override
//   Widget build(BuildContext context) {
//     var color = context.watch<ThemeColor>();
//     return AspectRatio(
//       aspectRatio: 1.5,
//       child: Column(
//         children: <Widget>[
//           const SizedBox(
//             height: 0,
//           ),
//           Expanded(
//             child: AspectRatio(
//               aspectRatio: 1,
//               child: PieChart(
//                 PieChartData(
//                   pieTouchData: PieTouchData(
//                     touchCallback: (FlTouchEvent event, pieTouchResponse) {
//                       setState(() {
//                         if (!event.isInterestedForInteractions ||
//                             pieTouchResponse == null ||
//                             pieTouchResponse.touchedSection == null) {
//                           touchedIndex = -1;
//                           return;
//                         }
//                         touchedIndex = pieTouchResponse
//                             .touchedSection!.touchedSectionIndex;
//                       });
//                     },
//                   ),
//                   borderData: FlBorderData(
//                     show: false,
//                   ),
//                   sectionsSpace: 0,
//                   centerSpaceRadius: 40,
//                   sections: showingSections(),
//                 ),
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 color: const Color.fromARGB(255, 119, 66, 243),
//                 child: const Padding(
//                   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                   child: Text(
//                     '국어',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 4,
//               ),
//               Container(
//                 color: const Color.fromARGB(255, 67, 26, 147),
//                 child: const Padding(
//                   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                   child: Text(
//                     '수학',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 4,
//               ),
//               Container(
//                 color: const Color.fromARGB(255, 35, 44, 150),
//                 child: const Padding(
//                   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                   child: Text(
//                     '영어',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 10,
//             width: 25,
//           ),
//         ],
//       ),
//     );
//   }

//   List<PieChartSectionData> showingSections() {
//     return List.generate(4, (i) {
//       final isTouched = i == touchedIndex;
//       final fontSize = isTouched ? 25.0 : 16.0;
//       final radius = isTouched ? 60.0 : 50.0;
//       const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
//       switch (i) {
//         case 0:
//           return PieChartSectionData(
//             color: const Color.fromARGB(255, 119, 66, 243),
//             value: 40,
//             title: '40%',
//             radius: radius,
//             titleStyle: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//               shadows: shadows,
//             ),
//           );
//         case 1:
//           return PieChartSectionData(
//             color: const Color.fromARGB(255, 67, 26, 147),
//             value: 30,
//             title: '30%',
//             radius: radius,
//             titleStyle: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//               shadows: shadows,
//             ),
//           );
//         case 2:
//           return PieChartSectionData(
//             color: const Color.fromARGB(255, 35, 44, 150),
//             value: 15,
//             title: '15%',
//             radius: radius,
//             titleStyle: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//               shadows: shadows,
//             ),
//           );
//         case 3:
//           return PieChartSectionData(
//             color: const Color.fromARGB(255, 160, 64, 239),
//             value: 15,
//             title: '15%',
//             radius: radius,
//             titleStyle: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//               shadows: shadows,
//             ),
//           );
//         default:
//           throw Error();
//       }
//     });
//   }
// }
