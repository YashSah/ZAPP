import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:zapp/Config/Images.dart';
import 'package:zapp/Controller/ContactController.dart';
import 'package:zapp/Controller/GroupController.dart';
import 'package:zapp/Pages/Groups/NewGroup/GroupTitle.dart';
import 'package:zapp/Pages/Groups/NewGroup/SelectedMembersList.dart';
import 'package:zapp/Pages/Home/Widgets/ChatTile.dart';

class NewGroup extends StatelessWidget {
  const NewGroup({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.put(ContactController());
    GroupController groupController = Get.put(GroupController());
    return Scaffold(
        appBar: AppBar(
          title: Text("New Group"),
        ),
        floatingActionButton: Obx(
          () => FloatingActionButton(
            backgroundColor: groupController.groupMembers.isEmpty
                ? Colors.grey
                : Theme.of(context).colorScheme.primary,
            onPressed: () {
              if (groupController.groupMembers.isEmpty) {
                Get.snackbar("Error", "Please select atleast one member");
              } else {
                Get.to(GroupTitle());
              }
            },
            child: Icon(Icons.arrow_forward_ios_rounded,
                color: groupController.groupMembers.isEmpty ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SelectedMembers(),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Contacts on ZAPP",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: StreamBuilder(
                  stream: contactController.getContacts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
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
                          return InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              groupController
                                  .selectMembers(snapshot.data![index]);
                            },
                            child: ChatTile(
                              imageUrl: snapshot.data![index].profileImage ??
                                  AssetsImage.defaultProfileUrl,
                              name: snapshot.data![index].name!,
                              lastChat: snapshot.data![index].about ?? "",
                              lastTime: "",
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
