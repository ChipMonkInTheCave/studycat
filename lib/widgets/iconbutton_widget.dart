import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final Widget destination; //버튼클릭시 이동할 스크린
  final IconData icon; // 아이콘 생긴거
  const IconButtonWidget({
    super.key,
    required this.destination,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      },
      iconSize: 40,
      color: Theme.of(context).cardColor,
      icon: Icon(icon),
    );
  }
}
