import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../controllers/controller.dart';
import '../common_widget/common.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.put(AuthenticationController());
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    controller.loadRemember(_phoneController, _passwordController);
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xff9eca47),
              Color(0xff68b9b3),
              Color(0xff6491d3)
            ])),
            width: maxWidth,
            height: maxHeight / 2.5,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset('assets/white-hiaki.png')),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            margin: EdgeInsets.only(top: maxHeight * 0.315),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 40),
                    child: Text('Login',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.bold)),
                  ),
                  textFieldCommon(
                      textController: _phoneController,
                      hintText: 'User name',
                      obscureText: false),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Obx(
                      () => Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                controller: _passwordController,
                                style: const TextStyle(color: Colors.black),
                                obscureText: controller.obscureText.value,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () => controller.showPass(),
                              icon: (controller.obscureText.value == true)
                                  ? const Icon(Icons.visibility_outlined)
                                  : const Icon(Icons.visibility_off_outlined),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                value: controller.remember.value,
                                shape: const CircleBorder(),
                                onChanged: (_) => controller.setRemember(),
                                checkColor: Colors.white,
                                activeColor: const Color(0xFF003B40),
                              ),
                            ),
                            GestureDetector(child: const Text('Remember'),onTap: ()=>controller.setRemember(),),
                          ],
                        ),
                        TextButton(
                          onPressed: () =>controller.onTapForgot(),
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.normal,
                                fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(25, maxHeight * 0.08, 25, 0),
                      child: buttonCommon(
                          maxWidth: maxWidth,
                          onTap: () => controller.signInHandler(
                              _phoneController, _passwordController, context),
                          tittle: 'Login')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
