import 'package:flutter/material.dart';
import 'package:hiaki_admin/pages/common_widget/button_common.dart';
import 'package:get/get.dart';
import '../yesno_dialog.dart';
import 'button_task.dart';
import 'status_task.dart';

class taskItem extends StatefulWidget {
  final String btnLeft;
  final String btnRight;
  final String status;
  final String request;
  final String timeSchedule;

  final String address;

  const taskItem(
      {super.key,
      this.btnLeft = "",
      this.btnRight = "",
      required this.status,
      required this.request,
      required this.timeSchedule,
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
        Container(
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Image.asset(
                      'assets/setting.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Text(
                      widget.request,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
              statusTask(tittle: widget.status)
            ]),
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
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      width: maxWidth * 0.5 - 48,
                      child: Text(
                        widget.address,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (widget.btnLeft != "" && widget.btnRight != "")
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buttonTask(
                        colorBg: Colors.white,
                        colorText: Colors.black,
                        onTap: () => yesNoDialog("Từ chối hỗ trợ"),
                        tittle: widget.btnLeft),
                    buttonTask(
                        colorBg: const Color(0xFF003B40),
                        colorText: const Color.fromARGB(255, 248, 245, 245),
                        onTap: () => yesNoDialog("Tiếp nhận hỗ trợ"),
                        tittle: widget.btnRight),
                  ],
                ),
              )
            else if (widget.btnRight != "")
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: buttonCommon(
                    maxWidth: maxWidth * 0.7,
                    height: 32,
                    onTap: () => yesNoDialog("Xác nhận Hoàn thành"),
                    tittle: widget.btnRight),
              )
          ]),
        ),
      ],
    );
  }
}
