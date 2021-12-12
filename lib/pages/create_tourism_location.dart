import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateTourismLocation extends StatefulWidget {
  CreateTourismLocation({Key? key}) : super(key: key);

  @override
  _CreateTourismLocationState createState() => _CreateTourismLocationState();
}

class _CreateTourismLocationState extends State<CreateTourismLocation> {
  final ImagePicker imagePicker = ImagePicker();
  TextEditingController placeName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController address = TextEditingController();
  bool focusPlaceName = false;
  bool focusDescription = false;
  bool focusAddress = false;
  List<File> image_selected = [];

  void getImage() async {
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        image_selected.add(File(image.path));
      });
    }
  }

  void takePhoto() async {
    final XFile? photo =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        image_selected.add(File(photo.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[700],
        title: Text('สร้างข้อมูลแหล่งท่องเที่ยว'),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              fieldPlaceName(width),
              fieldDescription(width),
              fieldAddress(width),
              SizedBox(
                height: 30,
              ),
              buildImage(width),
            ],
          ),
        ),
      ),
    );
  }

  Row buildImage(double width) {
    return Row(
      children: [
        Container(
          height: 15,
          width: width * .2,
          child: IconButton(
            onPressed: getImage,
            icon: Icon(Icons.photo_library_outlined),
          ),
        ),
        Container(
            width: width * .6,
            height: 220,
            child: image_selected.length > 0
                ? Swiper(
                    itemCount: image_selected.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.file(
                        image_selected[index],
                        fit: BoxFit.cover,
                      );
                    },
                    pagination: SwiperPagination(),
                    control: SwiperControl(color: Colors.tealAccent[700]),
                    viewportFraction: 0.8,
                    scale: 0.8,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.image,
                        color: Colors.white,
                        size: 60,
                      ),
                      Text(
                        'รูปภาพสำหรับหน้าปกร้าน',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      blurRadius: image_selected.length > 0 ? 15 : 0,
                      color: image_selected.length > 0
                          ? Colors.black54
                          : Colors.deepPurple.shade100,
                      offset: const Offset(0, 5))
                ])),
        Container(
          height: 15,
          width: width * .2,
          child: IconButton(
            onPressed: takePhoto,
            icon: Icon(Icons.camera_alt_outlined),
          ),
        )
      ],
    );
  }

  Row fieldAddress(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: width * .8,
            height: 60,
            child: TextFormField(
              maxLines: 3,
              controller: address,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusAddress = false;
                }
                if (text.length >= 1) {
                  focusAddress = true;
                }
              }),
              validator: (value) {
                if (value!.isEmpty)
                  return 'กรุณากรอกที่อยู่ของสถานที่ท่องเที่ยว';
                return null;
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ที่อยู่ของสถานที่ท่องเที่ยว :',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: Icon(
                    Icons.location_pin,
                    color: focusAddress
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
                      focusAddress ? FontWeight.w700 : FontWeight.normal),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusAddress ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
      ],
    );
  }

  Row fieldDescription(double width) {
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
                if (value!.isEmpty)
                  return 'กรุณากรอกรายละเอียดสถานที่ท่องเที่ยว';
                return null;
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'รายละเอียดสถานที่ท่องเที่ยว :',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: Icon(
                    Icons.description,
                    color: focusDescription
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

  Row fieldPlaceName(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: width * .8,
            height: 60,
            child: TextFormField(
              controller: placeName,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusPlaceName = false;
                }
                if (text.length >= 1) {
                  focusPlaceName = true;
                }
              }),
              validator: (value) {
                if (value!.isEmpty) return 'กรุณากรอกชื่อสถานที่ท่องเที่ยว';
                return null;
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ชื่อสถานที่ท่องเที่ยว :',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: Icon(
                    Icons.edit_location_sharp,
                    color: focusPlaceName
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
                      focusPlaceName ? FontWeight.w700 : FontWeight.normal),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusPlaceName ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
      ],
    );
  }
}
