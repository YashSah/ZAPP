import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zapp/Config/Images.dart';

import 'ChatTile.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InkWell(
          onTap: () {
            Get.toNamed("/chatPage");
          },
          child: ChatTile(
            imageUrl: AssetsImage.girlPic,
            name: "Divyana Kumari",
            lastChat: "Baad me baat krte hai okay.",
            lastTime: "09:23 PM",
          ),
        ),
        ChatTile(
          imageUrl: AssetsImage.boyPic,
          name: "Abhishek Saraswat",
          lastChat: "petha leke aayu hun",
          lastTime: "10:55 AM",
        ),ChatTile(
          imageUrl: AssetsImage.girlPic,
          name: "Divyana Kumari",
          lastChat: "Baad me baat krte hai okay.",
          lastTime: "09:23 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.boyPic,
          name: "Abhishek Saraswat",
          lastChat: "petha leke aayu hun",
          lastTime: "10:55 AM",
        ),ChatTile(
          imageUrl: AssetsImage.girlPic,
          name: "Divyana Kumari",
          lastChat: "Baad me baat krte hai okay.",
          lastTime: "09:23 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.boyPic,
          name: "Abhishek Saraswat",
          lastChat: "petha leke aayu hun",
          lastTime: "10:55 AM",
        ),ChatTile(
          imageUrl: AssetsImage.girlPic,
          name: "Divyana Kumari",
          lastChat: "Baad me baat krte hai okay.",
          lastTime: "09:23 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.boyPic,
          name: "Abhishek Saraswat",
          lastChat: "petha leke aayu hun",
          lastTime: "10:55 AM",
        ),

      ],
    );
  }
}
