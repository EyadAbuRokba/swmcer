import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swmc/api/controller/user_api_controller.dart';
import 'package:swmc/api/provider/user_provider.dart';
import 'package:swmc/utils/helpers.dart';
import 'package:swmc/models/user.dart';
import 'package:swmc/preferences/user_preferences.dart';
import 'package:swmc/utils/size_config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // late TapGestureRecognizer _tapGestureRecognizer;
  late TextEditingController _userTextEditingController;
  late TextEditingController _passwordTextEditingController;

  // late String _userError ;
  // late String _passwordError;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _tapGestureRecognizer.onTap = navigateToRegister;
    _userTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    // _tapGestureRecognizer.dispose();
    _userTextEditingController.dispose();
    _passwordTextEditingController.dispose();
  }

  void navigateToRegister() => Navigator.pushNamed(context, '/home_screen');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [

          Container(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Image.asset(
                'images/splash.png',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: SizeConfig.scaleWidth(25),
              end: SizeConfig.scaleWidth(25),
              top: SizeConfig.scaleHeight(70),
              bottom: SizeConfig.scaleHeight(2),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset(
                          'images/logoes.png',
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'أهلاً بك ',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 26,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.scaleHeight(10)),
                  Center(
                    child: Text(
                      ' اضف الايميل لتتمكن من الدخول ',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.scaleHeight(50)),
                  TextField(
                    controller: _userTextEditingController,
                    // maxLength: 9,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'البريد الالكتروني ',
                      hintStyle: TextStyle(
                        fontFamily: 'Cairo',
                        color: Color(0xFF707070),
                      ),
                      prefixIcon: Icon(
                        Icons.person_outline_outlined,
                        size: 28,
                        color: Color(0xFF0CB97A),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.scaleHeight(20)),
                  TextField(
                    controller: _passwordTextEditingController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'كلمة المرور ',
                      hintStyle: TextStyle(
                        fontFamily: 'Cairo',
                        color: Color(0xFF707070),
                      ),
                      prefixIcon: Icon(
                        Icons.vpn_key_outlined,
                        size: 28,
                        color: Color(0xFF0CB97A),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  // SizedBox(height: SizeConfig.scaleHeight(27)),
                  // Text(
                  //   'هل نسيت كلمة المرور؟',
                  //   style: TextStyle(
                  //     fontSize: 12,
                  //     fontFamily: 'Cairo',
                  //   ),
                  // ),
                  SizedBox(height: SizeConfig.scaleHeight(48)),
                  ElevatedButton(
                    onPressed: () => performLogin(),
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0DBD7D),
                      minimumSize:
                          Size(double.infinity, SizeConfig.scaleHeight(53)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.scaleHeight(100)),
                  // Center(
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         'للحصول على كلمة المرور الخاصة بك',
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 14,
                  //           fontFamily: 'Cairo',
                  //         ),
                  //       ),
                  //       TextButton(
                  //         onPressed: () {},
                  //         child: Text(
                  //           'اضغط هنا',
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 14,
                  //             fontFamily: 'Cairo',
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: SizeConfig.scaleHeight(25)),
                  // Center(
                  //   child: Container(
                  //     width: SizeConfig.scaleWidth(126),
                  //     height: SizeConfig.scaleHeight(61),
                  //     child: Image.asset(
                  //       'images/login.png',
                  //     ),
                  //   ),
                  // ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xFF0DBD7D),
                        child: IconButton(
                          icon: Icon(
                            Icons.phone_in_talk_sharp,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xFF0DBD7D),
                        child: IconButton(
                          icon: Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/location');
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_userTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty) {
      return true;
    }
    Helpers.showSnacKBar(context: context,message:'تحقق من الايميل وكلمة المرور',error: true );

    return false;
  }
  // Future login() async {
  //   await UserPreferences().save(user: _userTextEditingController.text);
  //   showMessage('تم تسجيل الدخول بنجاح');
  //
  //   Future.delayed(Duration(seconds: 1), () {
  //     // String route = UserPreferences(). ? '/main_screen' : '/login_screen' ;
  //     Navigator.pushReplacementNamed(context, '/main_screen');
  //   });
  // }

  Future login() async {

await Provider.of<UserProvider>(context,listen: false).login(
    context:   context,
    email:   _userTextEditingController.text,
     password:  _passwordTextEditingController.text,
    );
    // if(  Provider.of<UserProvider>(context,listen: false).user !=null ){
    //   Helpers.showSnacKBar(context: context, message: 'تم التسجيل بنجاحح');
    //    UserSharedPreferencesController().save(user);
    //   Future.delayed(Duration(seconds: 2),(){
    //     Navigator.pushReplacementNamed(context, '/main_screen');
    //   });
    // }

  }

  // void showMessage(String message, {bool error = false}) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       behavior: SnackBarBehavior.floating,
  //       content: Text(
  //         message,
  //         style: TextStyle(
  //           color: Colors.white,
  //         ),
  //       ),
  //       backgroundColor: error ? Colors.red : Colors.green,
  //     ),
  //   );
  // }
}



