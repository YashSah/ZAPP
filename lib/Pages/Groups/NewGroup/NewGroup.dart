import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zapp/Config/Images.dart';
import 'package:zapp/Controller/ContactController.dart';
import 'package:zapp/Pages/Home/Widgets/ChatTile.dart';

class NewGroup extends StatelessWidget {
  const NewGroup({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.put(ContactController());
    return Scaffold(
      appBar: AppBar(
        title: Text("New Group"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.arrow_forward_ios_rounded),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: StreamBuilder(
          stream: contactController.getContacts(),
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
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ChatTile(
                    imageUrl: snapshot.data![index].profileImage ?? AssetsImage.defaultProfileUrl,
                    name: snapshot.data![index].name!,
                    lastChat: snapshot.data![index].about ?? "",
                    lastTime: "",
                  );
                },
              );
            }
          },
        ),
      )
    );
  }
}
