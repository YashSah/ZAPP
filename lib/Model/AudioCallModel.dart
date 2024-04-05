class AudioCallModel {
  String? id;
  String? callerName;
  String? callerPic;
  String? callerUid;
  String? callerEmail;
  String? receiverName;
  String? receiverPic;
  String? receiverUid;
  String? receiverEmail;
  String? status;

  AudioCallModel(
      {this.id,
        this.callerName,
        this.callerPic,
        this.callerUid,
        this.callerEmail,
        this.receiverName,
        this.receiverPic,
        this.receiverUid,
        this.receiverEmail,
        this.status});

  AudioCallModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    callerName = json['callerName'];
    callerPic = json['callerPic'];
    callerUid = json['callerUid'];
    callerEmail = json['callerEmail'];
    receiverName = json['receiverName'];
    receiverPic = json['receiverPic'];
    receiverUid = json['receiverUid'];
    receiverEmail = json['receiverEmail'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['callerName'] = this.callerName;
    data['callerPic'] = this.callerPic;
    data['callerUid'] = this.callerUid;
    data['callerEmail'] = this.callerEmail;
    data['receiverName'] = this.receiverName;
    data['receiverPic'] = this.receiverPic;
    data['receiverUid'] = this.receiverUid;
    data['receiverEmail'] = this.receiverEmail;
    data['status'] = this.status;
    return data;
  }
}
