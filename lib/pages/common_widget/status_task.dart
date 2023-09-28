import 'package:flutter/material.dart';

Center statusTask({required Color colorBg, required tittle}) {
  return Center(
    child: Container(
        padding: const EdgeInsets.only(left: 10, top: 6, right: 10, bottom: 6),
        decoration: BoxDecoration(
            color: colorBg, borderRadius: BorderRadius.circular(16)),
        child: Text(
          tittle,
          style: const TextStyle(color: Colors.white),
        )),
  );
}
