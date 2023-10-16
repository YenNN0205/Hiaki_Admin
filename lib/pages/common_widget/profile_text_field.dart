// import 'dart:ffi';

import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final String text;
  final Icon iconTextField;
  final TextInputType textType;
  final String hintText;
  final bool readOnly;
  final TextEditingController updateTextController;
  Color borderColor;

  ProfileTextField(
      {super.key,
      required this.text,
      required this.iconTextField,
      required this.textType,
      required this.hintText,
      this.borderColor = Colors.black54,
      this.readOnly = true,
      required this.updateTextController});

  Widget build(BuildContext context) {
    updateTextController.text = text;
    if(readOnly == false){
      borderColor = Color(0xff6491d3);
    }

    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 15),
      child: TextField(
          readOnly: readOnly,
          keyboardType: textType,
          controller: updateTextController,
          decoration: InputDecoration(
            labelStyle: TextStyle(color: borderColor),
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
                  width: 5,
                )),
          )),
    );
  }
}
