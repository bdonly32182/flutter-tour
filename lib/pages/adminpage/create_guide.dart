import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';

class CreateGuide extends StatefulWidget {
  CreateGuide({Key? key}) : super(key: key);

  @override
  _CreateGuideState createState() => _CreateGuideState();
}

class _CreateGuideState extends State<CreateGuide> {
  ImagePicker imagePicker = ImagePicker();
  File? profileImage;
  TextEditingController _controllerUsername = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerFirstName = TextEditingController();
  TextEditingController _controllerLastName = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  bool focusUsername = false;
  bool focusPassword = false;
  bool focusFirstName = false;
  bool focusLastName = false;
  bool focusPhone = false;
  bool eyesPassword = true;
  void getImage() async {
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        profileImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('สมัครสมาชิกไกด์'),
        backgroundColor: Colors.tealAccent[700],
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildPickerImage(width),
              fieldUsername(width),
              fieldPassword(width),
              fieldIdentify(width),
              fieldPhone(width),
            ],
          ),
        ),
      ),
    );
  }

  Row fieldPassword(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: width * 0.7,
          child: TextFormField(
            controller: _controllerPassword,
            obscureText: eyesPassword,
            onChanged: (text) => setState(() {
              if (text.isEmpty) {
                focusPassword = false;
              } else {
                focusPassword = true;
              }
            }),
            validator: (value) {
              if (value!.isEmpty) return 'Please fill username';
              return null;
            },
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'รหัสผ่าน :',
                labelStyle: TextStyle(color: Colors.grey[600]),
                suffixIcon: IconButton(
                  icon: eyesPassword
                      ? Icon(Icons.remove_red_eye,
                          color: focusPassword
                              ? Colors.tealAccent[700]
                              : Colors.grey)
                      : Icon(Icons.remove_red_eye_outlined,
                          color: focusPassword
                              ? Colors.tealAccent[700]
                              : Colors.grey),
                  onPressed: () => setState(() {
                    eyesPassword = !eyesPassword;
                  }),
                ),
                prefixIcon: Icon(
                  Icons.lock_outlined,
                  color: focusPassword ? Colors.tealAccent[700] : Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),
                )),
            style: TextStyle(
                color: Colors.tealAccent[700],
                fontWeight:
                    focusPassword ? FontWeight.w900 : FontWeight.normal),
          ),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: focusPassword ? Colors.black26 : Colors.white,
                blurRadius: 20,
                offset: const Offset(0, 8))
          ]),
        )
      ],
    );
  }

  Row fieldPhone(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15),
          width: width * .7,
          child: TextFormField(
            controller: _controllerPhone,
            onChanged: (text) => setState(() {
              if (text.isEmpty) {
                focusPhone = false;
              }
              if (text.length >= 1) {
                focusPhone = true;
              }
            }),
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'เบอร์โทร :',
                labelStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Icon(
                  Icons.phone_android,
                  color: focusPhone ? Colors.tealAccent[700] : Colors.grey[500],
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),
                )),
            style: TextStyle(
                color: Colors.tealAccent[700],
                fontWeight: focusPhone ? FontWeight.w700 : FontWeight.normal),
          ),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: focusPhone ? Colors.black26 : Colors.white,
                blurRadius: 10,
                offset: const Offset(0, 5))
          ]),
        )
      ],
    );
  }

  Row fieldIdentify(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15),
          width: width * .34,
          child: TextFormField(
            controller: _controllerFirstName,
            onChanged: (text) => setState(() {
              if (text.isEmpty) {
                focusFirstName = false;
              }
              if (text.length >= 1) {
                focusFirstName = true;
              }
            }),
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'ชื่อ :',
                labelStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Icon(
                  Icons.person,
                  color: focusFirstName
                      ? Colors.tealAccent[700]
                      : Colors.grey[500],
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),
                )),
            style: TextStyle(
                color: Colors.tealAccent[700],
                fontWeight:
                    focusFirstName ? FontWeight.w700 : FontWeight.normal),
          ),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: focusFirstName ? Colors.black26 : Colors.white,
                blurRadius: 10,
                offset: const Offset(0, 5))
          ]),
        ),
        Container(
          margin: EdgeInsets.only(top: 15, left: 10),
          width: width * .34,
          child: TextFormField(
            controller: _controllerLastName,
            onChanged: (text) => setState(() {
              if (text.isEmpty) {
                focusLastName = false;
              }
              if (text.length >= 1) {
                focusLastName = true;
              }
            }),
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'นามสกุล :',
                labelStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Icon(
                  Icons.person,
                  color:
                      focusLastName ? Colors.tealAccent[700] : Colors.grey[500],
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),
                )),
            style: TextStyle(
                color: Colors.tealAccent[700],
                fontWeight:
                    focusLastName ? FontWeight.w700 : FontWeight.normal),
          ),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: focusLastName ? Colors.black26 : Colors.white,
                blurRadius: 10,
                offset: const Offset(0, 5))
          ]),
        )
      ],
    );
  }

  Row fieldUsername(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: width * .7,
          child: TextFormField(
            controller: _controllerUsername,
            onChanged: (text) => setState(() {
              if (text.isEmpty) {
                focusUsername = false;
              }
              if (text.length >= 1) {
                focusUsername = true;
              }
            }),
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'บัญชีผู้ใช้งาน :',
                labelStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Icon(
                  Icons.person,
                  color:
                      focusUsername ? Colors.tealAccent[700] : Colors.grey[500],
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),
                )),
            style: TextStyle(
                color: Colors.tealAccent[700],
                fontWeight:
                    focusUsername ? FontWeight.w700 : FontWeight.normal),
          ),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: focusUsername ? Colors.black26 : Colors.white,
                blurRadius: 10,
                offset: const Offset(0, 5))
          ]),
        ),
      ],
    );
  }

  Row buildPickerImage(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            onTap: getImage,
            child: Container(
              width: width * .7,
              height: 150,
              margin: EdgeInsets.only(top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (profileImage == null)
                    Icon(
                      Icons.add_a_photo_rounded,
                      size: 80,
                      color: Colors.grey[200],
                    )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      color: Colors.white,
                      offset: const Offset(0, 5))
                ],
                image: profileImage != null
                    ? DecorationImage(
                        image: Image.file(profileImage!).image,
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            )),
      ],
    );
  }
}
