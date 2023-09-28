import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widget/button_task.dart';
import '../common_widget/gradient_app_bar.dart';
import '../common_widget/status_task.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 231, 234),
      appBar: AppBar(
          title: const Center(
              child: Text(
            'Danh sách hỗ trợ',
            style: TextStyle(color: Colors.white),
          )),
          flexibleSpace: const GradientAppBarColor()),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.only(left: 24, top: 24),
            width: MediaQuery.sizeOf(context).width - 48,
            // height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              // border:
              //     Border.all(color: Color.fromARGB(255, 173, 40, 196), width: 1.5),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Image.network(
                        'https://hiaki.vn/wp-content/uploads/2022/07/z3600264171115_ad4a0bde8409411f22d6b52ab664e368.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 24),
                      child: Text(
                        'Lõi Aqua Extra',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
                statusTask(
                    colorBg: Color.fromARGB(255, 164, 75, 180),
                    tittle: 'Đang chờ')
              ]),
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 12),
                height: 1,
                decoration:
                    const BoxDecoration(color: Color.fromARGB(255, 91, 91, 91)),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thời gian',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(221, 88, 87, 87),
                            fontSize: 14),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6.0),
                        child: Text(
                          '27/09/2023 12:00 AM',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Địa chỉ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(221, 88, 87, 87),
                            fontSize: 14),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6.0),
                        child: Text(
                          '202 Lý Chính Thắng, Q3',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buttonTask(
                        colorBg: Colors.white,
                        colorText: Colors.black,
                        onTap: () => {},
                        tittle: 'Từ chối'),
                    buttonTask(
                        colorBg: Color(0xFF003B40),
                        colorText: Color.fromARGB(255, 248, 245, 245),
                        onTap: () => {},
                        tittle: 'Tiếp nhận'),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
