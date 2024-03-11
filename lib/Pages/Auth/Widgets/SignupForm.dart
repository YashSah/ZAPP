import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zapp/Controller/AuthController.dart';

import '../../../Widget/PrimaryButton.dart';


class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Column(
      children: [
        const SizedBox(height: 25,),
        TextField(
          controller: name,
          decoration: const  InputDecoration(
            hintText: "Full Name",
            prefixIcon: Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 20,),
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
          color: Theme.of(context).colorScheme.secondary,) : PrimaryButton(
          btnName: "SIGNUP",
          icon: Icons.lock,
          ontap: () {
            authController.createUser(email.text, password.text);
          },
        ),)
      ],
    );
  }
}