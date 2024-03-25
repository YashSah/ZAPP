import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zapp/Controller/ChatController.dart';
import 'package:zapp/Controller/ProfileController.dart';
import 'package:zapp/Pages/Chat/Widgets/ChatBubble.dart';
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

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () { 
            Get.back();
          },
        ),
        title: InkWell(
          onTap: () {
            Get.to(UserProfilePage(
              userModel: userModel,
            ));
          },
          child: Row(
            children: [
              Image.asset(
                AssetsImage.boyPic,
                width: 45,
              ),
              SizedBox(width: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userModel.name ?? userModel.email!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "Online",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
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

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          children: [
            Container(
                width: 30,
                height: 30,
                child: SvgPicture.asset(AssetsImage.chatMicSvg, width: 25,)),
            SizedBox(width: 10,),
            Expanded(
              child: TextField(
                controller: messageController,
                decoration: const InputDecoration(
                  filled: false,
                  hintText: "Text Message",
                ),
              ),
            ),
            SizedBox(width: 10,),
            Container(
                width: 30,
                height: 30,
                child: SvgPicture.asset(AssetsImage.chatGallerySvg, width: 25,)
            ),
            SizedBox(width: 10,),
            InkWell(
              onTap: () {
                if(messageController.text.isNotEmpty) {
                  chatController.sendMessage(userModel.id!, messageController.text, userModel);
                  messageController.clear();
                }
              },
              child: Container(
                  width: 30,
                  height: 30,
                  child: SvgPicture.asset(AssetsImage.chatSendSvg, width: 25,)
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(bottom: 70, top: 10, left: 10, right: 10),
        child: StreamBuilder<List<ChatModel>>(
          stream: chatController.getMessages(userModel.id!),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            }
            if(snapshot.data == null) {
              return Center(
                child: Text("No Messages"),
              );
            }
            else {
              return ListView.builder(
                reverse: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  DateTime timestamp =
                      DateTime.parse(snapshot.data![index].timeStamp!);
                  String formattedTime = DateFormat('hh:mm a').format(timestamp);
                  return ChatBubble(
                    message: snapshot.data![index].message!,
                    isReceived: snapshot.data![index].senderId != profileController.currentUser.value.id,
                    time: formattedTime,
                    status: "read",
                    imageUrl: snapshot.data![index].imageUrl ?? "",
                  );
                },
              );
            }
          },
        )
      ),
    );
  }
}
