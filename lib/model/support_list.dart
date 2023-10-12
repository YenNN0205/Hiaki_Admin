class SupportList {
  String? device;
  String? customer;
  String? phoneNumber;
  String? responsibility;
  String? request;
  String? requestType;
  String? creationDate;
  DateTime? timeSchedule;
  String? status;
  String? contractID;
  String? maintenanceID;
  String? address;
  List<ChatContent>? chatContent;

  SupportList(
      {this.device,
      this.customer,
      this.phoneNumber,
      this.responsibility,
      this.request,
      this.requestType,
      this.creationDate,
      this.timeSchedule,
      this.status,
      this.contractID,
      this.maintenanceID,
      this.chatContent,
      this.address});
}

class ChatContent {
  String? sender;
  String? role;
  String? content;
  String? date;
  String? rating;

  ChatContent({this.sender, this.role, this.content, this.date, this.rating});
}

class UserProfileModel {
  String? userName;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? address;

  UserProfileModel(
      {this.userName,
      this.fullName,
      this.email,
      this.phoneNumber,
      this.address});
}

class UpdateStatus {
  String? maintenanceID;
  String? status;
  String? content;

  UpdateStatus({this.maintenanceID, this.status, this.content});

  UpdateStatus.fromJson(Map<String, dynamic> json) {
    maintenanceID = json['MaintenanceID'];
    status = json['Status'];
    content = json['Content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MaintenanceID'] = maintenanceID;
    data['Status'] = status;
    data['Content'] = content;
    return data;
  }
}
