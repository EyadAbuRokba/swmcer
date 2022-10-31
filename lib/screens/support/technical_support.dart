import 'package:flutter/material.dart';
import 'package:swmc/screens/menu.dart';
import 'package:swmc/utils/size_config.dart';


class TechnicalSupport extends StatefulWidget {
  const TechnicalSupport({Key? key}) : super(key: key);

  @override
  _TechnicalSupportState createState() => _TechnicalSupportState();
}

class _TechnicalSupportState extends State<TechnicalSupport> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            'الدعم الفني ',
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo'),
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
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NavDrawer()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: SizeConfig.scaleHeight(22),
          start: SizeConfig.scaleWidth(16),
          end: SizeConfig.scaleWidth(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: SizeConfig.scaleHeight(112),
                width: SizeConfig.scaleWidth(112),
                child: Container(
                  height: SizeConfig.scaleHeight(65),
                  width: SizeConfig.scaleWidth(65),
                  child: Image.asset(
                    'images/call.png',
                  ),
                ),
              ),
              Text(
                'نحن هنا لمساعدتك',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height:SizeConfig.scaleHeight(50) ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: new BorderRadius.circular(10),
                ),
                // width: 317,
                height: 69,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 10,
                    end: 10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.phone),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        ' رقم للاتصال : ',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(width: SizeConfig.scaleWidth(20),),
                      Text(
                        '0598059982',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height:SizeConfig.scaleHeight(30) ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: new BorderRadius.circular(10),
                ),
                // width: 317,
                height: 69,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 10,
                    end: 10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.email),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'الايميل : ',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(width: SizeConfig.scaleWidth(20),),
                       Text(
                        'king_alooosh@hotmail.com',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Cairo',
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              // Container(
              //   width: double.infinity,
              //   height: 140,
              //   decoration: BoxDecoration(
              //     color: Colors.grey.shade100,
              //     borderRadius: new BorderRadius.circular(10),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsetsDirectional.all(10),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           ':عنوان الاستفسار :',
              //           style: TextStyle(
              //             fontFamily: 'Cairo',
              //             fontSize: 13,
              //           ),
              //         ),
              //         TextField(
              //           maxLines: 2,
              //           decoration: InputDecoration(
              //             hintText: ' كتابة نص العنوان',
              //             hintStyle: TextStyle(
              //               fontFamily: 'Cairo',
              //               fontSize: 11,
              //               color: Color(0xFF707070),
              //             ),
              //             enabledBorder: OutlineInputBorder(
              //               borderSide: BorderSide(
              //                 color: Colors.grey.shade100,
              //               ),
              //             ),
              //             focusedBorder: OutlineInputBorder(
              //               borderSide: BorderSide(
              //                 color: Colors.grey.shade100,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(height: 12),
              // Container(
              //   width: double.infinity,
              //   height: 118,
              //   decoration: BoxDecoration(
              //     color: Colors.grey.shade100,
              //     borderRadius: new BorderRadius.circular(10),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: TextField(
              //       decoration: InputDecoration(
              //         hintText: 'نص الموضوع :',
              //         hintStyle: TextStyle(
              //             fontFamily: 'Cairo',
              //             color: Color(0xFF707070),
              //             fontSize: 13),
              //         enabledBorder: OutlineInputBorder(
              //           borderSide: BorderSide(
              //             color: Colors.grey.shade100,
              //           ),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //           borderSide: BorderSide(
              //             color: Colors.grey.shade100,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {
              //     showDialog(
              //         context: context,
              //         builder: (ctx) => AlertDialog(
              //               titleTextStyle: TextStyle(
              //                   fontWeight: FontWeight.bold,
              //                   color: Colors.black,
              //                   fontSize: 20),
              //               backgroundColor: Colors.white,
              //               shape: RoundedRectangleBorder(
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(20))),
              //               content: Image.asset('images/support.png'),
              //             ));
              //   },
              //   child: Text(
              //     ' ارسال',
              //     style: TextStyle(
              //       fontFamily: 'Cairo',
              //     ),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     primary: Color(0xFF0DBD7D),
              //     minimumSize:
              //         Size(double.infinity, SizeConfig.scaleHeight(53)),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(15),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
