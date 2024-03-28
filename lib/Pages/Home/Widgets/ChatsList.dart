import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zapp/Config/Images.dart';
import 'package:zapp/Controller/ContactController.dart';
import 'package:zapp/Controller/ProfileController.dart';
import 'package:zapp/Pages/Chat/ChatPage.dart';

import 'ChatTile.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.put(ContactController());
    ProfileController profileController = Get.put(ProfileController());
    return RefreshIndicator(child: Obx(() => ListView(
      children: contactController.chatRoomList.map((e) => InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          Get.to(ChatPage(
            userModel: (e.receiver!.id
                == profileController.currentUser.value.id
                ? e.sender
                : e.receiver)!,
          ),);
        },
        child: ChatTile(
          imageUrl: (e.receiver!.id
              == profileController.currentUser.value.id
              ? e.sender!.profileImage
              : e.receiver!.profileImage) ??
              AssetsImage.defaultProfileUrl,
          name: (e.receiver!.id == profileController.currentUser.value.id
              ? e.sender!.name
              : e.receiver!.name)!,
          lastChat: e.lastMessage!,
          lastTime: e.lastMessageTimestamp!,
        ),
      ),).toList(),
    )), onRefresh: () {
      return contactController.getChatRoomList();
    });
  }
}
