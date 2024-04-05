import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zapp/Controller/ChatController.dart';
import 'package:zapp/Controller/GroupController.dart';
import 'package:zapp/Controller/ProfileController.dart';
import 'package:zapp/Model/GroupModel.dart';
import 'package:zapp/Pages/Chat/Widgets/ChatBubble.dart';
import 'package:zapp/Pages/GroupInfo/GroupInfo.dart';

import '../../Config/Images.dart';
import '../../Model/ChatModel.dart';
import 'GroupTypeMessage.dart';

class GroupChat extends StatelessWidget {
  final GroupModel groupModel;

  const GroupChat({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());
    ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.to(GroupInfo(groupModel: groupModel));
          },
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  imageUrl: groupModel.profileUrl == ""
                      ? AssetsImage.defaultProfileUrl
                      : groupModel.profileUrl!,
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      groupModel.name ?? "Group",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      "Online",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.phone),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.video_call_outlined),
          ),
        ],
      ),
      body: Padding(
          padding:
              const EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
          child: Column(
            children:  [
              Expanded(
                child: Stack(
                  children: [
                    StreamBuilder<List<ChatModel>>(
                      stream: groupController.getGroupMessages(groupModel.id!),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("Error: ${snapshot.error}"),
                          );
                        }
                        if (snapshot.data == null) {
                          return Center(
                            child: Text("No Messages"),
                          );
                        } else {
                          return ListView.builder(
                            reverse: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              DateTime timestamp = DateTime.parse(
                                  snapshot.data![index].timeStamp!);
                              String formattedTime =
                              DateFormat('hh:mm a').format(timestamp);
                              return ChatBubble(
                                message: snapshot.data![index].message!,
                                isReceived: snapshot.data![index].senderId !=
                                    profileController.currentUser.value.id,
                                time: formattedTime,
                                status: "read",
                                imageUrl: snapshot.data![index].imageUrl ?? "",
                              );
                            },
                          );
                        }
                      },
                    ),
                    Obx(
                          () => (groupController.selectedImagePath.value != "")
                          ? Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(
                                    File(groupController
                                        .selectedImagePath.value),
                                  ),
                                  fit: BoxFit.contain,
                                ),
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              height: 500,
                            ),
                            Positioned(
                                right: 0,
                                child: IconButton(
                                  onPressed: () {
                                    groupController
                                        .selectedImagePath.value = "";
                                  },
                                  icon: Icon(Icons.close),
                                )),
                          ],
                        ),
                      )
                          : Container(),
                    ),
                  ],
                ),
              ),
              GroupTypeMessage(
                groupModel: groupModel,
              ),
            ],
          )),
    );
  }
}
