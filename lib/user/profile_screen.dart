import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/home_screen.dart';
import 'package:studycat/widgets/background_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:studycat/widgets/iconbutton_widget.dart';
import 'dart:io';

import 'package:studycat/widgets/textfield_widget.dart';
import 'package:transition/transition.dart';
<<<<<<< HEAD
=======

class ImageProviderModel extends ChangeNotifier {
  XFile? _image;
>>>>>>> f6cd64bc18a2a2014245d2aa2d9ac10ea4a5ab1a

class ImageProviderModel extends ChangeNotifier {
   XFile? _image;

  XFile? get image {
    // 이미지가 설정되어 있지 않으면 로컬 저장소에서 이미지를 로드합니다.
    if (_image == null) {
      loadImageFromStorage();
    }
    return _image;
  }
   Future<void> loadImageFromStorage() async {
    final Directory appDir = await getApplicationDocumentsDirectory();
    final String imagePath = '${appDir.path}/profile_image.jpg';
    final File file = File(imagePath);
    if (file.existsSync()) {
      _image = XFile(file.path);
    }
  }

  set image(XFile? newImage) {
    _image = newImage;
    notifyListeners();
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        Provider.of<ImageProviderModel>(context, listen: false).image =
            XFile(pickedFile.path); // 가져온 이미지 저장
        saveImageToStorage(); // 이미지를 앱 저장소에 저장
      });
    }
  }

  Future<void> saveImageToStorage() async {
    final XFile? imageFile =
        Provider.of<ImageProviderModel>(context, listen: false).image;
    if (imageFile != null) {
      final Directory appDir = await getApplicationDocumentsDirectory();
      final String imagePath = '${appDir.path}/profile_image.jpg';
      final File file = File(imageFile.path);
      await file.copy(imagePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    var color = context.watch<ThemeColor>();
    FirebaseAuth user = FirebaseAuth.instance;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String? name = user.currentUser!.displayName.toString();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const BackgroundWidget(num: 0.35),
            const IconButtonWidget(
              icon: Icons.arrow_back,
              destination: HomeScreen(),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                width * 0.1,
                height * 0.05,
                width * 0.1,
                height * 0.1,
              ),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Consumer<ImageProviderModel>(
                      builder: (context, imageProvider, _) {
<<<<<<< HEAD
                        imageProvider.loadImageFromStorage();
=======
>>>>>>> f6cd64bc18a2a2014245d2aa2d9ac10ea4a5ab1a
                        return CircleAvatar(
                          radius: 100,
                          backgroundImage: imageProvider.image != null
                              ? FileImage(File(imageProvider.image!.path))
                              : Image.asset('assets/default_image.png').image,
                          // 프로필 이미지 설정
                        );
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      user.currentUser?.displayName == null ? '익명' : name,
                      style: GoogleFonts.jua(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user.currentUser!.email.toString(),
                      style: GoogleFonts.jua(
                        fontSize: 16,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        getImage(ImageSource.gallery);
                        // 프로필 사진 수정
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 4,
                          backgroundColor:
                              const Color.fromARGB(255, 140, 97, 213),
                          fixedSize: Size(width * 0.34, height * 0.01),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                      child: Text('프로필 사진 수정', style: GoogleFonts.jua()),
                    ),
                    const SizedBox(),
                    ElevatedButton(
                      onPressed: () {
                        nullAlert(context);
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 4,
                          backgroundColor:
                              const Color.fromARGB(255, 140, 97, 213),
                          fixedSize: Size(width * 0.34, height * 0.01),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                      child: Text('닉네임 수정', style: GoogleFonts.jua()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void nullAlert(BuildContext context) async {
  var color = context.read<ThemeColor>();
  TextEditingController inputController = TextEditingController();
  String inputText = '';
  FirebaseAuth user = FirebaseAuth.instance;
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: ((context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.watch<ThemeColor>().box,
            width: 10.0,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: context.watch<ThemeColor>().text,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "닉네임 변경하기.",
              style: GoogleFonts.jua(
                color: context.watch<ThemeColor>().box,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextField(
                  cursorColor: const Color.fromARGB(255, 140, 97, 213),
                  controller: inputController,
                  decoration: TextFieldDeco('변경할 닉네임을 입력해주세요', '닉네임 입력'),
                  style: GoogleFonts.jua(
                    fontSize: 20,
                    color: color.box,
                  ),
                ),
                TextButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(
                          MediaQuery.of(context).size.width * 0.3,
                          MediaQuery.of(context).size.height * 0.05,
                        )),
                        side: MaterialStateProperty.all(
                          BorderSide(
                            color: context.watch<ThemeColor>().box,
                            width: 5,
                          ),
                        )),
                    onPressed: () {
                      inputText = inputController.text;
                      if (inputText == null) {
                      } else if (inputText.length > 0) {
                        user.currentUser!.updateDisplayName(inputText);
                      }
                      Alert(context);
                    },
                    child: Text(
                      '확인',
                      style: GoogleFonts.jua(
                        color: context.watch<ThemeColor>().box,
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          ),
        ),
      );
    }),
  );
}

void Alert(BuildContext context) async {
  var color = context.read<ThemeColor>();
  TextEditingController inputController = TextEditingController();
  String inputText = '';
  FirebaseAuth user = FirebaseAuth.instance;
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: ((context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.watch<ThemeColor>().box,
            width: 10.0,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: context.watch<ThemeColor>().text,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "닉네임 변경완료!.",
              style: GoogleFonts.jua(
                color: context.watch<ThemeColor>().box,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text("변경이 완료되었습니다.",
                    style: GoogleFonts.jua(
                      color: context.watch<ThemeColor>().box,
                      fontWeight: FontWeight.bold,
                    )),
                TextButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(
                          MediaQuery.of(context).size.width * 0.3,
                          MediaQuery.of(context).size.height * 0.05,
                        )),
                        side: MaterialStateProperty.all(
                          BorderSide(
                            color: context.watch<ThemeColor>().box,
                            width: 5,
                          ),
                        )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          Transition(
                              child: ProfileScreen(),
                              transitionEffect: TransitionEffect.FADE));
                    },
                    child: Text(
                      '확인',
                      style: GoogleFonts.jua(
                        color: context.watch<ThemeColor>().box,
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          ),
        ),
      );
    }),
  );
}
