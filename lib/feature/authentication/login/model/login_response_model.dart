import 'dart:convert';

class LoginResponseModel {
  String? token;

  LoginResponseModel({this.token});

  factory LoginResponseModel.fromRawJson(String str) =>
      LoginResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(token: json["token"]);

  Map<String, dynamic> toJson() => {"token": token};
}
