import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:studycat/firebase_options.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/auth/login_screen.dart';
import 'package:studycat/screens/home_screen.dart';
import 'package:studycat/user/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeColor>(create: (_) => ThemeColor()),
      ChangeNotifierProvider<CloudData>(create: (_) => CloudData()),
      ChangeNotifierProvider<UserData>(create: (_) => UserData()),
      ChangeNotifierProvider<ImageProviderModel>(
          create: (_) => ImageProviderModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool update = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode;
    if (FirebaseAuth.instance.currentUser != null) {
      if (update) {
      } else {
        context.watch<CloudData>().getUID();
        context.watch<CloudData>().fetchData();
        // context.watch<UserData>().addSubject(
        //     context.watch<CloudData>().myQuestion.question.keys.elementAt(0),
        //     context.watch<CloudData>().myQuestion.question.keys.elementAt(0));
        update = true;
      }
      return const MaterialApp(home: HomeScreen());
    } else {
      return const MaterialApp(home: LoginScreen());
    }
  }
}
