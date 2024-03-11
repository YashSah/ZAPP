import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zapp/Pages/Chat/Widgets/ChatBubble.dart';

import '../../Config/Images.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () { 
            Get.back();
          },
        ),
        title: Row(
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
                  "Yash Sah",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "Online",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ],
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
                decoration: InputDecoration(
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
            Container(
                width: 30,
                height: 30,
                child: SvgPicture.asset(AssetsImage.chatSendSvg, width: 25,)
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ChatBubble(
              message: "Hello! how are you?",
              imageUrl: "",
              isReceived: true,
              status: "read",
              time: "10:30 AM",
            ),
            ChatBubble(
              message: "Hello! how are you?",
              imageUrl: "",
              isReceived: false,
              status: "read",
              time: "10:30 AM",
            ),
            ChatBubble(
              message: "Hello! how are you?",
              imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeEl2bqk3s5rDbTy4fJQJ7lJk7QNcpHaV8JQ&usqp=CAU",
              isReceived: false,
              status: "read",
              time: "10:30 AM",
            ),
            ChatBubble(
              message: "Hello! how are you?",
              imageUrl: "",
              isReceived: true,
              status: "read",
              time: "10:30 AM",
            ),

          ],
        ),
      ),
    );
  }
}
