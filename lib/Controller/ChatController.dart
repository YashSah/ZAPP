import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:zapp/Controller/ProfileController.dart';
import 'package:zapp/Model/ChatRoomModel.dart';
import 'package:zapp/Model/UserModel.dart';

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


   Future<void> sendMessage(String targetUserId, String message, UserModel targetUser) async {
      isLoading.value = true;
      String chatId = uuid.v6();
      String roomId = getRoomId(targetUserId);
      var newChat = ChatModel(
          id: chatId,
          message: message,
          senderId: auth.currentUser!.uid,
         receiverId: targetUserId,
         senderName: controller.currentUser.value.name,
         timeStamp: DateTime.now().toString(),
      );

      var roomDetails = ChatRoomModel(
         id: roomId,
         lastMessage: message,
         lastMessageTimestamp: DateTime.now().toString(),
         sender: controller.currentUser.value,
         receiver: targetUser,
         timestamp: DateTime.now().toString(),
         unReadMessNo: 0,
      );

      try {
         await db.collection("chats").doc(roomId).set(
            roomDetails.toJson(),
         );
         await db
             .collection("chats")
             .doc(roomId)
             .collection("messages")
             .doc(chatId)
             .set(newChat.toJson(),
         );
      }
      catch(e) {
         print(e);
      }
      isLoading.value = false;
   }



   Stream<List<ChatModel>> getMessages(String targetUserId) {
      String roomId = getRoomId(targetUserId);
      return db
          .collection("chats")
          .doc(roomId)
          .collection("messages")
          .orderBy("timeStamp", descending: true)
          .snapshots()
          .map(
             (snapshot) => snapshot.docs
                 .map((doc) => ChatModel.fromJson(doc.data()),
             ).toList(),
      );
   }

}