import 'package:flutter/material.dart';

class BackgroundWidget extends StatefulWidget {
  final double num;
  const BackgroundWidget({super.key, required this.num});

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return CustomPaint(
      painter: BackgroundPainter(),
      child: SizedBox(
        height: height * widget.num,
        width: width,
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path3 = Path();
    path3.moveTo(0, size.height * 1.03);
    path3.quadraticBezierTo(size.width * 0.25, size.height * 1.35,
        size.width * 0.5, size.height * 1.15);
    path3.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.95,
      size.width * 1,
      size.height * 1.25,
    );
    path3.lineTo(size.width, 0);
    path3.lineTo(0, 0);
    path3.close();

    Paint paint3 = Paint();
    paint3.shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        const Color.fromARGB(255, 13, 0, 255).withOpacity(0.5),
        const Color.fromARGB(255, 227, 208, 240).withOpacity(0.5),
      ],
    ).createShader(path3.getBounds());

    Path path2 = Path();
    path2.moveTo(0, size.height * 0.83);
    path2.quadraticBezierTo(size.width * 0.25, size.height * 1.15,
        size.width * 0.5, size.height * 0.95);
    path2.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.75,
      size.width * 1,
      size.height * 1.05,
    );

    path2.lineTo(size.width, 0);
    path2.lineTo(0, 0);
    path2.close();

    Paint paint2 = Paint();
    paint2.shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        const Color.fromARGB(255, 135, 74, 248).withOpacity(0.9),
        const Color.fromARGB(255, 141, 135, 255).withOpacity(0.9),
      ],
    ).createShader(path2.getBounds());

    Path path1 = Path();
    path1.moveTo(0, size.height * 1.15);
    path1.quadraticBezierTo(size.width * 0.3, size.height * 0.85,
        size.width * 0.4, size.height * 0.9);
    path1.quadraticBezierTo(
        size.width * 0.7, size.height * 1.2, size.width, size.height);
    path1.lineTo(size.width, 0);
    path1.lineTo(0, 0);
    path1.close();

    Paint paint1 = Paint();
    paint1.shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        const Color.fromARGB(255, 13, 0, 255).withOpacity(0.65),
        const Color.fromARGB(255, 188, 155, 237).withOpacity(0.65),
      ],
    ).createShader(path1.getBounds());
    canvas.drawPath(path3, paint3);
    canvas.drawPath(path1, paint1);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
