import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/screens/home_screen.dart';
import 'package:studycat/widgets/background_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:studycat/widgets/iconbutton_widget.dart';
import 'dart:io';

import 'package:studycat/widgets/textfield_widget.dart';

class ImageProviderModel extends ChangeNotifier {
  XFile? _image;

  XFile? get image => _image;

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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      body: Stack(
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
                    user.currentUser!.displayName == null
                        ? '익명'
                        : user.currentUser!.displayName.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    user.currentUser!.email.toString(),
                    style: const TextStyle(
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
                        fixedSize: Size(width * 0.32, height * 0.01),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    child: const Text('프로필 사진 수정'),
                  ),
                  const SizedBox(),
                  ElevatedButton(
                    onPressed: () {
                      nullAlert(context, "hi");
                      // 프로필 사진 수정
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 4,
                        backgroundColor:
                            const Color.fromARGB(255, 140, 97, 213),
                        fixedSize: Size(width * 0.32, height * 0.01),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    child: const Text('닉네임 수정'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void nullAlert(BuildContext context, String str) async {
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
              "변경할 닉네임을 입력해주세요.",
              style: TextStyle(
                color: context.watch<ThemeColor>().box,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: inputController,
                  decoration: TextFieldDeco('변경할 닉네임을 입력해주세요', '닉네임 입력'),
                  style: TextStyle(
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
                      } else {
                        user.currentUser!.updateDisplayName(inputText);
                      }
                      Navigator.pop(context);
                    },
                    child: Text(
                      '확인',
                      style: TextStyle(
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
