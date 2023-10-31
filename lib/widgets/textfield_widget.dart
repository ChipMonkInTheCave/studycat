import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecoration TextFieldDeco(
  String label,
  String hint,
) {
  return InputDecoration(
    labelText: label,
    hintText: hint,
    labelStyle: GoogleFonts.jua(
      fontSize: 20,
      color: Color.fromARGB(255, 156, 120, 255),
      fontWeight: FontWeight.bold,
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
      borderSide:
          BorderSide(width: 2, color: Color.fromARGB(255, 156, 120, 255)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
      borderSide: BorderSide(
        width: 2,
        color: Color.fromARGB(255, 156, 120, 255),
      ),
    ),
  );
}
