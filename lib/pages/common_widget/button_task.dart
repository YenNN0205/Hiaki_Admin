import 'package:flutter/material.dart';

Center buttonTask(
    {required Color colorText,
    required Color colorBg,
    required Function() onTap,
    required tittle}) {
  return Center(
    child: GestureDetector(
      onTap: () => onTap.call(),
      child: Container(
        height: 36,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorBg,
          border: Border.all(color: Color(0xFF003B40), width: 1.5),
        ),
        child: Center(
          child: Text(
            tittle,
            style: TextStyle(
                color: colorText, fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
      ),
    ),
  );
}
