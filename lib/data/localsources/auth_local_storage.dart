// import sharedpreferences
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalStorage {
  // tokenKey final
  static const String tokenKey = 'token';

  // save token string
  Future<String> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, token);
    return token;
  }

  // gettoken string
  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    // return must not null tokenKey
    return prefs.getString(tokenKey)!;
  }

  // is token exist bool
  Future<bool> isTokenExist() async {
    final prefs = await SharedPreferences.getInstance();
    // check if not null return bool
    return prefs.getString(tokenKey) != null;
  }

  // remove token bool
  Future<bool> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(tokenKey);
  }
}
