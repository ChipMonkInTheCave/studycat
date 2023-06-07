import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/auth/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
      appBar: AppBar(
        leading: CloseButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
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
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email:
                          _emailInputText.text.toLowerCase().trim(), // 가입 이메일
                      password: _passInputText.text.trim(), // 비밀번호
                    );

                    print('success registered');
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(context.read<CloudData>().id)
                        .set({
                      'question': [
                        {
                          '능률 VOCA : DAY1': {
                            'progress': '진보, 발전',
                            'propose': '제안하다, 청혼하다, 제시하다',
                            'produce': '생산하다, 농산물',
                            'protect': '보호하다, 막다, 지키다',
                            'purchase': ' 구매하다, 구입하다',
                            'predict': '예언하다, 예측하다',
                            'precaution': '조심, 경계, 예방책',
                            'premature': '시기상조의, 조급한, 너무 이른',
                            'preview': '미리보기, 시사회, 시연',
                            'forehead': '이마',
                            'forefather': '선조, 조상',
                            'foremost': '가장 중요한, 최고의, 선두의',
                            'foresee': '예견하다',
                            'postpone': '연기하다, 뒤로 미루다',
                            'postwar': '전쟁 이후의',
                            'income': '수입, 소득',
                            'intake': '섭취량',
                            'infection': '감염, 오염',
                            'insight': '통찰력',
                            'inherent': '내재된, 고유의',
                            'investment': '투자, 투자 자금',
                            'investigate': '수사하다, 조사하다',
                            'illustrate': '설명하다, 삽화를 쓰다, 예시를 보여주다',
                          }
                        },
                        {
                          '능률 VOCA : DAY2': {
                            'outcome': '결과, 성과',
                            'outline': '개요, 윤곽, 외형',
                            'outlook': '전망, 예측, 견해, 경치',
                            'outstanding': '뛰어난, 아주 훌륭한, 두드러진',
                            'outlet': '배출구, 상점, 콘센트',
                            'utter': '완전한, 전적인, 말하다',
                            'utmost': '최대의, 극도의',
                            'overcome': '극복하다, 이겨내다, 이기다',
                            'overlook': '간과하다, 눈감아 주다, 내려다보다',
                            'overseas': '해외로, 해외에 있는, 외국의',
                            'overhead': '머리 위에, 머리 위의',
                            'overtake': '능가하다, 따라잡다, 추월하다, 덮치다, 압도하다',
                            'overwhelm': '압도하다, 당황하게 하다',
                            'overlap': '겹치다, 포개지다, 중복되다',
                            'overflow': '넘치다, 범람하다, ㆍㆍㆍ로 넘쳐나다, 초과',
                            'extracurricular': '정규 교과 과정 이외의',
                            'extraterrestrial': '지구 밖의, 외계의, 외계인',
                            'exterdrdinary': '이상한, 비범한, 대단한',
                            'extrovert': '외향적인 사람',
                            'external': '외부의, 밖의',
                            'misfortune': '불운, 불행, 역경',
                            'mislead': '잘못 인도하다, 속이다, 오해하게 하다',
                            'misbehave': '버릇 없이 굴다, 비행을 저지르다',
                          }
                        },
                        {
                          '능률 VOCA : DAY3': {
                            'recall': '기억해내다, 상기하다, 회수하다',
                            'record': '기록, 음반, 기록하다',
                            'recover': '회복하다, 되찾다, 회수하다',
                            'recycle': '재활용하다, 재생하다',
                            'research': '연구, 조사, 조사하다',
                            'replace': '대신하다, 교체하다, 대체하다',
                            'reproduce': '생식하다, 복제하다, 재생하다',
                            'revive': '소생시키다, 되살아나게 하다, 재상영하다',
                            'remove': '제거하다, 옮기다, 이전시키다',
                            'retire': '은퇴하다, 은퇴시키다',
                            'remain': '여전히 ㆍㆍㆍ인 상태이다, 머무르다, 남아 있다',
                            'represent': '대변하다, 대표하다, 나타내다, 상징하다',
                            'international': '국제적인, 국가 간의',
                            'interpret': '통역하다, 이해하다, 파악하다, 연주하다',
                            'interfere': '간섭하다, 방해하다',
                            'interaction': '상호 작용, 상호 영향',
                            'dialogue': '대화, 문답, 회화',
                            'dialect': '방언, 사투리',
                            'diameter': '지름, 직경',
                            'transfer': '이동시키다, 옮기다, 갈아타다, 전송하다',
                            'transform': '변형시키다',
                            'translate': '번역하다, 해석하다',
                            'transplant': '옮겨 심다, 이식하다, 이식',
                          }
                        }
                      ],
                      'score': {},
                      'userdata': {'exp': 0, 'level': 1}
                    });
                    print(context.read<CloudData>().id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  } on FirebaseAuthException catch (e) {
                    print('an error occured $e');
                  }
                },
                child: const Text('이메일 회원가입'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
