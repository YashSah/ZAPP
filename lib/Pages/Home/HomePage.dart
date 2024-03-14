import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zapp/Config/Images.dart';
import 'package:zapp/Controller/ProfileController.dart';
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
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {
              // Get.toNamed("/profilePage");
              Get.to(ProfilePage());
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
            ListView(
              children: [
                ListTile(
                  title: Text("Name Yash"),
                )
              ],
            ),
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
