import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swmc/api/controller/user_api_controller.dart';
import 'package:swmc/models/bn_screen.dart';
import 'package:swmc/models/user.dart';
import 'package:swmc/screens/bottom_navigator/location_screen.dart';
import 'package:swmc/screens/bottom_navigator/person_screen.dart';
import 'package:swmc/screens/bottom_navigator/service_screen.dart';
import 'package:swmc/screens/menu.dart';
import 'package:swmc/utils/size_config.dart';
import '../../api/provider/user_provider.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _title = 'Home';
  int _currentIndex = 0;
  List<BottomNavigationScreen> _bnScreens = <BottomNavigationScreen>[
    BottomNavigationScreen('الرئيسية', HomeScreen()),
    BottomNavigationScreen('تقديم شكوى', MakeComplaint()),
    BottomNavigationScreen('عرض الشكاوي', DropdownButtonExample()),
    BottomNavigationScreen('الملف الشخصي', PersonScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),

      // backgroundColor: Color(0xFFFEFEFE),
      appBar: AppBar(

        toolbarHeight: 60,
        title: Center(
          child: Text(
            _bnScreens.elementAt(_currentIndex).title,
            style: TextStyle(
              fontFamily: 'Cairo',
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Color(0xFFFFFFFF),

        brightness: Brightness.dark,
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            print('Menu Icon');
          },
          // child: Icon(
          //   Icons.search,
          //   color: Colors.black,
          // ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsetsDirectional.only(end: SizeConfig.scaleWidth(16)),
            icon: Icon(
              Icons.menu,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NavDrawer()),
              );
            },
          ),
        ], //لاظهار الساعة والبطارية اذا كان الون غامق
      ),
      body: _bnScreens.elementAt(_currentIndex).widget,

      bottomNavigationBar: Card(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(30),
        //   side: BorderSide(width: 0.5),
        // ),
        child: BottomNavigationBar(
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          fixedColor: Color(0xFF0DBD7D),
          unselectedItemColor: Color(0xFF707070),
          currentIndex: _currentIndex,
          onTap: (int selectedIndex) {
            setState(() {
              _currentIndex = selectedIndex;
            });
            print(selectedIndex);
            switch (selectedIndex) {
              case 0:
                _changeTitle('person');
                break;

              case 1:
                _changeTitle('location');
                break;

              case 2:
                _changeTitle('service');
                break;

              case 3:
                _changeTitle('home');
                break;
            }
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 35,
              ),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.real_estate_agent_outlined,
                size: 35,
              ),
              label: 'service',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.receipt_long_outlined,
                  size: 35,
                ),
                label: 'location'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_outlined,
                size: 35,
              ),
              label: 'person',
            ),
          ],
        ),
      ),
    );
  }

  void _changeTitle(String title) {
    setState(() {
      _title = title;
    });
  }
}
