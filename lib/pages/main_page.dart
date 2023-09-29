import 'package:flutter/material.dart';
import 'package:hiaki_admin/pages/profile/profile_page.dart';
import 'package:hiaki_admin/pages/task_page/task_page.dart';
import 'package:get/get.dart';
import '../controllers/main_page_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final mainPageController = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: mainPageController.widgetOptions
            .elementAt(mainPageController.selectedIndex.value),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Nhiệm vụ"),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: "Lịch sử"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá nhân"),
          ],
          currentIndex: mainPageController.selectedIndex.value,
          //  selectedFontSize: 20,
          selectedItemColor: const Color(0xff638fd1),
          onTap: (index) => mainPageController.onItemTaped(index),
        ),
      ),
    );
  }
}
