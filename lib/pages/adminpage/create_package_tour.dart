import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tour_app/utils/my_constant.dart';

class CreatePackageTour extends StatefulWidget {
  CreatePackageTour({Key? key}) : super(key: key);

  @override
  _CreatePackageTourState createState() => _CreatePackageTourState();
}

class _CreatePackageTourState extends State<CreatePackageTour> {
  final ImagePicker _picker = ImagePicker();
  File? image_selected;
  String? selected_file_name;
  TextEditingController packageName = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController searchGuide = TextEditingController();
  TextEditingController searchLocation = TextEditingController();
  TextEditingController searchResoirt = TextEditingController();
  bool focusPackageName = false;
  bool focusPrice = false;
  bool focusDescription = false;
  bool focusSearchGuide = false;
  bool focusSearchLocation = false;
  bool focusSearchResort = false;

  void getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        image_selected = File(image.path);
      });
    }
  }

  void takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        image_selected = File(photo.path);
      });
    }
  }

  void getPdf() async {
    FilePickerResult? pdf = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpeg'],
    );
    if (pdf != null) {
      setState(() {
        selected_file_name = pdf.names[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyConstant.backgroudApp,
      appBar: AppBar(
        title: Text('สร้างแพ็คเกจทัวร์'),
        backgroundColor: MyConstant.themeApp,
      ),
      body: Form(
        child: ListView(
          children: [
            fieldPackageName(width),
            fieldPriceAdult(width),
            fieldPriceSenior(width),
            fieldPriceYouth(width),
            fieldDrescription(width),
            fieldSearchGuide(width),
            fieldSearchLocation(width),
            fieldSearchResort(width),
            SizedBox(height: 20),
            buildPickerImage(width),
            selectPdfAndDetail(),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Column selectPdfAndDetail() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30),
          child: Text('รายละเอียดเพิ่มเติม',
              style: TextStyle(
                color: MyConstant.themeApp,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: selected_file_name == null
              ? ElevatedButton(
                  child: Text('เลือกไฟล์ pdf'),
                  onPressed: getPdf,
                )
              : Text(
                  'ชื่อไฟล์ : $selected_file_name',
                  style: TextStyle(
                      color: MyConstant.themeApp, fontWeight: FontWeight.w700),
                ),
        ),
        Column(
          children: [
            Container(
              child: Text(
                'รายชื่อไกด์',
                style: TextStyle(
                    color: MyConstant.themeApp, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        )
      ],
    );
  }

  Row buildPickerImage(double width) {
    return Row(
      children: [
        Container(
          height: 15,
          width: width * .2,
          child: IconButton(
            onPressed: getImage,
            icon: Icon(
              Icons.photo_library_rounded,
              color: MyConstant.themeApp,
              size: 40,
            ),
          ),
        ),
        Container(
            width: width * .6,
            height: 150,
            child: image_selected != null
                ? Image.file(
                    image_selected!,
                    fit: BoxFit.cover,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.image,
                        color: Color.fromRGBO(41, 187, 137, 0.7),
                        size: 60,
                      )
                    ],
                  ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0, 5),
                  ),
                ])),
        Container(
          height: 15,
          width: width * .2,
          child: IconButton(
            onPressed: takePhoto,
            icon: Icon(
              Icons.camera_alt_rounded,
              color: MyConstant.themeApp,
              size: 40,
            ),
          ),
        )
      ],
    );
  }

  Row fieldSearchResort(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: width * .8,
            height: 60,
            child: TextFormField(
              controller: searchResoirt,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusSearchResort = false;
                }
                if (text.length >= 1) {
                  focusSearchResort = true;
                }
              }),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ค้นหาบ้านพัก :',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  suffixIcon: Icon(
                    Icons.search,
                    color: focusSearchResort
                        ? MyConstant.themeApp
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
                  color: MyConstant.themeApp,
                  fontWeight:
                      focusSearchResort ? FontWeight.w700 : FontWeight.normal),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusSearchResort ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
      ],
    );
  }

  Row fieldSearchLocation(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: width * .8,
            height: 60,
            child: TextFormField(
              controller: searchLocation,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusSearchLocation = false;
                }
                if (text.length >= 1) {
                  focusSearchLocation = true;
                }
              }),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ค้นหาแหล่งท่องเที่ยว ',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  suffixIcon: Icon(
                    Icons.search,
                    color: focusSearchLocation
                        ? MyConstant.themeApp
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
                  color: MyConstant.themeApp,
                  fontWeight: focusSearchLocation
                      ? FontWeight.w700
                      : FontWeight.normal),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusSearchLocation ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
      ],
    );
  }

  Row fieldSearchGuide(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: width * .8,
            height: 60,
            child: TextFormField(
              controller: searchGuide,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusSearchGuide = false;
                }
                if (text.length >= 1) {
                  focusSearchGuide = true;
                }
              }),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ค้นหาไกด์นำเที่ยว ',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  suffixIcon: Icon(
                    Icons.search,
                    color: focusSearchGuide
                        ? MyConstant.themeApp
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
                  color: MyConstant.themeApp,
                  fontWeight:
                      focusSearchGuide ? FontWeight.w700 : FontWeight.normal),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusSearchGuide ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
      ],
    );
  }

  Row fieldDrescription(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: width * .8,
            height: 60,
            child: TextFormField(
              controller: description,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusDescription = false;
                }
                if (text.length >= 1) {
                  focusDescription = true;
                }
              }),
              validator: (value) {
                if (value!.isEmpty) return 'กรุณากรอกการแนะนำแพ็คเกจทัวร์';
                return null;
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'แนะนำแพ็คเกจทัวร์ :',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefix: Icon(
                    Icons.phone_in_talk_sharp,
                    color: focusDescription
                        ? MyConstant.themeApp
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
                  color: MyConstant.themeApp,
                  fontWeight:
                      focusDescription ? FontWeight.w700 : FontWeight.normal),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusDescription ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
      ],
    );
  }

  Row fieldPriceAdult(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: width * .8,
            height: 60,
            child: TextFormField(
              controller: price,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusPrice = false;
                }
                if (text.length >= 1) {
                  focusPrice = true;
                }
              }),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ราคาแพ็คเกจทัวร์ของผู้ใหญ่ :',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: Icon(
                    Icons.money,
                    color: focusPrice ? MyConstant.themeApp : Colors.grey[500],
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
                  color: MyConstant.themeApp,
                  fontWeight: focusPrice ? FontWeight.w700 : FontWeight.normal),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusPrice ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
      ],
    );
  }

  Row fieldPriceSenior(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: width * .8,
            height: 60,
            child: TextFormField(
              controller: price,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusPrice = false;
                }
                if (text.length >= 1) {
                  focusPrice = true;
                }
              }),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ราคาแพ็คเกจทัวร์ของผู้สูงอายุ :',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: Icon(
                    Icons.money,
                    color: focusPrice ? MyConstant.themeApp : Colors.grey[500],
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
                  color: MyConstant.themeApp,
                  fontWeight: focusPrice ? FontWeight.w700 : FontWeight.normal),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusPrice ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
      ],
    );
  }

  Row fieldPriceYouth(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: width * .8,
            height: 60,
            child: TextFormField(
              controller: price,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusPrice = false;
                }
                if (text.length >= 1) {
                  focusPrice = true;
                }
              }),
              validator: (value) {
                if (value!.isEmpty) return 'กรุณากรอกราคาแพ็คเกจทัวร์';
                return null;
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ราคาแพ็คเกจทัวร์ของเด็ก :',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: Icon(
                    Icons.money,
                    color: focusPrice ? MyConstant.themeApp : Colors.grey[500],
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
                  color: MyConstant.themeApp,
                  fontWeight: focusPrice ? FontWeight.w700 : FontWeight.normal),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusPrice ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
      ],
    );
  }

  Row fieldPackageName(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: width * .8,
            height: 60,
            child: TextFormField(
              controller: packageName,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusPackageName = false;
                }
                if (text.length >= 1) {
                  focusPackageName = true;
                }
              }),
              validator: (value) {
                if (value!.isEmpty) return 'กรุณากรอกชื่อแพ็คเกจทัวร์';
                return null;
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ชื่อแพ็คเกจทัวร์ :',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefix: Icon(
                    Icons.menu_book,
                    color: focusPackageName
                        ? MyConstant.themeApp
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
                  color: MyConstant.themeApp,
                  fontWeight:
                      focusPackageName ? FontWeight.w700 : FontWeight.normal),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusPackageName ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
      ],
    );
  }
}
