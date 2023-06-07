import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';
import 'package:studycat/widgets/background_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 135, 74, 248)),
      body: Stack(
        children: [
          const BackgroundWidget(num: 0.35),
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
                  Consumer<ImageProviderModel>(
                    builder: (context, imageProvider, _) {
                      return CircleAvatar(
                        radius: 100,
                        backgroundImage: imageProvider.image != null
                            ? FileImage(File(imageProvider.image!.path))
                            : null,
                        // 프로필 이미지 설정
                      );
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    '한승재',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Gimbuk00@gmail.com',
                    style: TextStyle(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
