import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swmc/api/provider/user_provider.dart';
import 'package:swmc/utils/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(viewportFraction: 0.877);

  double currentPage = 0;

  @override
  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.toDouble();
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: SizeConfig.scaleHeight(32),
        start: SizeConfig.scaleWidth(16),
        end: SizeConfig.scaleWidth(16),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   height: 300,
            //   child: PageView(
            //     // controller: PageController(viewportFraction: 0.8),
            //     scrollDirection: Axis.horizontal,
            //     pageSnapping: true,
            //     children: <Widget>[
            //       Container(
            //         height: 158,
            //         width: double.infinity,
            //         child: Image.asset(
            //           'images/splash.png',
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //       Container(
            //         height: 158,
            //         width: double.infinity,
            //         child: Image.asset(
            //           'images/Mask.png',
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //       Container(
            //         height: 158,
            //         width: double.infinity,
            //         child: Image.asset(
            //           'images/eyad.jpeg',
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              height: 300,
              child: PageView(
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 1),
                    width: 350,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/home1.jpeg'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    width: 350,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/home2.jpeg'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    width: 350,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/home3.jpeg'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    width: 350,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/home4.jpeg'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    width: 350,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/home5.jpeg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: 130,
                top: 25,
              ),

              //make dot indicators
              child: Row(
                children: List.generate(
                  5,
                  (index) {
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      alignment: Alignment.centerLeft,
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentPage == index
                            ? Colors.black
                            : Colors.black12,
                      ),
                    );
                  },
                ),
              ),
            ),
            // Container(
            //   height: 158,
            //   width: double.infinity,
            //   child: Image.asset(
            //     'images/splash.png',
            //     fit: BoxFit.cover,
            //   ),
            // ),
            SizedBox(
              height: SizeConfig.scaleHeight(30),
            ),
            Container(
              height: SizeConfig.scaleHeight(116),
              width: SizeConfig.scaleWidth(343),
              color: Color(0xFFEDF1FA),
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  top: SizeConfig.scaleHeight(13),
                  start: SizeConfig.scaleWidth(10),
                  end: SizeConfig.scaleWidth(10),
                  bottom: SizeConfig.scaleHeight(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: SizeConfig.scaleHeight(30),
                      width: SizeConfig.scaleWidth(30),
                      child: Image.asset('images/info1.png'),
                    ),
                    SizedBox(
                      width: SizeConfig.scaleWidth(12),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'تواصل معنا',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'يمكنك التواصل مع الدعم الفني لمساعدتك ',
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/technical_support');
                          },
                          child: Text(
                            ' تواصل الآن',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 12,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF009ED8),
                            minimumSize: Size(SizeConfig.scaleWidth(82),
                                SizeConfig.scaleHeight(28)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
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
              height: SizeConfig.scaleHeight(12),
            ),
            Container(
              height: SizeConfig.scaleHeight(116),
              width: SizeConfig.scaleWidth(343),
              color: Color(0xFFF9F2EA),
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  top: SizeConfig.scaleHeight(13),
                  start: SizeConfig.scaleWidth(10),
                  end: SizeConfig.scaleWidth(14),
                  bottom: SizeConfig.scaleHeight(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: SizeConfig.scaleHeight(30),
                      width: SizeConfig.scaleWidth(30),
                      child: Image.asset('images/info.png'),
                    ),
                    SizedBox(
                      width: SizeConfig.scaleWidth(10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' قدم شكوى',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' يمكنك تقديم شكوتك و سيتم اخذها بعين الأعتبار',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/make_complaint');
                          },
                          child: Text(
                            ' قدم الآن',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 12,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFFF7575),
                            minimumSize: Size(SizeConfig.scaleWidth(82),
                                SizeConfig.scaleHeight(28)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
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
              height: SizeConfig.scaleHeight(20),
            ),
            // Text(
            //   'أحدث الفواتير:',
            //   style: TextStyle(
            //     fontFamily: 'Cairo',
            //   ),
            // ),
            // Center(
            //   child: Container(
            //     height: SizeConfig.scaleHeight(82),
            //     width: SizeConfig.scaleWidth(100),
            //     child: Image.asset('images/Group.png'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
