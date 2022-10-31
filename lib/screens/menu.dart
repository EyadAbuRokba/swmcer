import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swmc/api/provider/user_provider.dart';
import 'package:swmc/preferences/user_preferences.dart';
import 'package:swmc/screens/query_screen/billing_%20record.dart';
import 'package:swmc/utils/size_config.dart';

class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<UserProvider>(builder: (context, provider, _) {
        return ListView(
          // Remove padding
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                provider.user?.name ?? '',
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'Cairo',
                ),
              ),
              accountEmail: Text(
                provider.user?.idNumber ?? '',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 12,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    provider.user?.photo ?? '',
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF0CB97A),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text(
                'الرئيسية',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 15,
                ),
              ),
              onTap: () => {Navigator.of(context).pop()},
            ),
            SizedBox(height: SizeConfig.scaleHeight(10),),
            ListTile(
              leading: Icon(Icons.check_box),
              title: Text(
                'عرض جميع الشكاوي ',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 15,
                ),
              ),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, '/transactions'),
            ),
            SizedBox(height: SizeConfig.scaleHeight(10),),

            // ListTile(
            //   leading: Icon(Icons.receipt_outlined),
            //   title: Text(
            //     'سجل الفواتير',
            //     style: TextStyle(
            //       fontFamily: 'Cairo',
            //       fontSize: 15,
            //     ),
            //   ),
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => BillingRecord(),
            //     ),
            //   ),
            // ),
            // ListTile(
            //   leading: Icon(Icons.access_time),
            //   title: Text(
            //     'تتبع الشكاوي',
            //     style: TextStyle(
            //       fontFamily: 'Cairo',
            //       fontSize: 15,
            //     ),
            //   ),
            // ),
            ListTile(
              leading: Icon(Icons.live_help_outlined),
              title: Text(
                'الدعم الفني ',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 15,
                ),
              ),
              onTap: () =>Navigator.pushNamed(context, '/technical_support'),
            ),

            SizedBox(height: SizeConfig.scaleHeight(10)),
            ListTile(
                title: Text(
                  'تسجيل خروج',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 15,
                  ),
                ),
                leading: Icon(Icons.exit_to_app),
                onTap: () async {
                  Provider.of<UserProvider>(context, listen: false).logout();
                  Navigator.pushReplacementNamed(context, '/login_screen');
                }),
          ],
        );
      }),
    );
  }
}
// Future logout() async {
//   bool loggedOut = await UserApiController().logout();
// }
// Scaffold(
// appBar: AppBar(
// title: Text('بيانات'),
// ),
// body: Consumer<UserProvider>(
// builder: (context, provider, _) {
// return Column(
// children: [
// Text(provider.user?.name??'',style: TextStyle(fontSize: 16),),
// Text(provider.user?.id.toString()??'',style: TextStyle(fontSize: 16),),
// Text(provider.user?.address??'',style: TextStyle(fontSize: 16),),
// Text(provider.user?.mobile??'',style: TextStyle(fontSize: 16),),
// Text(provider.user?.name??'',style: TextStyle(fontSize: 16),),
// // Image.network(provider.user?.photo??''),
// ],
// );
// },
// ),
// );
