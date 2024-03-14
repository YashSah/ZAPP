import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zapp/Controller/AuthController.dart';
import 'package:zapp/Controller/ProfileController.dart';

import '../../Config/Images.dart';
import 'Widgets/UserInfo.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: Text("UserProfile"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/updateProfilePage");
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            LoginUserInfo(),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                authController.logoutUser();
              },
              child: Text("Log Out"),
            ),
          ],
        ),
      ),
    );
  }
}
