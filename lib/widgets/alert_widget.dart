import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:studycat/provider/provider.dart';

void nullAlert(BuildContext context, String str) async {
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
              str,
              style: GoogleFonts.jua(
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
            child: TextButton(
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
                  Navigator.pop(context);
                },
                child: Text(
                  '확인',
                  style: GoogleFonts.jua(
                    color: context.watch<ThemeColor>().box,
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
        ),
      );
    }),
  );
}
