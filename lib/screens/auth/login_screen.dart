import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:studycat/screens/auth/signup_screen.dart';
import 'package:studycat/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailInputText = TextEditingController();
  final _passInputText = TextEditingController();

  @override
  void dispose() {
    _emailInputText.dispose();
    _passInputText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: _emailInputText,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: _passInputText,
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Password'),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () async {
                  // 이메일, 비번 중 하나라도 비워있으면 패스
                  if (_emailInputText.text.isEmpty ||
                      _passInputText.text.isEmpty) return;

                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailInputText.text.toLowerCase().trim(),
                      password: _passInputText.text.trim(),
                    );
                    print('success login');

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  } on FirebaseAuthException catch (e) {
                    print('an error occured $e');
                  }
                },
                child: const Text('이메일 로그인'),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final googleSignIn = GoogleSignIn();
                  final googleAccount = await googleSignIn.signIn();

                  if (googleAccount != null) {
                    final googleAuth = await googleAccount.authentication;

                    if (googleAuth.accessToken != null &&
                        googleAuth.idToken != null) {
                      try {
                        await FirebaseAuth.instance
                            .signInWithCredential(GoogleAuthProvider.credential(
                          idToken: googleAuth.idToken,
                          accessToken: googleAuth.accessToken,
                        ));
                        print('success registered');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      } on FirebaseAuthException catch (e) {
                        print('an error occured $e');
                      } catch (e) {
                        print('an error occured $e');
                      }
                    } else {
                      print('an error occured');
                    }
                  } else {
                    print('an error occured');
                  }
                },
                child: const Text('구글로 시작하기'),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()),
                  );
                },
                // width: double.infinity,
                child: const Text('회원가입 하러가기'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
