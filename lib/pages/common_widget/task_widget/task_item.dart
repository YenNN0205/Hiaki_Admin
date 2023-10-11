import 'package:flutter/material.dart';
import 'package:hiaki_admin/model/support_list.dart';
import 'package:hiaki_admin/pages/common_widget/button_common.dart';
import 'package:get/get.dart';
import 'package:hiaki_admin/pages/task_page/detail_task_page.dart';
import '../yesno_dialog.dart';
import 'button_task.dart';
import 'status_task.dart';

class taskItem extends StatefulWidget {
  final String status;
  final String request;
  final String timeSchedule;
  final SupportList item;
  final String address;

  const taskItem(
      {super.key,
      required this.status,
      required this.request,
      required this.timeSchedule,
      required this.item,
      required this.address});

  @override
  State<taskItem> createState() => _taskItemState();
}

class _taskItemState extends State<taskItem> {
  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        GestureDetector(
          onTap: () => Get.to(DetailTaskPage(
            item: widget.item,
          )),
          child: Container(
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Image.asset(
                        'assets/setting.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Container(
                        width: maxWidth*0.38,
                        child: Text(
                          widget.request,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
                statusTask(tittle: widget.status)
              ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 12),
                height: 1,
                decoration:
                    const BoxDecoration(color: Color.fromARGB(255, 91, 91, 91)),
              ),
              Row(
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
                          widget.timeSchedule,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      if (widget.status == "Open")
                        Padding(
                          padding: const EdgeInsets.only(top: 18),
                          child: buttonTask(
                              colorBg: Colors.white,
                              colorText: Colors.black,
                              onTap: () => yesNoDialog("Từ chối hỗ trợ"),
                              tittle: "Từ chối"),
                        )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Địa chỉ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(221, 88, 87, 87),
                            fontSize: 14),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 6.0),
                        width: maxWidth * 0.3 ,
                        child: Text(
                          widget.address,textAlign: TextAlign.end,
                          style: TextStyle(fontWeight: FontWeight.bold,),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (widget.status == "Open")
                        Padding(
                          padding: const EdgeInsets.only(top: 18),
                          child: buttonTask(
                              colorBg: const Color(0xFF003B40),
                              colorText: const Color.fromARGB(255, 248, 245, 245),
                              onTap: () => yesNoDialog("Tiếp nhận hỗ trợ"),
                              tittle: "Chấp nhận"),
                        )
                    ],

                  ),
                ],
              ),

               if (widget.status == "On progressing")
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: buttonCommon(
                      maxWidth: maxWidth * 0.7,
                      height: 32,
                      onTap: () => yesNoDialog("Xác nhận Hoàn thành"),
                      tittle: "Hoàn thành"),
                )
            ],
                ),
          ),
        ),
      ],
    );
  }
}
