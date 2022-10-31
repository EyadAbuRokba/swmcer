import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swmc/api/controller/user_api_controller.dart';
import 'package:swmc/models/model_cities.dart';

import '../../models/user.dart';
import '../../preferences/user_preferences.dart';
import '../../utils/helpers.dart';

class UserProvider extends ChangeNotifier {
  User? user;
  UserApiController controller = UserApiController();
  List<String> citis_name = [];
  List<String> citis_id = [];
  Future<void> getMuns(context)async{
   List<Muns> list = (await controller.getMun(context))!;
   list.forEach((element) {
     citis_name.add(element.name);
     citis_id.add(element.id.toString());
   });
  notifyListeners();
  }
  Future<void> login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    User? tempUser = await controller.login(context, email, password);
    if (tempUser != null) {
      user = tempUser;
      UserSharedPreferencesController().saveUser(tempUser);
      await UserSharedPreferencesController().setIsLoggedIn(true);
      Helpers.showSnacKBar(context: context, message: 'تم التسجيل بنجاح');
      notifyListeners();
      Navigator.pushReplacementNamed(context, '/main_screen');
    }
  }

  Future<void> logout() async {
    await controller.logout();
    user = null;
    UserSharedPreferencesController().setIsLoggedIn(false);
    notifyListeners();
  }

  Future<void> readUserFromSharedPreferences() async {
    user = UserSharedPreferencesController().getUser();
    notifyListeners();
  }
}
