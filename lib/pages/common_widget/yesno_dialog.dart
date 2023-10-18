import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<String> yesNoDialog(String title) async {
  // var result = await Get.defaultDialog<String>(
  //     titlePadding: EdgeInsets.only(left:30,right:30,top:12,bottom:8),
  //     titleStyle: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),
  //     title: title,
  //     contentPadding: EdgeInsets.only(left: 24, right: 24, bottom: 10),
  //     middleText: "Khi bạn thực hiện hành động này sẽ không quay lại được.",
  //     middleTextStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),
  //     textConfirm: "OK",
  //     textCancel: "Huỷ",
  //     radius: 10,
  //     buttonColor: Color(0xff68b9b3),
  //     backgroundColor: Colors.grey.shade100,
  //     cancelTextColor: Colors.red,
  //     confirmTextColor: Colors.white,
  //     onConfirm: () {
  //       Get.back(result: "true");
  //     });
  // return result ?? "";


  var result = await Get.dialog<String>(

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Material(
                    child: Column(
                      children: [
                        Container(
                          height: 46,
                          width: 46,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff68b9b3),
                          ),
                          child: Icon(Icons.question_mark_sharp, color: Colors.white,),
                          alignment: Alignment.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          title,
                          textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),
                        ),
                        const SizedBox(height: 20),
                        //Buttons
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                child: const Text(
                                  'Hủy',
                                ),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(0, 35),
                                  primary: Colors.red,
                                  onPrimary: const Color(0xFFFFFFFF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                    Get.back();
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                child: const Text(
                                  'Xác nhận',
                                ),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(0, 35),
                                  primary: Color(0xff96e01f),
                                  onPrimary: const Color(0xFFFFFFFF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  Get.back(result: "true");
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  return result ?? "";

}
