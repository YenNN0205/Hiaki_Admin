// import 'dart:ffi';

import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final String text;
  final Icon iconTextField;
  final TextInputType textType;
  final String hintText;
  final bool readOnly;
  final TextEditingController updateTextController;

  const ProfileTextField(
      {super.key,
      required this.text,
      required this.iconTextField,
      required this.textType,
      required this.hintText,
      this.readOnly = true,
      required this.updateTextController});

  Widget build(BuildContext context) {
    updateTextController.text = text;

    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 15),
      child: TextField(
          readOnly: readOnly,
          keyboardType: textType,
          controller: updateTextController,
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.black54),
            labelText: hintText,
            // hintText: 'mew mew',
            prefixIcon: iconTextField,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2,
                )),
            enabledBorder: OutlineInputBorder(
                //Outline border type for TextField
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: Colors.black54,
                  width: 2,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: Colors.black54,
                  width: 2,
                )),
          )),
    );
  }
}
