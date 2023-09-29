import 'package:flutter/material.dart';

Center statusTask({required tittle}) {
  Color colorBg = Color.fromARGB(255, 176, 113, 187);
  if (tittle == "Đang chờ") {
    colorBg = Color.fromARGB(255, 176, 113, 187);
  } else if (tittle == "Hoàn thành") {
    colorBg = Color.fromARGB(255, 18, 204, 27);
  } else if (tittle == "Từ chối") {
    colorBg = Color.fromARGB(255, 214, 68, 20);
  } else {
    colorBg = Color.fromARGB(255, 18, 138, 198);
  }

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
