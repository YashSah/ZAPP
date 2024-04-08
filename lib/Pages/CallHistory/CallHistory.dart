import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zapp/Config/Images.dart';
import 'package:zapp/Controller/ChatController.dart';
import 'package:zapp/Pages/Home/Widgets/ChatTile.dart';

class CallHistory extends StatelessWidget {
  const CallHistory({super.key});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    return StreamBuilder(
        stream: chatController.getCalls(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                try {
                  DateTime timestamp = DateTime.parse(snapshot.data![index].timestamp!);
                  String formattedTime = DateFormat('hh:mm a').format(timestamp);
                  return ChatTile(
                    imageUrl: snapshot.data![index].receiverPic ?? AssetsImage.defaultProfileUrl,
                    name: snapshot.data![index].receiverName ?? "...",
                    lastChat: snapshot.data![index].type ?? "...",
                    lastTime: formattedTime,
                  );
                } catch (e) {
                  print("Error parsing date: $e");
                  return SizedBox();
                }
              },
            );
          } else {
            return Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
