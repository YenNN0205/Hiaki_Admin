class UpdateProfile {
  String? email;
  String? phoneNumber;
  String? address;

  UpdateProfile({ this.email, this.phoneNumber, this.address});

  UpdateProfile.fromJson(Map<String, dynamic> json) {
    email = json['Email'];
    phoneNumber = json['PhoneNumber'];
    address = json['Address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Email'] = this.email;
    data['PhoneNumber'] = this.phoneNumber;
    data['Address'] = this.address;
    return data;
  }
}