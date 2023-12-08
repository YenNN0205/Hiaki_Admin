import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiaki_admin/pages/authentications/authentication.dart';
import 'package:hiaki_admin/pages/common_widget/common.dart';
import 'package:hiaki_admin/utils/data_bucket.dart';
import 'package:hiaki_admin/utils/networking.dart';
import 'package:hiaki_admin/model/profile_model.dart';
import 'package:hiaki_admin/controllers/profile_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../common_widget/profile_text_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = Get.put(ProfileController());

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void initState() {
    controller.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //Gradiant with text
            Container(
              width: maxWidth,
              height: maxHeight,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xff9eca47),
                Color(0xff68b9b3),
                Color(0xff6491d3)
              ])),

              child: Obx(
                () => controller.userData.isEmpty
                    ? Center(
                        child: LoadingAnimationWidget.discreteCircle(
                        color: Color(0xff6491d3),
                        size: 120,
                        thirdRingColor: Color(0xff9eca47),
                        secondRingColor: Color(0xff68b9b3),
                      ))
                    : Container(
                        width: double.infinity,
                        height: double.infinity,
                        margin: EdgeInsets.only(top: maxHeight * 0.2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: maxHeight * 0.08, bottom: 12),
                              child: Text(
                                '${controller.userData[0].fullName ?? "No data"}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            ProfileTextField(
                              text:
                                  '${controller.userData[0].userName ?? "No data"}',
                              hintText: 'Username',
                              textType: TextInputType.text,
                              textColor: Colors.black54,
                              iconTextField: Icon(
                                Icons.person,
                                color: Colors.black54,
                              ),
                              readOnly: true,
                              updateTextController: _nameController,
                            ),
                            ProfileTextField(
                              autofocus: true,
                              text:
                                  "${controller.userData[0].email ?? "No data"}",
                              hintText: 'Email',
                              textType: TextInputType.emailAddress,
                              iconTextField: Icon(
                                Icons.mail,
                                color: Colors.black54,
                              ),
                              updateTextController: _emailController,
                              readOnly: controller.readOnly.value,
                            ),
                            ProfileTextField(
                              text:
                                  "${controller.userData[0].phoneNumber ?? "No data"}",
                              hintText: 'Số Điện Thoại',
                              textType: TextInputType.number,
                              iconTextField: Icon(
                                Icons.phone,
                                color: Colors.black54,
                              ),
                              updateTextController: _phoneController,
                              readOnly: controller.readOnly.value,
                            ),
                            ProfileTextField(
                              text:
                                  "${controller.userData[0].address ?? "No data"}",
                              hintText: 'Địa Chỉ',
                              textType: TextInputType.text,
                              iconTextField: Icon(
                                Icons.location_on,
                                color: Colors.black54,
                              ),
                              updateTextController: _addressController,
                              readOnly: controller.readOnly.value,
                            ),
                            (controller.readOnly.value)
                                ? Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: buttonCommon(
                                        maxWidth: maxWidth,
                                        onTap: () {
                                          Get.snackbar("Notification",
                                              "Log Out Success");
                                          Get.offAll(() => LoginPage());
                                        },
                                        tittle: 'Đăng Xuất'),
                                  )
                                : Padding(
                                    padding:
                                        EdgeInsets.only(top: maxHeight * 0.04),
                                    child: buttonCommon(
                                        maxWidth: maxWidth,
                                        onTap: () async {
                                          await controller.reloadProfile(
                                              email: _emailController.text,
                                              phoneNumber:
                                                  _phoneController.text,
                                              titleDialog:
                                                  "Bạn có muốn thay đổi thông tin",
                                              address: _addressController.text);
                                        },
                                        tittle: 'Cập nhật'),
                                  )
                          ],
                        ),
                      ),
              ),
              //Avatar,
            ),

            Container(
              padding: EdgeInsets.only(top: maxHeight * 0.125),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: maxHeight * 0.07,
                    backgroundColor: Color(0xff6491d3),
                    child: CircleAvatar(
                      radius: maxHeight * 0.065,
                      backgroundColor: Colors.white,
                      child: SizedBox(
                          height: maxHeight * 0.06,
                          width: maxHeight * 0.06,
                          child: Image.asset(
                            'assets/avatar.png',
                            fit: BoxFit.contain,
                          )),
                    ),
                  ),
                ],
              ),
            ),

            //   width: maxWidth * 0.072,
            // ),
            Padding(
              padding: EdgeInsets.only(top: maxHeight * 0.12, right: 48),
              child: Align(
                alignment: Alignment.topRight,
                child: FloatingActionButton(
                  mini: true,
                  onPressed: () => controller.readOnly.toggle(),
                  child: CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.edit),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: maxHeight * 0.065),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text('Thông tin cá nhân',
                    style: TextStyle(fontSize: 22, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
