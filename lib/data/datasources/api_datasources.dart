// import http
import 'package:fic_akatalog_final/data/models/request/register_model.dart';
import 'package:fic_akatalog_final/data/models/response/register_response_model.dart';
import 'package:http/http.dart' as http;

class ApiDatasources {
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
}
