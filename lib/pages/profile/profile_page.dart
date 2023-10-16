import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiaki_admin/pages/authentications/authentication.dart';
import 'package:hiaki_admin/pages/common_widget/common.dart';
import 'package:hiaki_admin/utils/data_bucket.dart';

import '../common_widget/profile_text_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  RxBool readOnly = true.obs;

  final dataProfile = DataBucket.getInstance().getDataProfile();

  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      resizeToAvoidBottomInset: false,
      body: Stack(
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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: maxWidth * 0.072,
                  ),
                  Container(
                      child: Text('Thông tin cá nhân',
                          style: TextStyle(fontSize: 22, color: Colors.white))),
                  FloatingActionButton(
                    mini: true,
                    onPressed: () => readOnly.toggle(),
                    child: CircleAvatar(
                      radius: 20,
                      child: Icon(Icons.edit),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Obx(
            () => Container(
              width: double.infinity,
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
                    padding: EdgeInsets.only(bottom: 20, top: 80),
                    child: Text(
                      '${dataProfile[0].fullName ?? "No data"}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ProfileTextField(
                    text: '${dataProfile[0].userName ?? "No data"}',
                    hintText: 'Username',
                    textType: TextInputType.text,
                    iconTextField: Icon(
                      Icons.person,
                      color: Colors.black54,
                    ),
                    readOnly: true,
                    updateTextController: _nameController,

                  ),
                  ProfileTextField(
                    text: "${dataProfile[0].email ?? "No data"}",
                    hintText: 'Email',
                    textType: TextInputType.emailAddress,
                    iconTextField: Icon(
                      Icons.mail,
                      color: Colors.black54,
                    ),
                    updateTextController: _emailController,
                    readOnly: readOnly.value,
                  ),
                  ProfileTextField(
                    text: "${dataProfile[0].phoneNumber ?? "No data"}",
                    hintText: 'Số Điện Thoại',
                    textType: TextInputType.number,
                    iconTextField: Icon(
                      Icons.phone,
                      color: Colors.black54,
                    ),
                    updateTextController: _phoneController,
                    readOnly: readOnly.value,
                  ),
                  ProfileTextField(
                    text: "${dataProfile[0].address ?? "No data"}",
                    hintText: 'Địa Chỉ',
                    textType: TextInputType.text,
                    iconTextField: Icon(
                      Icons.location_on,
                      color: Colors.black54,
                    ),
                    updateTextController: _addressController,
                    readOnly: readOnly.value,
                  ),
                  (readOnly.value)
                      ? Padding(
                          padding: EdgeInsets.only(top: maxHeight * 0.04),
                          child: buttonCommon(
                              maxWidth: maxWidth,
                              onTap: () {
                                Get.snackbar("Notification", "Log Out Success");
                                Get.offAll(() => LoginPage());
                              },
                              tittle: 'Đăng Xuất'),
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: maxHeight * 0.04),
                          child: buttonCommon(
                              maxWidth: maxWidth,
                              onTap: () {
                              },
                              tittle: 'Cập nhật'),
                        )
                ],
              ),
            ),
          ),
          //Avatar
          Container(
            padding: EdgeInsets.only(top: maxHeight * 0.125),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Color(0xff6491d3),
                  child: CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.white,
                    child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          'assets/avatar.png',
                          fit: BoxFit.contain,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
