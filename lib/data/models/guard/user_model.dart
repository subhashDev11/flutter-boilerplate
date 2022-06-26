class UserResponseModel {
  String? status;
  List<User>? response;

  UserResponseModel({this.status, this.response});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['response'] != null) {
      response = <User>[];
      json['response'].forEach((v) {
        response!.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? userid;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  String? password;
  String? address;

  User(
      {this.userid,
        this.firstname,
        this.lastname,
        this.email,
        this.phone,
        this.password,
        this.address});

  User.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userid'] = userid;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['address'] = address;
    return data;
  }
}
