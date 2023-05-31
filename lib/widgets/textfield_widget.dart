import 'package:flutter/material.dart';

InputDecoration TextFieldDeco(
  String label,
  String hint,
) {
  return InputDecoration(
    labelText: label,
    hintText: hint,
    labelStyle: const TextStyle(
      fontSize: 20,
      color: Color.fromARGB(255, 125, 135, 222),
      fontWeight: FontWeight.bold,
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
      borderSide:
          BorderSide(width: 2, color: Color.fromARGB(255, 125, 135, 222)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
      borderSide: BorderSide(
        width: 2,
        color: Color.fromARGB(255, 125, 135, 222),
      ),
    ),
  );
}
