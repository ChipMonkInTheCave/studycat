import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:studycat/firebase_options.dart';
import 'package:studycat/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode;
    return MaterialApp(
        theme: ThemeData(
          backgroundColor: const Color.fromARGB(255, 103, 58, 183),
          focusColor: const Color.fromARGB(255, 148, 104, 225),
          cardColor: Colors.white.withOpacity(0.9),
        ),
        home: const HomeScreen());
  }
}
