import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiaki_admin/controllers/update_list_controller.dart';
import 'package:hiaki_admin/model/support_list.dart';
import 'package:hiaki_admin/pages/common_widget/button_common.dart';
import 'package:hiaki_admin/pages/common_widget/item_details_common.dart';
import 'package:hiaki_admin/pages/main_page.dart';
import 'package:intl/intl.dart';

import '../../utils/data_bucket.dart';
import '../../utils/networking.dart';
import '../common_widget/gradient_app_bar.dart';
import '../common_widget/note_detail.dart';
import '../common_widget/task_widget/button_task.dart';
import '../common_widget/task_widget/status_task.dart';
import '../common_widget/yesno_dialog.dart';
import 'task_page.dart';

class DetailTaskPage extends StatefulWidget {
  final SupportList item;

  DetailTaskPage({super.key, required this.item});

  final profileData = DataBucket.getInstance().getDataProfile();
  @override
  State<DetailTaskPage> createState() => _DetailTaskPageState();
}

class _DetailTaskPageState extends State<DetailTaskPage> {
  final content = TextEditingController();
  final controller = Get.put(TaskListController());
  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;

    final _item = widget.item;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Chi tiết hỗ trợ',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: const GradientAppBarColor(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Container(
          // height: maxHeight,
          color: Colors.grey[300],
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    //tên sản phẩm và hình sản phẩm
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
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
                                padding: EdgeInsets.only(left: 24),
                                child: Text(
                                  _item.request ?? "",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          statusTask(tittle: _item.status ?? "")
                        ],
                      ),
                    ),
                    ItemDetailCommon(
                        tittle: 'Ngày tạo',
                        colorBorder: Colors.blueAccent,
                        description: _item.creationDate ?? "",
                        onTap: () {}),
                    ItemDetailCommon(
                        tittle: 'Ngày nhận',
                        description: DateFormat("dd/MM/yyyy hh:mm:ss")
                            .format(_item.timeSchedule ?? DateTime.now()),
                        onTap: () {}),
                    ItemDetailCommon(
                        tittle: 'Tên khách hàng',
                        colorBorder: Colors.green,
                        description: _item.customer ?? "",
                        onTap: () {}),
                    ItemDetailCommon(
                        tittle: 'Số điện thoại',
                        colorBorder: Colors.orange,
                        description: _item.phoneNumber ?? "",
                        onTap: () {}),
                    ItemDetailCommon(
                        tittle: 'Kỹ thuật viên',
                        description: widget.profileData[0].fullName ?? "",
                        onTap: () {}),

                    (_item.chatContent!.isEmpty)
                        ? NoteDetail(
                            colorTitle: Color(0xFFFFCE48),
                            colorContent: Color(0xFFF5F2C6),
                            content: "",
                            date: "",
                          )
                        : SizedBox(),
                    ...List.generate(_item.chatContent!.length, (index) {
                      return NoteDetail(
                        colorTitle: Color(0xFFFFCE48),
                        colorContent: Color(0xFFF5F2C6),
                        content: _item.chatContent![index].content ?? "",
                        date: _item.chatContent![index].date ?? "",
                      );
                    }),
                  ],
                ),
              ),
              if (_item.status == "Open" || _item.status == "On progressing")
                Container(
                  width: maxWidth,
                  color: Colors.green,
                  margin: EdgeInsets.only(top: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mô tả về việc sửa chữa ',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        TextFormField(
                          controller: content,
                          minLines: 2,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Nội dung ...',
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Colors.black54,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        if (_item.status == "Open")
                          Padding(
                            padding: const EdgeInsets.only(top: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                buttonTask(
                                    colorBg: Colors.white,
                                    colorText: Colors.black,
                                    onTap: () async {
                                      await controller.reloadData(
                                          maintenanceID:
                                              widget.item.maintenanceID ?? "",
                                          titleDialog: "Từ chối hỗ trợ",
                                          status: "Reject",
                                          isDetail: true);
                                    },
                                    tittle: "Từ chối"),
                                buttonTask(
                                    colorBg: const Color(0xFF003B40),
                                    colorText: const Color.fromARGB(
                                        255, 248, 245, 245),
                                    onTap: () async {
                                      await controller.reloadData(
                                          maintenanceID:
                                              widget.item.maintenanceID ?? "",
                                          titleDialog: "Tiếp nhận hỗ trợ",
                                          status: "On progressing",
                                          isDetail: true);
                                    },
                                    tittle: "Chấp nhận"),
                              ],
                            ),
                          )
                        else if (_item.status == "On progressing")
                          Padding(
                            padding: const EdgeInsets.only(top: 18),
                            child: buttonCommon(
                                maxWidth: maxWidth * 0.7,
                                height: 32,
                                onTap: () async {
                                  await controller.reloadData(
                                      maintenanceID:
                                          widget.item.maintenanceID ?? "",
                                      titleDialog: "Xác nhận hoàn thành",
                                      status: "Done",
                                      content: content.text,
                                      isDetail: true);
                                },
                                tittle: "Hoàn thành"),
                          ),
                      ],
                    ),
                  ),
                )
              else
                Container(
                  margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: NoteDetail(
                    //8CE88C
                    colorTitle: Color(0xFFAAFF90),
                    colorContent: Color(0xFFDBFDDB),
                    content: "",
                    title: "(của kỹ thuật viên)",
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
