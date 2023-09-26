import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiaki_admin/pages/main_page.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/util.dart';

class AuthenticationController extends GetxController {
  var employeePhoneNumber = RxString("");
  RxBool remember = false.obs;
  RxBool obscureText =true.obs;

  void setRemember() {
    remember.toggle();
  }

  void showPass(){
    obscureText.toggle();
  }

  void loadRemember(TextEditingController phoneController, TextEditingController passwordController) async {
    final prefs = await SharedPreferences.getInstance();
    final String? phoneNumber = prefs.getString('phoneNumber');
    final String?  password = prefs.getString('password');
    if(phoneNumber != null && password !=null){
      phoneController.text = phoneNumber;
      passwordController.text = password;
    }
  }

  void onTapForgot(){
    Get.snackbar('Notification', 'Please Contact Administrator for Sign Up');
  }


  Future<void> signInHandler(TextEditingController phoneController,
      TextEditingController passwordController,BuildContext context) async {
    Get.off(()=>MainPage());
    // if (phoneController.text.isEmpty) {
    //   // ignore: use_build_context_synchronously
    //   Get.snackbar('Notification', 'Phone number is empty');
    // } else if (passwordController.text.isEmpty) {
    //   // ignore: use_build_context_synchronously
    //   Get.snackbar('Notification', 'Password is empty');
    // } else {
    //   Map dataAuthentication = {
    //     'PhoneNumber': phoneController.text,
    //     'Password': passwordController.text
    //   };
    //   _onLoading(context, jsonEncode(dataAuthentication),phoneController.text,passwordController.text);
    // }
  }

  Future<void> _onLoading(BuildContext context, Object body,String phoneNumber,String password) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0x00ffffff).withOpacity(0),
          child: Center(
            child: LoadingAnimationWidget.halfTriangleDot(
                color: const Color(0xFF638fd1) ,size: 50),
          ),
        );
      },
    );
    dynamic value = await Networking.getInstance().getMetadata(body);
    if (value == 400) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Center(child: Text('Password or Phone Number was wrong')),
        ));
        Get.back();
    } else if (value == 200) {

      if(remember.value==true) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('phoneNumber', '$phoneNumber');
        await prefs.setString('password', '$password');
      }

    } else if (value == 410) {
     Get.snackbar("Thông báo", "tài khoản đã bị xoá");
      Get.back();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Center(child: Text('Unexpected error occur')),
      ));
      Get.back();
    }
  }
}
