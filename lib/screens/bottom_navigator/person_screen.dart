import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swmc/utils/size_config.dart';

import '../../api/provider/user_provider.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  _PersonScreenState createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  get percentage => null;

  get width => null;

  var img = AssetImage('images/re.png');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color(0xFF0DBD7D),
          width: double.infinity,
          height: double.infinity,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            top: SizeConfig.scaleHeight(162),
          ),
          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(30),
                  topRight: const Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  top: SizeConfig.scaleHeight(90),
                  start: SizeConfig.scaleWidth(16),
                ),
                child: Consumer<UserProvider>(builder: (context, provider, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'البيانات الشخصية:',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.scaleHeight(25),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: SizeConfig.scaleWidth(30),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.person_outline_outlined),
                                  Text(
                                    ' اسم الشخص:',
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.scaleHeight(20),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(start: 40),
                                child: Text(
                                  provider.user?.name ?? '',
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.scaleHeight(33.5),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.phone_outlined),
                                  Text(
                                    'رقم الهاتف:',
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.scaleHeight(23),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(start: 40),
                                child: Text(
                                  provider.user?.mobile ?? '',
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.scaleHeight(31),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined),
                                  Text(
                                    ' العنوان :',
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.scaleHeight(25),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(start: 40),
                                child: Text(
                                  provider.user?.address ?? '',
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }),
              )),
        ),

        Positioned(
          top: SizeConfig.scaleHeight(96),
          right: SizeConfig.scaleWidth(113),
          bottom: SizeConfig.scaleHeight(400),
          left: SizeConfig.scaleWidth(112),
          child: CircleAvatar(
            radius: 30,
            child: Consumer<UserProvider>(builder: (context, provider, _) {
              return ClipOval(
                child: Image.network(
                  provider.user?.photo ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('images/re.png',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
