import 'package:flutter/material.dart';

Center statusTask({required Color colorBg, required tittle}) {
  return Center(
    child: Container(
        padding: const EdgeInsets.only(left: 8, top: 4, right: 8, bottom: 4),
        decoration: BoxDecoration(
            color: colorBg, borderRadius: BorderRadius.circular(16)),
        child: Text(
          tittle,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        )),
  );
}
