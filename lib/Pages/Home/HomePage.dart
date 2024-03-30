import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zapp/Config/Images.dart';
import 'package:zapp/Controller/ContactController.dart';
import 'package:zapp/Controller/ImagePicker.dart';
import 'package:zapp/Controller/ProfileController.dart';
import 'package:zapp/Pages/Groups/GroupsPage.dart';
import 'package:zapp/Pages/ProfilePage/ProfilePage.dart';

import '../../Config/Strings.dart';
import 'Widgets/ChatsList.dart';
import 'Widgets/TabBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    ProfileController profileController = Get.put(ProfileController());
    ContactController contactController = Get.put(ContactController());
    ImagePickerController imagePickerController = Get.put(ImagePickerController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          AppString.appName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            AssetsImage.appIconSVG,
            width: 10,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // imagePickerController.pickImage();
              contactController.getChatRoomList();
            },
            icon: Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () async{
              await profileController.getUserDetails();
              Get.toNamed("/profilePage");
            },
            icon: Icon(
              Icons.more_vert,
            ),
          ),
        ],
        bottom: myTabBar(tabController, context),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/contactPage");
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: TabBarView(
          controller: tabController,
          children: [
            ChatsList(),
            GroupsPage(),
            ListView(
              children: [
                ListTile(
                  title: Text("Name Yash"),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}
