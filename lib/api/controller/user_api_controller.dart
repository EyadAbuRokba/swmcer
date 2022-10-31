import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:swmc/api/api_settings.dart';
import 'package:http/http.dart' as http;
import 'package:swmc/models/model_cities.dart';
import 'package:swmc/models/user.dart';
import 'package:swmc/preferences/user_preferences.dart';
import 'package:swmc/utils/helpers.dart';


class UserApiController with Helpers{
  UserApiController._();

  /// the one and only instance of this singleton
  static final instance = UserApiController._();

  factory UserApiController() {
    return instance;
  }

  Future<User?> login(BuildContext context, String email,
      String password) async {
    print('login : ${ApiSettings.INDEX_USERS}');
    var url = Uri.parse(ApiSettings.INDEX_USERS);
    var response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      var userJsonObject =  jsonDecode(response.body)['object'];
    await  UserSharedPreferencesController().SaveToken(jsonDecode(response.body)['object']['token']);
      return User.fromJson(userJsonObject);
    } else {
      var jsonResponse = jsonDecode(response.body);
      Helpers.showSnacKBar(
        context: context,
        message: jsonResponse['message'],
        error: true,
      );
    }
    return null;
  }

  Future<bool> logout() async {
    var url = Uri.parse(ApiSettings.INDEX_LOGOUT);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader:
      UserSharedPreferencesController().getToken(),
    });
    if (response.statusCode == 200) {
      UserSharedPreferencesController().logout();
    }
    return false;
  }

  // Future<Object> indexUsers() async {
  //   var url = Uri.parse(ApiSettings.INDEX_USERS);
  //   var response = await http.get(url);
  //   print('Response: $response');
  //   if (response.statusCode != 400 || response.statusCode != 500) {
  //     BaseResponse baseResponse =
  //         BaseResponse.fromJson(jsonDecode(response.body));
  //     print('Message: ${baseResponse.message}');
  //     return baseResponse.user;
  //   }
  //   return [];
  // }

  static Future<User> createAlbum(String title,
      String category,
      String importance,
      String content,
      String admin_id,
      String photo_main,) async {
    final response = await http.post(
      Uri.parse(ApiSettings.ADD_PROBLEM),
      headers: <String, String>{
        'Accept': 'application/ecmascript; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'category': category,
        'importance': importance,
        'content': content,
        'admin_id': admin_id,
        'photo_main': photo_main,
      }),
    );

    if (response.statusCode == 201) {
      print('نجح');

      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return User.fromJson(jsonDecode(response.body));
    } else {
      print('خطأ');
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  Future<List<Muns>?> getMun(BuildContext context) async {
    var url = Uri.parse(ApiSettings.GIT_MUN);
     var response = await http.get(url,headers:{"Authorization":await UserSharedPreferencesController().GetToken});
    if (response.statusCode < 400) {
      var jsonResponse = jsonDecode(response.body);
      cities baseResponse = cities.fromJson(jsonResponse);
      return baseResponse.muns;
    } else if (response.statusCode != 500) {
      Helpers.showSnacKBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
    } else {
      Helpers.showSnacKBar(context: context, message: 'يوجد خطأ', error: true);
    }
    return [];
  }

  Future<void> sendProblem({
    required String title,
    required String cat,
    required String content,
    required String admin_id,
    required String number_call,
    required String imagePath,
    required BuildContext context,
  }) async {
    var uri = Uri.parse(ApiSettings.ADD_PROBLEM);
    // var resp = await http.post(uri, body: {
    //   "title": title,
    //   "category": cat,
    //   "content": content,
    //   "admin_id": admin_id,
    //   "number_call": number_call,
    // }, headers: {
    //   HttpHeaders.authorizationHeader:await
    //   UserSharedPreferencesController().GetToken
    // }).then((value) async{
    //
    // });

    var request_Uplode =  http.MultipartRequest('POST', uri);
    var imageFile = await http.MultipartFile.fromPath('photo_main', imagePath);
    request_Uplode.files.add(imageFile);
    request_Uplode.fields.addAll({
      "title":title,
      "category":cat,
      "content":content,
      "admin_id":admin_id,
      "number_call":number_call,
    });
    request_Uplode.headers[HttpHeaders.authorizationHeader] =await
        UserSharedPreferencesController().GetToken;
    request_Uplode.headers[HttpHeaders.acceptHeader] = 'application/json';
    var result = await request_Uplode.send();
    if(result.statusCode == 201){
      var s = await result.stream.transform(utf8.decoder).first;
     Helpers.showSnacKBar(context: context, message: 'تم الرفع بنجاح',error: false);

    }else {
      Helpers.showSnacKBar(context: context, message: 'تفقد الإتصال بالأنترنت',error: true);
      var s = await result.stream
          .transform(utf8.decoder)
          .first;
      var m = jsonDecode(s);
    }
  }
}
