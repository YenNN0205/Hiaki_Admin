import 'package:flutter/material.dart';

import '../../utils/data_bucket.dart';
import '../common_widget/gradient_app_bar.dart';
import '../common_widget/task_widget/task_item.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final dataSupportHistory = DataBucket.getInstance().getSupportHistory();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
        body: ListView.builder(
            padding: EdgeInsets.only(top: 12),
            itemCount: dataSupportHistory.length,
            itemBuilder: (BuildContext context, int index) {
              final item = dataSupportHistory[index];
              return taskItem(
                item: item,
                status: item.status ?? "",
                request: item.request ?? "",
                timeSchedule: item.timeSchedule ?? "",
                address: item.address ?? "",
              );
            }));
  }
}
