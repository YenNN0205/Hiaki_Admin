import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiaki_admin/pages/authentications/authentication.dart';
<<<<<<< Updated upstream
=======
import 'package:hiaki_admin/pages/main_page.dart';
import 'package:hiaki_admin/pages/profile/profile_page.dart';
>>>>>>> Stashed changes
import 'package:hiaki_admin/pages/task_page/task_page.dart';
import 'package:hiaki_admin/scroll_behavior%20(1).dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
<<<<<<< Updated upstream
      // home: const LoginPage(),
      home: const LoginPage(),
=======
      home: const MainPage(),
      //   home: const ProfilePage(),
      // home: const TasksPage(),
>>>>>>> Stashed changes
    );
  }
}
