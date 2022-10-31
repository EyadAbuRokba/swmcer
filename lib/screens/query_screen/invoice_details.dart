import 'package:flutter/material.dart';
import 'package:swmc/screens/menu.dart';
import 'package:swmc/utils/size_config.dart';

class InvoiceDetails extends StatelessWidget {
  const InvoiceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              '  تفاصيل الفاتورة ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo'),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/query_bills');
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
          ),
          actions: [
            IconButton(
              padding:
                  EdgeInsetsDirectional.only(end: SizeConfig.scaleWidth(16)),
              icon: Icon(
                Icons.menu,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>NavDrawer()),
                );
              },            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: SizeConfig.scaleHeight(30),
                    width: SizeConfig.scaleWidth(30),
                    child: Image.asset('images/Es.png'),
                  ),
                  Text(
                    'تفاصيل الفاتورة',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0CB97A),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(20),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'اسم المشترك:',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Cairo',
                          color: Color(0xFF555555),
                        ),
                      ),
                      Text(
                        'احمد فوزي شرف ',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Cairo',
                          color: Color(0xFF555555),
                        ),
                      ),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Color(0xFFF0F0F0),
                    width: 1,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(10),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'رقم المشترك:',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Cairo',
                          color: Color(0xFF555555),
                        ),
                      ),
                      Text(
                        '221555694',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Cairo',
                          color: Color(0xFF555555),
                        ),
                      ),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Color(0xFFF0F0F0),
                    width: 1,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(10),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(12),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.date_range_outlined),
                      Text(
                        'اسم المشترك:',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Cairo',
                          color: Color(0xFF555555),
                        ),
                      ),
                      Spacer(),
                      Text(
                        '5/17/2022',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Cairo',
                          color: Color(0xFF555555),
                        ),
                      ),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Color(0xFFF0F0F0),
                    width: 1,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(25),
              ),
              Container(
                height: SizeConfig.scaleHeight(125),
                width: double.infinity,
                color: Color(0xFFF0F0F0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'اخر موعد للسداد',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Cairo',
                              color: Color(0xFF555555),
                            ),
                          ),
                          Text(
                            '6/17/2022',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Cairo',
                              color: Color(0xFF0CB97A),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Color(0xFF707070),
                        height: 10,
                        thickness: 1,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'اخر موعد للسداد',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Cairo',
                              color: Color(0xFF555555),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Color(0xFFFDBD40),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.all(2.0),
                              child: Text(
                                'غير مسددة',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: 'Cairo',
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Divider(
                        color: Color(0xFF707070),
                        height: 10,
                        thickness: 0.1,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'اخر موعد للسداد',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Cairo',
                              color: Color(0xFF555555),
                            ),
                          ),
                          Text(
                            '250 شيكل',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Cairo',
                              color: Color(0xFF0CB97A),
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
        ));
  }
}
