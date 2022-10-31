import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:swmc/api/provider/user_provider.dart';
import 'package:swmc/models/user.dart';
import 'package:swmc/preferences/user_preferences.dart';
import 'package:swmc/utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        bool isLoggedIn = UserSharedPreferencesController().isloggedIn;
        String route = isLoggedIn ? '/main_screen' : '/login_screen';
        if (isLoggedIn) {
          Provider.of<UserProvider>(context, listen: false)
              .readUserFromSharedPreferences();
        }

        Navigator.pushNamed(context, route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Image.asset(
                'images/er.jpeg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: SizeConfig.scaleHeight(179),
              start: SizeConfig.scaleWidth(16),
              end: SizeConfig.scaleWidth(16),
              bottom: SizeConfig.scaleHeight(20),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
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
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    CircleAvatar(
                      radius: SizeConfig.scaleWidth(30),
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
                      radius: SizeConfig.scaleWidth(30),
                      backgroundColor: Color(0xFF0DBD7D),
                      child: IconButton(
                        icon: Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
