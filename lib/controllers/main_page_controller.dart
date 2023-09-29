import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hiaki_admin/pages/history_page/history_page.dart';

import '../pages/profile/profile_page.dart';
import '../pages/task_page/task_page.dart';

class MainPageController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final List<Widget> widgetOptions = <Widget>[
    const TasksPage(),
    const HistoryPage(),
    const ProfilePage(),
  ];

  onItemTaped(int index) {
    selectedIndex.value = index;
  }
}
