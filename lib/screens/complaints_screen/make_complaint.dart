import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:swmc/api/controller/user_api_controller.dart';
import 'package:swmc/api/provider/user_provider.dart';
import 'package:swmc/utils/helpers.dart';
import 'package:swmc/utils/size_config.dart';
import 'dart:developer';
class MakeComplaint extends StatefulWidget {
  const MakeComplaint({Key? key}) : super(key: key);

  @override
  _MakeComplaintState createState() => _MakeComplaintState();
}

class _MakeComplaintState extends State<MakeComplaint> {
  String dropdownValueT = ' شكوى';
  String idCities = "0";
  String dropdownValue =
      'مجلس الخدمات المشترك للتخطيط والتطوير في محافظة شمال غزة';

  // final ImagePicker _picker = ImagePicker();


  XFile? _pickedFile;
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController admin_idController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  // final addproblemKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: addproblemKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF0DBD7D),
        elevation: 0,
        title: Text(
          ' تقديم شكوى',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
              color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/request');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            top: SizeConfig.scaleHeight(10),
            start: SizeConfig.scaleWidth(10),
            end: SizeConfig.scaleWidth(10),
            bottom: SizeConfig.scaleHeight(22),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الرجاء قم بتعبئة الطلب :',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(30),
              ),
              Text(
                'الموضوع',
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(10),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.grey.shade100,
              //     borderRadius: new BorderRadius.circular(10),
              //   ),
              //   // width: 317,
              //   height: SizeConfig.scaleHeight(80),
              //
              //   child: Padding(
              //     padding: EdgeInsetsDirectional.only(
              //       top: SizeConfig.scaleHeight(10),
              //       start: SizeConfig.scaleWidth(12),
              //       end: SizeConfig.scaleWidth(12),
              //     ),
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Padding(
              //           padding: EdgeInsetsDirectional.all(20),
              //           child: Container(
              //             height: SizeConfig.scaleHeight(25),
              //             width: SizeConfig.scaleWidth(255),
              //             child: TextField(
              //               controller: titleController,
              //               decoration: InputDecoration(
              //                 hintText: ' اكتب عنوان الموضوع هنا ',
              //                 hintStyle: TextStyle(
              //                     color: Colors.black,
              //                     fontSize: 10,
              //                     fontFamily: 'Cairo'),
              //                 enabledBorder: OutlineInputBorder(
              //                   borderSide: BorderSide(
              //                     color: Colors.grey.shade100,
              //                   ),
              //                 ),
              //                 focusedBorder: OutlineInputBorder(
              //                   borderSide: BorderSide(
              //                     color: Colors.grey.shade100,
              //                   ),
              //                 ),
              //               ),
              //               // onChanged: (value) {
              //               //   setState(() {
              //               //      = value;
              //               //   });
              //               // },
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: ' اكتب عنوان الموضوع هنا ',
                  hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo'),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90),
                    borderSide: BorderSide(
                      color: Color(0xFF0DBD7D),
                     ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90),
                    borderSide: BorderSide(
                      color: Color(0xFF0DBD7D),
                    ),
                  ),
                ),
                // onChanged: (value) {
                //   setState(() {
                //      = value;
                //   });
                // },
              ),
              Text(
                'الجهة المختصة',
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(12),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius:   BorderRadius.circular(90),
                  border: Border.all(
                    color: Color(0xFF0DBD7D),
                  )
                ),
                width: double.infinity,
                height: SizeConfig.scaleHeight(60),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    end: 30,
                    start: 30,
                    top: 20,
                    bottom: 20,
                  ),
                  child: Container(
                      height: SizeConfig.scaleHeight(25),
                      width: SizeConfig.scaleWidth(250),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Cairo'),
                        value: dropdownValue,
                        iconSize: 20,
                        elevation: 16,
                        underline: Container(
                          height: 2,
                        ),
                        onChanged: (value) {
                            setState(() {
                            dropdownValue = value!;
                            idCities = Provider.of<UserProvider>(context,listen: false).citis_id.elementAt(Provider.of<UserProvider>(context,listen: false).citis_name.lastIndexOf(value!));
                            });
                        },
                        items:Provider.of<UserProvider>(context,listen: false).citis_name.map<DropdownMenuItem<String>>((String nvalue) {
                          return DropdownMenuItem<String>(
                            value: nvalue.toString(),
                            child: Text(nvalue),
                          );
                        }).toList(),
                      ),

                  ),
                ),
              ),
              SizedBox(height: SizeConfig.scaleHeight(12)),
              Text(
                ' التصنيف',
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: new BorderRadius.circular(90),
                  border: Border.all(
                    color: Color(0xFF0DBD7D),
                  )
                ),
                width: double.infinity,
                height: SizeConfig.scaleHeight(60),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    end: 30,
                    start: 30,
                    top: 20,
                    bottom: 20,
                  ),
                  child: Container(
                      height: SizeConfig.scaleHeight(25),
                      width: SizeConfig.scaleWidth(250),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Cairo'),
                        value: dropdownValueT,
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(
                          height: 2,
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            dropdownValueT = newValue!;
                          });
                        },
                        items: <String>[
                          ' شكوى',
                          ' اقتراح',
                          ' استفسار',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                ),
              ),
              Text(
                'رقم الاتصال',
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(10),
              ),
              TextField(
                controller: admin_idController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: ' اكتب رقم الاتصال هنا ',
                  hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo'),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90),
                    borderSide: BorderSide(
                      color: Color(0xFF0DBD7D),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90),
                    borderSide: BorderSide(
                      color: Color(0xFF0DBD7D),

                    ),
                  ),
                ),
                // onChanged: (value) {
                //   setState(() {
                //      = value;
                //   });
                // },
              ),
              SizedBox(height: SizeConfig.scaleHeight(12)),
              Text(
                'نص الطلب  ',
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: SizeConfig.scaleHeight(12)),
              TextField(
                controller: detailsController,
                decoration: InputDecoration(
                  hintText: ' اكتب عنوان الموضوع هنا ',
                  hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo'),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90),
                    borderSide: BorderSide(
                      color: Color(0xFF0DBD7D),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90),
                    borderSide: BorderSide(
                      color: Color(0xFF0DBD7D),
                    ),
                  ),
                ),
                // onChanged: (value) {
                //   setState(() {
                //      = value;
                //   });
                // },
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Text(
                'إضافة مرفقات',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: SizeConfig.scaleHeight(60),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Color(0xFF0DBD7D),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        titleTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        content: Container(
                          height: 220,
                          width: 420,
                          child: Column(
                            children: [
                              Text(
                                'اختيار طريقة ارفاق الملفات',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.scaleHeight(30),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // backgroundColor: Colors.grey.shade100,
                                  primary: Color(0xFF0DBD7D),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                  ),

                                ),
                                onPressed: () async {
                                  await pickImage();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(17),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: SizeConfig.scaleWidth(10),
                                      ),
                                      Text(
                                        'التصوير من خلال الكاميرا',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Cairo',
                                          color: Colors.white,
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 12,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.scaleHeight(10),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await uploadImage();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF0DBD7D),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                  ),

                                  // backgroundColor: Colors.grey.shade100,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(17),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.photo_camera_back,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: SizeConfig.scaleWidth(10),
                                      ),
                                      Text(
                                        ' من خلال الاستديو',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Cairo',
                                          color: Colors.white,
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 12,
                                        color: Colors.white,
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
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Icon(
                        Icons.file_copy,
                        // color: Color(0xFF0DBD7D),
                      ),
                      SizedBox(
                        width: SizeConfig.scaleWidth(7),
                      ),
                      Text(
                        'ارفاق ملفات',
                        style: TextStyle(
                          // color: Color(0xFF0DBD7D),
                          fontSize: 13,
                          fontFamily: 'Cairo',
                        ),
                      ),
                      Spacer(),
                      _pickedFile != null
                          ? Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 8.0),
                        child:
                        Image.file(File(_pickedFile?.path ?? '')),
                      )
                          : SizedBox(),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0DBD7D),

                    // backgroundColor: Colors.grey.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.scaleHeight(20)),
              ElevatedButton(
                onPressed: () async {
                  if (checkData()) {
                    await UserApiController()
                        .sendProblem(
                        title: titleController.text,
                        admin_id:idCities ,
                        cat:idCities,
                        content: detailsController.text ,
                        imagePath: _pickedFile!.path,
                        number_call: admin_idController.text,
                        // title: titleController.text,
                        // details: detailsController.text,
                        // image: File(_pickedFile!.path),
                        // token: Provider.of<UserProvider>(context,
                        //             listen: false)
                        //         .user!
                        //         .token ??
                        //     '',
                        context: context);
                    // if (isSendSuccessfully) {
                    //   showDialog(
                    //     context: context,
                    //     builder: (ctx) => AlertDialog(
                    //       titleTextStyle: TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.black,
                    //           fontSize: 20),
                    //       backgroundColor: Colors.white,
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(20))),
                    //       content: Image.asset('images/complaint.png'),
                    //     ),
                    //   );
                    // }
                  }
                },
                child: Text(
                  ' ارسال',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0DBD7D),
                  // backgroundColor: Color(0xFF0DBD7D),
                  minimumSize:
                  Size(double.infinity, SizeConfig.scaleHeight(53)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> pickImage() async {
    // final _pickedFile = await _picker.getImage(source:ImageSource.camera );
    _pickedFile =
    await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    // print("aaaaaaasdasdsadasdsadasdsad" + _pickedFile!.path ?? '');
    if (_pickedFile != null) {
      setState(() {

      });
    }
  }

  Future<void> uploadImage() async {
    // final _pickedFile = await _picker.getImage(source:ImageSource.camera );
    _pickedFile =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    // print("aaawqqweqwewqewqewqeqweqweqweqwe" + _pickedFile!.path ?? '');
    if (_pickedFile != null) {
      setState(() {

      });
    }
  }
   bool checkData() {
    if (titleController.text.isEmpty) {
      Helpers.showSnacKBar(
          context: context, message: 'ادخل عنوان الشكوى', error: true);
      return false;
    } else if (detailsController.text.isEmpty) {
      Helpers.showSnacKBar(
          context: context, message: 'ادخل تفاصيل الشكوى', error: true);
      return false;
    } else if (_pickedFile == null) {
      Helpers.showSnacKBar(
          context: context, message: 'الرجاء ارفاق صورة للشكوى', error: true);
      return false;
    } else {
      return true;
    }
  }
}

// var snackBar = SnackBar(
//   backgroundColor: Colors.white,
//   content: Container(
//     height: 240,
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Text(
//             'اختيار طريقة ارفاق الملفات',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 16,
//               fontFamily: 'Cairo',
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(
//             height: SizeConfig.scaleHeight(30),
//           ),
//           ElevatedButton(
//             onPressed: () {},
//             child: Padding(
//               padding: const EdgeInsets.all(17),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.camera_alt_outlined,
//                     color: Color(0xFF707070),
//                   ),
//                   SizedBox(
//                     width: SizeConfig.scaleWidth(10),
//                   ),
//                   Text(
//                     'التصوير من خلال الكاميرا',
//                     style: TextStyle(
//                       fontSize: 13,
//                       fontFamily: 'Cairo',
//                       color: Color(0xFF707070),
//                     ),
//                   ),
//                   Spacer(),
//                   Icon(
//                     Icons.arrow_forward_ios_sharp,
//                     size: 12,
//                     color: Color(0xFF707070),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: SizeConfig.scaleHeight(10),
//           ),
//           ElevatedButton(
//             onPressed: () {},
//             child: Padding(
//               padding: const EdgeInsets.all(17),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.photo_camera_back,
//                     color: Color(0xFF707070),
//                   ),
//                   SizedBox(
//                     width: SizeConfig.scaleWidth(10),
//                   ),
//                   // Text(
//                   //   'التصوير من خلال الكاميرا',
//                   //   style: TextStyle(
//                   //     fontSize: 13,
//                   //     fontFamily: 'Cairo',
//                   //     color: Color(0xFF707070),
//                   //   ),
//                   // ),
//                   Spacer(),
//                   Icon(
//                     Icons.arrow_forward_ios_sharp,
//                     size: 12,
//                     color: Color(0xFF707070),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
// );
