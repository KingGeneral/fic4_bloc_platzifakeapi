import 'dart:convert';

// {
//     "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTY4NTYyNjcwMywiZXhwIjoxNjg3MzU0NzAzfQ.GN_JZ5-enyTd-91TYrc950NBvnt5PVyojEllAXCJq28",
//     "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTY4NTYyNjcwMywiZXhwIjoxNjg1NjYyNzAzfQ.y2fFt_E-FM5kF8CHtULoPL7cGFj56DQA4UBZqhjoQns"
// }
class LoginResponseModel {
  final String accessToken;
  final String refreshToken;
  LoginResponseModel({
    required this.accessToken,
    required this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      accessToken: map['access_token'] ?? '',
      refreshToken: map['refresh_token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) =>
      LoginResponseModel.fromMap(json.decode(source));
}
