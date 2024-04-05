import 'package:zapp/Model/UserModel.dart';

class GroupModel {
  String? id;
  String? name;
  String? description;
  String? profileUrl;
  List<UserModel>? members;
  String? createdAt;
  String? createdBy;
  String? status;
  String? lastMessage;
  String? lastMessageTime;
  String? lastMessageBy;
  int? unReadCount;
  String? timeStamp;

  GroupModel(
      {this.id,
        this.name,
        this.description,
        this.profileUrl,
        this.members,
        this.createdAt,
        this.createdBy,
        this.status,
        this.lastMessage,
        this.lastMessageTime,
        this.lastMessageBy,
        this.unReadCount,
        this.timeStamp});

  GroupModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["profileUrl"] is String) {
      profileUrl = json["profileUrl"];
    }
    if(json["members"] != null) {
      members = List<UserModel>.from(
        json["members"].map((memberJson) => UserModel.fromJson(memberJson)),
      );
    } else {
      members = [];
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["lastMessage"] is String) {
      lastMessage = json["lastMessage"];
    }
    if(json["lastMessageTime"] is String) {
      lastMessageTime = json["lastMessageTime"];
    }
    if(json["lastMessageBy"] is String) {
      lastMessageBy = json["lastMessageBy"];
    }
    if(json["unReadCount"] is int) {
      unReadCount = json["unReadCount"];
    }
    if(json["timeStamp"] is String) {
      timeStamp = json["timeStamp"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['profileUrl'] = this.profileUrl;
    if (this.members != null) {
      data['members'] = this.members!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['createdBy'] = this.createdBy;
    data['status'] = this.status;
    data['lastMessage'] = this.lastMessage;
    data['lastMessageTime'] = this.lastMessageTime;
    data['lastMessageBy'] = this.lastMessageBy;
    data['unReadCount'] = this.unReadCount;
    data['timeStamp'] = this.timeStamp;
    return data;
  }
}
