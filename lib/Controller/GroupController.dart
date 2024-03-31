import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:uuid/uuid.dart';
import 'package:zapp/Controller/ProfileController.dart';
import 'package:zapp/Model/GroupModel.dart';

import '../Model/UserModel.dart';
import '../Pages/Home/HomePage.dart';

class GroupController extends GetxController {
  RxList<UserModel> groupMembers = <UserModel>[].obs;
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  var uuid = Uuid();
  RxBool isLoading = false.obs;
  ProfileController profileController = Get.put(ProfileController());

  void selectMembers(UserModel user) {
    if (groupMembers.contains(user)) {
      groupMembers.remove(user);
    } else {
      groupMembers.add(user);
    }
  }

  Future<void> createGroup(String groupName, String imagePath) async {
    isLoading.value = true;
    String groupId = uuid.v6();
    try {
      String imageUrl = await profileController.uploadFileToFirebase(imagePath);
      var newGroup = GroupModel(
        id: groupId,
        name: groupName,
        profileUrl: imageUrl,
        members: groupMembers.toList(),
        createdAt: DateTime.now().toString(),
        createdBy: auth.currentUser!.uid,
        timeStamp: DateTime.now().toString(),
      );

      await db.collection("groups").doc(groupId).set(
        newGroup.toJson(),
      );
      Get.snackbar("Group Created", "Group Created Successfully!");
      Get.offAll(HomePage());
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }
}
