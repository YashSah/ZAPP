import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:zapp/Config/Images.dart';
import 'package:zapp/Controller/GroupController.dart';
import 'package:zapp/Controller/ImagePicker.dart';
import 'package:zapp/Controller/ProfileController.dart';
import 'package:zapp/Pages/Home/Widgets/ChatTile.dart';
import 'package:image_picker/image_picker.dart';

class GroupTitle extends StatelessWidget {
  const GroupTitle({super.key});

  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());
    RxBool isEdit = false.obs;
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());
    RxString imagePath = "".obs;
    RxString groupName = "".obs;

    return Scaffold(
      appBar: AppBar(
        title: Text("New Group"),
      ),
      floatingActionButton:
      Obx(
            () => FloatingActionButton(
          backgroundColor: groupName.isEmpty
              ? Colors.grey
              : Theme.of(context).colorScheme.primary,
          onPressed: () {
            if (groupName.isEmpty) {
              Get.snackbar("Error", "Please enter Group Name");
            } else {
              groupController.createGroup(groupName.value, imagePath.value);
            }
          },
          child:groupController.isLoading.value
              ? const CircularProgressIndicator(color: Colors.white,)
              : Icon(
            Icons.done,
            color: groupName.isEmpty ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),



      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Obx(
                        () => InkWell(
                          onTap: () async {
                            imagePath.value = await imagePickerController
                                .pickImage(ImageSource.gallery);
                          },
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: imagePath.value == ""
                                ? Icon(
                                    Icons.group,
                                    size: 40,
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.file(
                                      File(imagePath.value),
                                      fit: BoxFit.cover,
                                    )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          groupName.value = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Group Name",
                          prefixIcon: Icon(Icons.groups),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: groupController.groupMembers
                    .map(
                      (e) => ChatTile(
                        imageUrl:
                            e.profileImage ?? AssetsImage.defaultProfileUrl,
                        name: e.name!,
                        lastChat: e.about ?? "",
                        lastTime: "",
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
