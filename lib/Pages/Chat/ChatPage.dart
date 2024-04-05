import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zapp/Controller/CallController.dart';
import 'package:zapp/Controller/ChatController.dart';
import 'package:zapp/Controller/ProfileController.dart';
import 'package:zapp/Pages/Chat/Widgets/ChatBubble.dart';
import 'package:zapp/Pages/Chat/Widgets/TypeMessage.dart';
import 'package:zapp/Pages/UserProfile/ProfilePage.dart';

import '../../Config/Images.dart';
import '../../Model/ChatModel.dart';
import '../../Model/UserModel.dart';

class ChatPage extends StatelessWidget {
  final UserModel userModel;

  const ChatPage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    TextEditingController messageController = TextEditingController();
    ProfileController profileController = Get.put(ProfileController());
    CallController callController = Get.put(CallController());

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
            Get.to(UserProfilePage(
              userModel: userModel,
            ));
          },
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  imageUrl:
                      userModel.profileImage ?? AssetsImage.defaultProfileUrl,
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
                      userModel.name ?? userModel.email!,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    StreamBuilder(
                      stream: chatController.getStatus(userModel.id!),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text("..........");
                        } else
                          return Text(
                            snapshot.data!.status ?? "",
                            style: TextStyle(
                                fontSize: 12,
                                color: snapshot.data!.status == "Online"
                                    ? Colors.green
                                    : Colors.grey,
                            ),
                          );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              callController.callAction(userModel, profileController.currentUser.value);
            },
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
            children: [
              Expanded(
                child: Stack(
                  children: [
                    StreamBuilder<List<ChatModel>>(
                      stream: chatController.getMessages(userModel.id!),
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
                      () => (chatController.selectedImagePath.value != "")
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
                                          File(chatController
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
                                          chatController
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
              TypeMessage(
                userModel: userModel,
              ),
            ],
          )),
    );
  }
}
