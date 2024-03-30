import 'package:flutter/material.dart';
import 'package:zapp/Pages/Home/Widgets/ChatTile.dart';

import '../../Config/Images.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatTile(
          imageUrl: AssetsImage.defaultProfileUrl,
          name: "Study Group",
          lastChat: "Last Message",
          lastTime: "Last Time",
        ),
      ],
    );
  }
}
