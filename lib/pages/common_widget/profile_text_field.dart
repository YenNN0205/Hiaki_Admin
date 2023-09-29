import 'package:flutter/material.dart';

Padding profileTextField({required TextEditingController textController,required Icon iconTextfield,required String hintText,required bool obscureText}) {
  return Padding(
    padding: const EdgeInsets.only(left: 25.0, right: 25.0,bottom:15),
    child: TextField(
        controller: textController,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black54),
          labelText: hintText,
          prefixIcon: iconTextfield,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: Colors.greenAccent,
                width: 2,
              )
          ),
          enabledBorder: OutlineInputBorder( //Outline border type for TextField
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: Colors.black54,
                width: 2,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: Colors.black54,
                width: 2,
              )
          ),
        )
    ),
  );
}