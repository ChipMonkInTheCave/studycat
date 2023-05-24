import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:studycat/firebase_options.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    //사용할 프로바이더들 선언
    providers: [
      ChangeNotifierProvider<ThemeColor>(create: (_) => ThemeColor()),
      ChangeNotifierProvider<CloudData>(create: (_) => CloudData()),
      ChangeNotifierProvider<UserData>(create: (_) => UserData()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool update = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode;
    if (update) {
    } else {
      context.watch<CloudData>().fetchData();
      update = true;
    }
    return const MaterialApp(home: HomeScreen());
  }
}
