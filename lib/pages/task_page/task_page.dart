import 'package:flutter/material.dart';
import '../common_widget/gradient_app_bar.dart';
import '../common_widget/task_widget/task_item.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    var maxheight = MediaQuery.sizeOf(context).height;
    var maxwidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Danh sách hỗ trợ',
          style: TextStyle(color: Colors.white),
        )),
        flexibleSpace: const GradientAppBarColor(),
      ),
      body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                width: maxwidth - 32,
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
                  ListView(
                    children: [
                      ...List.generate(
                          6,
                          (index) => taskItem(
                                btnLeft: "Từ chối",
                                btnRight: "Tiếp nhận",
                                status: "Đang chờ",
                              ))
                    ],
                  ),
                  ListView(
                    children: [
                      ...List.generate(
                          6,
                          (index) => taskItem(
                                btnLeft: "Từ chối",
                                btnRight: "Tiếp nhận",
                                status: "Đang xử lý",
                              ))
                    ],
                  )
                ]),
              ),
            ],
          )),
    );
  }
}
