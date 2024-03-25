import 'package:zapp/Model/ChatModel.dart';
import 'package:zapp/Model/UserModel.dart';

class ChatRoomModel {
  String? id;
  UserModel? sender;
  UserModel? receiver;
  List<ChatModel>? messages;
  int? unReadMessNo;
  String? lastMessage;
  String? lastMessageTimestamp;
  String? timestamp;

  ChatRoomModel({this.id, this.sender, this.receiver, this.messages, this.unReadMessNo, this.lastMessage, this.lastMessageTimestamp, this.timestamp});

  ChatRoomModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["sender"] is Map) {
      sender = json["sender"] == null ? null : UserModel.fromJson(json["sender"]);
    }
    if(json["receiver"] is Map) {
      receiver = json["receiver"] == null ? null : UserModel.fromJson(json["receiver"]);
    }
    if(json["messages"] is List) {
      messages = json["messages"] ?? [];
    }
    if(json["unReadMessNo"] is int) {
      unReadMessNo = json["unReadMessNo"];
    }
    if(json["lastMessage"] is String) {
      lastMessage = json["lastMessage"];
    }
    if(json["lastMessageTimestamp"] is String) {
      lastMessageTimestamp = json["lastMessageTimestamp"];
    }
    if(json["timestamp"] is String) {
      timestamp = json["timestamp"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    if (this.receiver != null) {
      data['receiver'] = this.receiver!.toJson();
    }
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    data['unReadMessNo'] = this.unReadMessNo;
    data['lastMessage'] = this.lastMessage;
    data['lastMessageTimestamp'] = this.lastMessageTimestamp;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
