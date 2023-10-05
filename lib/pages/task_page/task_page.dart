import 'package:flutter/material.dart';
import '../../utils/data_bucket.dart';
import '../common_widget/gradient_app_bar.dart';
import '../common_widget/task_widget/task_item.dart';

class TasksPage extends StatelessWidget {
  final dataSupportPending = DataBucket.getInstance().getSupportPending();
  final dataSupportProgress = DataBucket.getInstance().getSupportProgress();

  @override
  Widget build(BuildContext context) {
    // var maxHeight = MediaQuery.sizeOf(context).height;
    var maxWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Danh sách hỗ trợ',
          style: TextStyle(color: Colors.white),
        )),
        flexibleSpace: const GradientAppBarColor(),
      ),
      body: Container(
        color: const Color.fromARGB(255, 233, 231, 234),
        child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  width: maxWidth - 32,
                  height: 40,
                  margin: EdgeInsets.only(top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      color: const Color.fromARGB(255, 191, 229, 193),
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor:
                        const Color.fromARGB(255, 113, 113, 113),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Center(
                          child: Text('Đợi duyệt',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Center(
                          child: Text('Đã nhận',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(children: [
                    ListView.builder(
                        itemCount: dataSupportPending.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = dataSupportPending[index];
                          return taskItem(
                            btnLeft: "Từ chối",
                            btnRight: "Chấp nhận",
                            status: item.status ?? "",
                            request: item.request ?? "",
                            timeSchedule: item.timeSchedule ?? "",
                            address: item.address ?? "",
                          );
                        }),
                    ListView.builder(
                        itemCount: dataSupportProgress.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = dataSupportProgress[index];
                          return taskItem(
                            btnRight: "Hoàn thành",
                            status: item.status ?? "",
                            request: item.request ?? "",
                            timeSchedule: item.timeSchedule ?? "",
                            address: item.address ?? "",
                          );
                        }),
                  ]),
                ),
              ],
            )),
      ),
    );
  }
}
