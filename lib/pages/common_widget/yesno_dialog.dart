import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiaki_admin/pages/task_page/task_page.dart';

Future<String> yesNoDialog(String title) async {
  var result = await Get.defaultDialog<String>(
      titlePadding: EdgeInsets.all(24),
      title: title,
      contentPadding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
      middleText: "Khi bạn thực hiện hành động này sẽ không quay lại được.",
      textConfirm: "OK",
      textCancel: "Cancel",
      radius: 24,
      buttonColor: Colors.green,
      backgroundColor: Colors.grey.shade100,
      cancelTextColor: Colors.red,
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back(result: "true");
      });

  return result ?? "";
}
