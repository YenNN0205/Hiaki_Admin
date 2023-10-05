class SupportList {
  String? device;
  String? customer;
  String? phoneNumber;
  String? responsibility;
  String? request;
  String? requestType;
  String? creationDate;
  String? timeSchedule;
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
