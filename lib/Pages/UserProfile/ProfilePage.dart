import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zapp/Controller/AuthController.dart';
import 'package:zapp/Controller/ProfileController.dart';

import '../../Config/Images.dart';
import '../../Model/UserModel.dart';
import 'Widgets/UserInfo.dart';

class UserProfilePage extends StatelessWidget {
  final UserModel userModel;
  const UserProfilePage({super.key, required this.userModel});

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
            LoginUserInfo(
              profileImage:  userModel.profileImage ?? AssetsImage.defaultProfileUrl,
              userName: userModel.name ?? "User",
              userEmail: userModel.email ?? "",
            ),
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
