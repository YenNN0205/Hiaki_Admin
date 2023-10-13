import 'package:flutter/material.dart';
import 'package:hiaki_admin/model/support_list.dart';
import 'package:hiaki_admin/pages/common_widget/button_common.dart';
import 'package:get/get.dart';
import 'package:hiaki_admin/pages/task_page/detail_task_page.dart';
import 'package:intl/intl.dart';
import '../../../controllers/update_list_controller.dart';
// import '../../../utils/networking.dart';
// import '../yesno_dialog.dart';
import 'button_task.dart';
import 'status_task.dart';

class taskItem extends StatefulWidget {
  final String status;
  final String request;
  final DateTime? timeSchedule;
  final SupportList item;
  final String address;
  // final Color colorBorder;

  const taskItem(
      {super.key,
      // required this.colorBorder,
      required this.status,
      required this.request,
      this.timeSchedule,
      required this.item,
      required this.address});

  @override
  State<taskItem> createState() => _taskItemState();
}

class _taskItemState extends State<taskItem> {
  final controller = Get.put(TaskListController());
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
              gradient: LinearGradient(
                stops:  [0.03, 0.02],
                // colors: [widget.colorBorder, Colors.white],
                colors: [Colors.red, Colors.white],
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            width: maxWidth * 0.38,
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
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 91, 91, 91)),
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
                            DateFormat("dd/MM/yyyy hh:mm:ss")
                                .format(widget.timeSchedule ?? DateTime.now()),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        if (widget.status == "Open")
                          Padding(
                            padding: const EdgeInsets.only(top: 18),
                            child: buttonTask(
                                colorBg: Colors.white,
                                colorText: Colors.black,
                                onTap: () async {
                                  await controller.reloadData(
                                      maintenanceID:
                                          widget.item.maintenanceID ?? "",
                                      titleDialog: "Từ chối hỗ trợ",
                                      status: "Reject");
                                },
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
                          width: maxWidth * 0.3,
                          child: Text(
                            widget.address,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (widget.status == "Open")
                          Padding(
                            padding: const EdgeInsets.only(top: 18),
                            child: buttonTask(
                                colorBg: const Color(0xFF003B40),
                                colorText:
                                    const Color.fromARGB(255, 248, 245, 245),
                                onTap: () async {
                                  await controller.reloadData(
                                      maintenanceID:
                                          widget.item.maintenanceID ?? "",
                                      titleDialog: "Tiếp nhận hỗ trợ",
                                      status: "On progressing");
                                },
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
                        onTap: () async {
                          await controller.reloadData(
                              maintenanceID: widget.item.maintenanceID ?? "",
                              titleDialog: "Xác nhận hoàn thành",
                              status: "Done");
                        },
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
