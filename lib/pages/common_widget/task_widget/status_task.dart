import 'package:flutter/material.dart';

Center statusTask({required String tittle}) {
  String _tittle = "";
  Color colorBg = Color.fromARGB(255, 176, 113, 187);
  if (tittle == "Open") {
    colorBg = Color.fromARGB(255, 176, 113, 187);
    _tittle = "Đang chờ";
  } else if (tittle == "Done") {
    colorBg = Color.fromARGB(255, 18, 204, 27);
    _tittle = "Hoàn thành";
  } else if (tittle == "Reject") {
    colorBg = Color.fromARGB(255, 214, 68, 20);
    _tittle = "Từ chối";
  } else {
    colorBg = Color.fromARGB(255, 18, 138, 198);
    _tittle = "Đang xử lý";
  }

  return Center(
    child: Container(
        padding: const EdgeInsets.only(left: 8, top: 4, right: 8, bottom: 4),
        decoration: BoxDecoration(
            color: colorBg, borderRadius: BorderRadius.circular(16)),
        child: Text(
          _tittle,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        )),
  );
}
