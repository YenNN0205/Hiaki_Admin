// import 'dart:ffi';

import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final String text;
  final Icon iconTextField;
  final TextInputType textType;
  final String hintText;
  final bool readOnly;
  final bool autofocus;
  final TextEditingController updateTextController;
  Color borderColor;
  Color textColor;

  ProfileTextField(
      {super.key,
      required this.text,
      required this.iconTextField,
      required this.textType,
      required this.hintText,
      this.textColor = Colors.black87,
      this.borderColor = Colors.black54,
      this.readOnly = true,
      this.autofocus = false,
      required this.updateTextController});

  Widget build(BuildContext context) {
    updateTextController.text = text;
    if (readOnly == false) {
      borderColor = Color(0xff6491d3);
    }
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 15),
      child: TextField(
          autofocus: autofocus,
          style: TextStyle(color: textColor),
          readOnly: readOnly,
          keyboardType: textType,
          controller: updateTextController,
          decoration: InputDecoration(
            labelStyle: TextStyle(color: borderColor),
            // filled: true,
            // fillColor: Colors.black12,
            labelText: hintText,
            prefixIcon: iconTextField,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  width: 2,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: borderColor,
                  width: 2,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: borderColor,
                  width: 2,
                )),
          )),
    );
  }
}
