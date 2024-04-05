import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zapp/Controller/GroupController.dart';
import 'package:zapp/Pages/GroupChat/GroupChat.dart';
import 'package:zapp/Pages/Home/Widgets/ChatTile.dart';

import '../../Config/Images.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());
    return Obx(
      () => ListView(
        children: groupController.groupList
            .map(
              (group) => InkWell(
                onTap: () {
                  Get.to(GroupChat(groupModel: group,));
                },
                child: ChatTile(
                  name: group.name!,
                  imageUrl: group.profileUrl == ""
                      ? AssetsImage.defaultProfileUrl
                      : group.profileUrl!,
                  lastChat: "Group Created",
                  lastTime: "Just Now",
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
