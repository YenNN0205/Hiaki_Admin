import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiaki_admin/pages/authentications/authentication.dart';
import 'package:hiaki_admin/pages/common_widget/common.dart';

import '../common_widget/gradient_app_bar.dart';
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

  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {},
        child: CircleAvatar(
          radius: 20,
          child: Icon(Icons.edit),
        ),
      ),
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
            child: Container(
                margin: EdgeInsets.only(top: maxHeight * 0.08),
                child: Text('Thông Tin Cá Nhân',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, color: Colors.white))),
          ),
          //Text field Container
          Container(
            width: double.infinity,
            // height: maxHei,
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
                  padding: EdgeInsets.only(bottom: 20, top: maxHeight * 0.11),
                  child: const Text(
                    'Nguyễn Văn C',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                profileTextField(
                    text: 'Nguyễn Văn C',
                    hintText: 'Username',
                    textType: TextInputType.text,
                    iconTextField: Icon(
                      Icons.person,
                      color: Colors.black54,
                    ),
                    obscureText: false),
                profileTextField(
                    text: "abc@gmail.com",
                    hintText: 'Email',
                    textType: TextInputType.emailAddress,
                    iconTextField: Icon(
                      Icons.mail,
                      color: Colors.black54,
                    ),
                    obscureText: false),
                profileTextField(
                    text: "0355322422",
                    hintText: 'Số Điện Thoại',
                    textLength: 10,
                    textType: TextInputType.number,
                    iconTextField: Icon(
                      Icons.phone,
                      color: Colors.black54,
                    ),
                    obscureText: false),
                profileTextField(
                    text: "202 Ly Chinh Thang",
                    hintText: 'Địa Chỉ',
                    textType: TextInputType.text,
                    iconTextField: Icon(
                      Icons.location_on,
                      color: Colors.black54,
                    ),
                    obscureText: false),
                Padding(
                  padding: EdgeInsets.only(top: maxHeight * 0.04),
                  child: buttonCommon(
                      maxWidth: maxWidth,
                      onTap: () {
                        Get.snackbar("Notification", "Log Out Success");
                        Get.offAll(()=>LoginPage());
                      },tittle: 'Đăng Xuất'),
                ),
              ],
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
          //button Edit
        ],
      ),
    );
  }
}
