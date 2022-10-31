import 'package:flutter/material.dart';
import 'package:swmc/screens/menu.dart';
import 'package:swmc/screens/query_screen/invoice_details.dart';
import 'package:swmc/utils/size_config.dart';

class BillingRecord extends StatelessWidget {
  const BillingRecord ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            ' سجل الفواتير ',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Cairo',color: Colors.black),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/main_screen');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsetsDirectional.only(end: SizeConfig.scaleWidth(16)),
            icon: Icon(
              Icons.menu,
              size: 30,
              color: Colors. black,
            ),
            onPressed: () { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>NavDrawer()),
            );},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            top: SizeConfig.scaleHeight(10),
            start: SizeConfig.scaleWidth(16),
            end: SizeConfig.scaleWidth(29),
            bottom: SizeConfig.scaleHeight(52),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.scaleHeight(30),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: (){},
                child: Card(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'خدمات بلدية',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InvoiceDetails()));
                              },
                              icon: Icon(Icons.visibility_outlined),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.scaleHeight(5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'رقم الاشتراك:',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Cairo',
                                  ),
                            ),
                            Text(
                              ' 1285256277',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Cairo',
                                 ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.scaleHeight(10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'تاريخ الفاتورة :',
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
                        SizedBox(
                          height: SizeConfig.scaleHeight(10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'المبلغ المستحق:',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Cairo',
                                  color: Color(0xFF16253E)),
                            ),
                            Text(
                              '120 شيكل',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Cairo',
                                ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.scaleHeight(10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'حالة الدفع :',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Cairo',
                                 ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Color(0xFFFDBD40),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.all(4.0),
                                child: Text(
                                  'غير مسددة',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'Cairo',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(10),
              ),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'فاتورة المياه ',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          InvoiceDetails()));
                            },
                            icon: Icon(Icons.visibility_outlined),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'رقم الاشتراك:',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Cairo',
                                color: Color(0xFF16253E)),
                          ),
                          Text(
                            ' 1285256277',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Cairo',
                                color: Color(0xFF16253E)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.scaleHeight(10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'تاريخ الفاتورة :',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Cairo',
                                color: Color(0xFF16253E)),
                          ),
                          Text(
                            ' 5/11/2022',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Cairo',
                                color: Color(0xFF16253E)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.scaleHeight(10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'المبلغ المستحق:',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Cairo',
                                color: Color(0xFF16253E)),
                          ),
                          Text(
                            '120 شيكل',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Cairo',
                                color: Color(0xFF16253E)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.scaleHeight(10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'حالة الدفع :',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Cairo',
                                color: Color(0xFF16253E)),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Color(0xFF009ED8),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.all(4.0),
                              child: Text(
                                ' مسددة',
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
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(10),
              ),
              Text(
                'تفاصيل آخرى:',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(10),
              ),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ' اجمالي الفواتير:',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Cairo',
                                color: Color(0xFF16253E)),
                          ),
                          Text(
                            ' 3 متبقي',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Cairo',
                                color: Color(0xFF16253E)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.scaleHeight(10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ' اجمالي المسدد:',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Cairo',
                                color: Color(0xFF16253E)),
                          ),
                          Text(
                            ' 2 متبقي',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Cairo',
                                color: Color(0xFF16253E)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.scaleHeight(10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ' اجمالي المتبقي:',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Cairo',
                                color: Color(0xFF16253E)),
                          ),
                          Text(
                            ' 1 متبقي',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Cairo',
                                color: Color(0xFF16253E)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),


    );
  }
}
