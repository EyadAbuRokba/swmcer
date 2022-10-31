import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:swmc/models/user.dart';

class UserSharedPreferencesController {
  static final UserSharedPreferencesController _instance =
      UserSharedPreferencesController._();
  late final SharedPreferences _sharedPreferences;

  factory UserSharedPreferencesController() {
    return _instance;
  }

  UserSharedPreferencesController._();

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // Future save(User user) async {
  //   await _sharedPreferences.setBool('logged_in', true);
  //   await _sharedPreferences.setInt('id', user.id);
  //   await _sharedPreferences.setString('name', user.name);
  //   await _sharedPreferences.setString('id_name', user.idNumber);
  //   await _sharedPreferences.setString('photo', user.photo);
  //   await _sharedPreferences.setString('address', user.address);
  //   await _sharedPreferences.setString('token', "Bearer ${user.token}");
  // }
 Future<void> SaveToken (token)async{
    await _sharedPreferences.setString('token', 'Bearer ${token}');
 }
 String get GetToken => _sharedPreferences.getString('token') ?? '';
  Future saveUser(User user) async {
    await _sharedPreferences.setString('user', jsonEncode(user.toJson()));
  }

  User? getUser() {
    return User.fromJson(
        jsonDecode(_sharedPreferences.getString('user') ?? ''));
  }

  Future setIsLoggedIn(bool isLoggedIn) async {
    await _sharedPreferences.setBool('logged_in', isLoggedIn);
  }

  bool get isloggedIn {
    return _sharedPreferences.getBool('logged_in') ?? false;
  }

  String get user => _sharedPreferences.getString('user') ?? '';

  Future<bool> removeEmail() async {
    return await _sharedPreferences.remove('user');
  }

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }

  String getToken() {
    String token = _sharedPreferences.getString('token') ?? '';
    return 'Bearer $token';
  }

  // bool get loggedIn => _sharedPreferences.getBool('logged_in') ?? false;

  Future<bool> logout() async {
    return await _sharedPreferences.clear();
  }
}
