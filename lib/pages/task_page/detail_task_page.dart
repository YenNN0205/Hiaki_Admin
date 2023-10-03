import 'package:flutter/material.dart';
import 'package:hiaki_admin/pages/common_widget/button_common.dart';
import 'package:hiaki_admin/pages/common_widget/item_details_common.dart';

import '../common_widget/gradient_app_bar.dart';
import '../common_widget/task_widget/status_task.dart';

class detailTaskPage extends StatefulWidget {
  const detailTaskPage({super.key});

  @override
  State<detailTaskPage> createState() => _detailTaskPageState();
}

class _detailTaskPageState extends State<detailTaskPage> {
  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
              'Chi tiết hỗ trợ',
              style: TextStyle(color: Colors.white),
            )),
        flexibleSpace: const GradientAppBarColor(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Container(
          
          color: Colors.grey[300],
          child: Column(
            children: [
              Container(
                // color: Colors.grey[300],
                margin: EdgeInsets.only(left: 20,right: 20),
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
                          statusTask(tittle: "Hoàn thành")
                        ],
                      ),
                    ),
                    ItemDetailCommon(tittle: 'Ngày tạo',colorBorder: Colors.blueAccent,description: '10:00 27/09/23', onTap: (){}),
                    ItemDetailCommon(tittle: 'Ngày nhận',description:'12:00 27/09/23', onTap: (){}),
                    ItemDetailCommon(tittle: 'Tên khách hàng',colorBorder: Colors.green,description:'Nguyễn Ngọc Yên', onTap: (){}),
                    ItemDetailCommon(tittle: 'Số điện thoại',colorBorder: Colors.orange,description:'093 1102 059', onTap: (){}),
                    ItemDetailCommon(tittle: 'Kỹ thuật viên',description:'Technician', onTap: (){}),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              color: Colors.yellow[400],
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text('Ghi chú ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                                      Text('(dành cho kỹ thuật viên)',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                                    ],
                                  ),
                                  Icon(
                                    Icons.event_note_outlined,
                                    color: Colors.black87,
                                    size: 30.0,
                                  ),
                                ],
                              ),
                            ),
                            // phần ghi chú của admin dành cho technician
                            Container(
                              padding: EdgeInsets.all(12),
                              color: Colors.yellow[100],
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Khách hàng khó tính, kỹ thuật viên cần sự kĩ càng và chu đáo',style: TextStyle(fontSize: 16),),
                                  Text('26/09/23',style: TextStyle(color: Colors.black54),),
                                ],
                              ),
                            ),
                            // phần ghi chú của technician gửi cho admin
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: maxWidth,
                color: Colors.green,
                margin: EdgeInsets.only(top: 20),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mô tả về việc sửa chữa ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                      TextFormField(
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
                      Padding(
                        padding: const EdgeInsets.only(top:5),
                        child: buttonCommon(maxWidth: maxWidth*0.5, onTap: (){}, tittle: 'Hoàn Thành'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      );
  }
}
