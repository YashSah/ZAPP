import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zapp/Controller/ChatController.dart';
import 'package:zapp/Controller/ContactController.dart';
import 'package:zapp/Pages/Chat/ChatPage.dart';
import 'package:zapp/Pages/ContactPage/Widgets/ContactSearch.dart';
import 'package:zapp/Pages/ContactPage/Widgets/NewContactTile.dart';
import 'package:zapp/Pages/Groups/NewGroup/NewGroup.dart';

import '../../Config/Images.dart';
import '../Home/Widgets/ChatTile.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isSearchEnabled = false.obs;
    ContactController contactController = Get.put(ContactController());
    ChatController chatController = Get.put(ChatController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        actions: [
          Obx(() => IconButton(
            onPressed: () {
              isSearchEnabled.value = !isSearchEnabled.value;
            },
            icon: isSearchEnabled.value ? Icon(Icons.close) : Icon(Icons.person_search_outlined),
            tooltip: isSearchEnabled.value ? "Close" : "Search",
          ),),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Obx(
                  () => isSearchEnabled.value ? ContactSearch() : SizedBox(),
            ),
            SizedBox(height: 10,),
            NewContactTile(
              btnName: "New Contact",
              icon: Icons.person_add,
              ontap: () {},
            ),
            SizedBox(height: 10,),
            NewContactTile(
              btnName: "New Group",
              icon: Icons.group_add,
              ontap: () {
                Get.to(NewGroup());
              },
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("Contacts on ZAPP"),
              ],
            ),
            Obx(() => Column(
              children: contactController.userList.map((e) => InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  // Get.toNamed("/chatPage", arguments: e);
                  Get.to(ChatPage(userModel: e));
                },
                child: ChatTile(
                  imageUrl: e.profileImage ?? AssetsImage.defaultProfileUrl,
                  name: e.name ?? "User",
                  lastChat: e.about == "" || e.about == null ? "Hey there! I am ${e.name!}" : e.about!,
                  lastTime: e.email == chatController.auth.currentUser!.email ? "You" : "",
                ),
              ),).toList(),
            )),
          ],
        ),
      ),
    );
  }
}
