import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:swmc/api/controller/user_api_controller.dart';
import 'package:swmc/api/provider/user_provider.dart';
import 'package:swmc/utils/size_config.dart';

import '../../utils/helpers.dart';

class Complaint extends StatefulWidget {
  @override
  _ComplaintState createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  XFile? _pickedFile;
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF0DBD7D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            'الشكاوي و الاقتراحات',
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
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: 28,
        ),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(30),
              topRight: const Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  top: 70, start: 29, end: 29, bottom: 56),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'الرجاء قم بتعبئة الطلب :',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: new BorderRadius.circular(10),
                    ),
                    // width: 317,
                    height: 75,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.category_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                'القسم:',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'بلدية غزة',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.expand_more),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: new BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'عنوان الشكوى:',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13,
                            ),
                          ),
                          TextField(
                            maxLines: 2,
                            controller: titleController,
                            decoration: InputDecoration(
                              hintText: '..اكتب عنوان الشركة هنا',
                              hintStyle: TextStyle(
                                fontFamily: 'Cairo',
                                color: Color(0xFF707070),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade100,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade100,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    height: 170,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: new BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: detailsController,
                        decoration: InputDecoration(
                          hintText: '   وصف الشكوى',
                          hintStyle: TextStyle(
                              fontFamily: 'Cairo',
                              color: Color(0xFF707070),
                              fontSize: 13),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade100,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade100,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
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
                                      //onPrimary: Colors.black,
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
                                            color: Color(0xFF707070),
                                          ),
                                          SizedBox(
                                            width: SizeConfig.scaleWidth(10),
                                          ),
                                          Text(
                                            'التصوير من خلال الكاميرا',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'Cairo',
                                              color: Color(0xFF707070),
                                            ),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            size: 12,
                                            color: Color(0xFF707070),
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
                                      // backgroundColor: Colors.grey.shade100,
                                      onPrimary: Colors.black,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(17),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.photo_camera_back,
                                            color: Color(0xFF707070),
                                          ),
                                          SizedBox(
                                            width: SizeConfig.scaleWidth(10),
                                          ),
                                          Text(
                                            ' من خلال الاستديو',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'Cairo',
                                              color: Color(0xFF707070),
                                            ),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            size: 12,
                                            color: Color(0xFF707070),
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
                            color: Color(0xFF0DBD7D),
                          ),
                          SizedBox(
                            width: SizeConfig.scaleWidth(7),
                          ),
                          Text(
                            'ارفاق ملفات',
                            style: TextStyle(
                              color: Color(0xFF0DBD7D),
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
                        // backgroundColor: Colors.grey.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: () async {
                      if (checkData()) {
                    await UserApiController()
                            .sendProblem(
                      title: titleController.text,
                                admin_id: "2",
                                  cat: "2",
                                content: "TestTest3001",
                                imagePath: _pickedFile!.path,
                                number_call: "059000000000",
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
      setState(() {});
    }
  }

  Future<void> uploadImage() async {
    // final _pickedFile = await _picker.getImage(source:ImageSource.camera );
    _pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    // print("aaawqqweqwewqewqewqeqweqweqweqwe" + _pickedFile!.path ?? '');
    if (_pickedFile != null) {
      setState(() {});
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
