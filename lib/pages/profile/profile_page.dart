import 'package:flutter/material.dart';
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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: maxWidth,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(0xff9eca47),
                  Color(0xff68b9b3),
                  Color(0xff6491d3)
                ])),
                height: maxHeight * 0.2,
                child: Center(
                    child: Text(
                  'Thông Tin Cá Nhân',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                )),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(20)),
                ),
                margin: EdgeInsets.only(top: maxHeight * 0.11),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: const Text(
                        'Nguyễn Văn C',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    //UserDetail
                    /**/
                    profileTextField(
                        textController: _nameController,
                        hintText : 'Username',
                        iconTextfield: Icon(Icons.person,color: Colors.black54,),
                        obscureText: false
                    ),

                    profileTextField(
                        textController: _emailController,
                        hintText : 'Email',
                        iconTextfield: Icon(Icons.mail,color: Colors.black54,),
                        obscureText: false
                    ),
                    profileTextField(
                        textController: _phoneController,
                        hintText : 'Số Điện Thoại',
                        iconTextfield: Icon(Icons.phone,color: Colors.black54,),
                        obscureText: false
                    ),
                    profileTextField(
                        textController: _addressController,
                        hintText : 'Địa Chỉ',
                        iconTextfield: Icon(Icons.location_on,color: Colors.black54,),
                        obscureText: false
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: maxHeight * 0.075),
                      child: buttonCommon(
                          maxWidth: maxWidth,
                          onTap: () {},
                          tittle: 'Đăng Xuất'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //
          Container(
            padding: EdgeInsets.only(top: maxHeight * 0.125),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 65,
                  backgroundColor: Color(0xff6491d3),
                  child: CircleAvatar(
                    // backgroundColor: Color(0xff9eca47),
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/avatar.png'),
                    radius: 60,
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
