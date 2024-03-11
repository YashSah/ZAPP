import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zapp/Controller/AuthController.dart';
import 'package:zapp/Widget/PrimaryButton.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    AuthController authController = Get.put(AuthController());
    return Column(
      children: [
        const SizedBox(height: 25,),
        TextField(
          controller: email,
          decoration: const InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.email_outlined),
          ),
        ),
        const SizedBox(height: 20,),
        TextField(
          controller: password,
          decoration: const InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(Icons.password_outlined),
          ),
        ),
        const SizedBox(height: 60,),
        Obx(() => authController.isLoading.value ? CircularProgressIndicator(
            color: Theme.of(context).colorScheme.secondary) : PrimaryButton(
          btnName: "LOGIN",
          icon: Icons.lock,
          ontap: () {
            authController.login(email.text, password.text);
            // Get.offAllNamed("/homePage");
          },
        ),)
      ],
    );
  }
}
