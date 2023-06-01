// import http
import 'dart:convert';

import 'package:fic_akatalog_final/data/localsources/auth_local_storage.dart';
import 'package:fic_akatalog_final/data/models/request/login_model.dart';
import 'package:fic_akatalog_final/data/models/request/register_model.dart';
import 'package:fic_akatalog_final/data/models/response/login_response_model.dart';
import 'package:fic_akatalog_final/data/models/response/profile_response_model.dart';
import 'package:fic_akatalog_final/data/models/response/register_response_model.dart';
import 'package:http/http.dart' as http;

class AuthDatasources {
  // future reguisterresponsemodel
  Future<RegisterResponseModel> register(RegisterModel registerModel) async {
    final response = await http.post(
      Uri.parse('https://api.escuelajs.co/api/v1/users/'),
      // headers: <String, String>{
      //   'Content-Type': 'application/json',
      // },
      // headers: {'Content-Type': 'application/json'},
      body: registerModel.toMap(),
    );

    final result = RegisterResponseModel.fromJson(response.body);
    return result;
  }

  // function future login , need email password
  Future<LoginResponseModel> login(LoginModel loginModel) async {
    final response = await http.post(
      Uri.parse('https://api.escuelajs.co/api/v1/auth/login'),
      body: loginModel.toMap(),
    );

    final result = LoginResponseModel.fromJson(response.body);
    return result;
  }

  Future<ProfileResponseModel> getProfile() async {
    final token = await AuthLocalStorage().getToken();
    var headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(
      Uri.parse('https://api.escuelajs.co/api/v1/auth/profile'),
      headers: headers,
    );

    final result = ProfileResponseModel.fromJson(jsonDecode(response.body));
    return result;
  }
}
