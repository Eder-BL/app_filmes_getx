import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';
import './login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/images/background.png',
            width: Get.width,
            height: Get.height,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black45,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                Image.asset('assets/images/logo.png'),
                const SizedBox(height: 50),
                SizedBox(
                  height: 42,
                  width: Get.width * .9,
                  child: SignInButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    Buttons.google,
                    onPressed: () {
                      controller.login();
                    },
                    text: 'Entrar com o Google',
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
