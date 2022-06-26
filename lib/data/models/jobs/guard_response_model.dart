class GuardResponseModel {
  String? status;
  List<Response>? response;

  GuardResponseModel({this.status, this.response});

  GuardResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  String? userid;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  String? password;
  String? address;

  Response(
      {this.userid,
        this.firstname,
        this.lastname,
        this.email,
        this.phone,
        this.password,
        this.address});

  Response.fromJson(Map<String, dynamic> json) {
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
