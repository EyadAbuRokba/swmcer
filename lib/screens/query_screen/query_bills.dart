import 'package:flutter/material.dart';
import 'package:swmc/screens/menu.dart';
import 'package:swmc/screens/query_screen/invoice_details.dart';
import 'package:swmc/utils/size_config.dart';

class QueryBills extends StatefulWidget {
  const QueryBills({Key? key}) : super(key: key);

  @override
  _QueryBillsState createState() => _QueryBillsState();
}

class _QueryBillsState extends State<QueryBills> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF0DBD7D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            ' استعلام عن فاتورة ',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/main_screen');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsetsDirectional.only(end: SizeConfig.scaleWidth(16)),
            icon: Icon(
              Icons.menu,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>NavDrawer()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: SizeConfig.scaleHeight(20),
        ),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFFEFEFE),
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(30),
              topRight: const Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                top: SizeConfig.scaleHeight(28),
                start: SizeConfig.scaleWidth(29),
                end: SizeConfig.scaleWidth(29),
                bottom: SizeConfig.scaleHeight(52),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: SizeConfig.scaleHeight(114),
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: SizeConfig.scaleHeight(12),
                        bottom: SizeConfig.scaleHeight(15),
                        start: SizeConfig.scaleWidth(12),
                        end: SizeConfig.scaleWidth(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'تحديد تاريخ الاستعلام',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Cairo',
                            ),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: SizeConfig.scaleHeight(40),
                                width: SizeConfig.scaleWidth(130),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.date_range_outlined),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.scaleWidth(10),
                              ),
                              Container(
                                height: SizeConfig.scaleHeight(40),
                                width: SizeConfig.scaleWidth(130),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.date_range_outlined),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(30),
                  ),
                  Text(
                    'تفاصيل الفاتورة:',
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
        ),
      ),
    );
  }
}
