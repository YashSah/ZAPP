import 'package:flutter/material.dart';
import 'package:zapp/Config/Images.dart';
import 'package:zapp/Pages/HomePage/Widgets/ChatTile.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatTile(),
        ChatTile(),
        ChatTile(),
        ChatTile(),
        ChatTile(),
        ChatTile(),
        ChatTile(),
      ],
    );
  }
}
