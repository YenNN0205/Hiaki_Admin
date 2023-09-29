import 'package:flutter/material.dart';

import '../common_widget/gradient_app_bar.dart';
import '../common_widget/task_widget/task_item.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 231, 234),
        appBar: AppBar(
          title: const Center(
              child: Text(
            'Lịch sử',
            style: TextStyle(color: Colors.white),
          )),
          flexibleSpace: const GradientAppBarColor(),
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 12),
          children: [
            ...List.generate(
                6,
                (index) => taskItem(
                      btnLeft: "Từ chối",
                      btnRight: "Tiếp nhận",
                      status: "Hoàn thành",
                    ))
          ],
        ));
  }
}
