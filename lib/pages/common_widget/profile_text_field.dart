import 'dart:ffi';

import 'package:flutter/material.dart';

Padding profileTextField({required String text,int? textLength ,required Icon iconTextField,required TextInputType textType ,required String hintText,required bool obscureText}) {
  final textController = TextEditingController();
  textController.text = text;
  return Padding(
    padding: const EdgeInsets.only(left: 30.0, right: 30.0,bottom:15),
    child: TextField(
      readOnly: true,
        keyboardType: textType,
        controller: textController,
        maxLength: textLength,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black54),
          labelText: hintText,
          hintText: 'mew mew',
          prefixIcon: iconTextField,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: Colors.red,
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




// Container profileTextField({required TextEditingController textController,required Icon iconTextfield,required String hintText,required bool obscureText}) {
//   return Container(
//     padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(5),
//         border: Border.all(color: Colors.red)
//     ),
//     child: TextField(
//
//       decoration: InputDecoration(
//         border: InputBorder.none,
//         hintText: 'ssas',
//         labelText: hintText,
//       ),
//       controller: textController,
//     ),
//   );
// }