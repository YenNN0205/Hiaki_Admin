import 'package:flutter/material.dart';

Center buttonCommon(
    {required double maxWidth,
    required Function() onTap,
    required tittle,
    double height = 52}) {
  return Center(
    child: GestureDetector(
      onTap: () => onTap.call(),
      child: Container(
        height: height,
        width: maxWidth * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF003B40),
        ),
        child: Center(
          child: Text(
            tittle,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0),
          ),
        ),
      ),
    ),
  );
}
