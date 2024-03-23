import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:zapp/Controller/ProfileController.dart';

import '../Model/ChatModel.dart';

class ChatController extends GetxController {

   final auth = FirebaseAuth.instance;
   final db = FirebaseFirestore.instance;
   RxBool isLoading = false.obs;
   var uuid = Uuid();
   ProfileController controller = Get.put(ProfileController());


   String getRoomId(String targetUserId) {
      String currentUserId = auth.currentUser!.uid;
      if(currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
         return currentUserId + targetUserId;
      }
      else {
         return targetUserId + currentUserId;
      }
   }


   Future<void> sendMessage(String targetUserId, String message) async {
      isLoading.value = true;
      String chatId = uuid.v6();
      String roomId = getRoomId(targetUserId);
      var newChat = ChatModel(
          id: chatId,
          message: message,
          senderId: auth.currentUser!.uid,
         receiverId: targetUserId,
         senderName: controller.currentUser.value.name,
      );

      try{
         await db
             .collection("chats")
             .doc(roomId)
             .collection("messages")
             .doc(chatId)
             .set(newChat.toJson());
      }
      catch(e) {
         print(e);
      }
      isLoading.value = false;
   }

}