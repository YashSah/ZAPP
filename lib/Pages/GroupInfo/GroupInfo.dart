import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:zapp/Config/Images.dart';
import 'package:zapp/Controller/AuthController.dart';
import 'package:zapp/Model/GroupModel.dart';
import 'package:zapp/Pages/GroupInfo/GroupMemberInfo.dart';
import 'package:zapp/Pages/Home/Widgets/ChatTile.dart';
import 'package:zapp/Pages/UserProfile/Widgets/UserInfo.dart';

class GroupInfo extends StatelessWidget {
  final GroupModel groupModel;

  const GroupInfo({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(groupModel.name!),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            GroupMemberInfo(
              groupId: groupModel.id!,
              profileImage: groupModel.profileUrl == ""
                  ? AssetsImage.defaultProfileUrl
                  : groupModel.profileUrl!,
              userName: groupModel.name!,
              userEmail: groupModel.description ?? "No Description Available",
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Members",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 10,),
            Column(
                children: groupModel.members!
                    .map(
                      (member) => ChatTile(
                        imageUrl: member.profileImage ?? AssetsImage.defaultProfileUrl,
                        name: member.name!,
                        lastChat: member.email!,
                        lastTime: member.role == "admin" ? "Admin" : "Member",
                      ),
                    )
                    .toList()),
          ],
        ),
      ),
    );
  }
}
