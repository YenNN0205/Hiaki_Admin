import 'package:flutter/material.dart';


Container textFieldCommon({required TextEditingController textController,required String hintText,required bool obscureText}) {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: TextField(
          textInputAction: TextInputAction.next,
          controller: textController,
          style: const TextStyle(color: Colors.black),
          obscureText: obscureText,
          decoration:  InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
          ),
        ),
      ),
    ),
  );
}