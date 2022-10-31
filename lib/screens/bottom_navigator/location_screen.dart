import 'package:flutter/material.dart';

import 'package:swmc/utils/size_config.dart';

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({Key? key}) : super(key: key);

  @override
  _DropdownButtonExampleState createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.all(20),
        child: ListView(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Color(0xFF0CB97A),
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: 15, end: 15, top: 5, bottom: 5),
                            child: Text(
                              ' قيد المتابعة',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsetsDirectional.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.date_range_outlined,
                                color: Color(0xFF0CB97A),
                              ),
                              Text(
                                ' تاريخ الارسال:',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Cairo',
                                ),
                              ),
                              Text(
                                ' 5/11/2022',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Cairo',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.scaleHeight(10),
                    ),
                    Text(
                      ' الموضوع : ',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: SizeConfig.scaleHeight(10),
                    ),
                    Text(
                      'الجهة المختصة',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: SizeConfig.scaleHeight(10),
                    ),
                    Text(
                      ' نص الطلب',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: SizeConfig.scaleHeight(50)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0CB97A),
                        minimumSize:
                            Size(double.infinity, SizeConfig.scaleHeight(53)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  titleTextStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black,
                                    backgroundColor: Colors.white,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                  ),
                                  content: Text(
                                    'الردود',
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ));
                      },
                      child: Text(
                        'الردود',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
