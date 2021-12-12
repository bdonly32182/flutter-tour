import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateProductItems extends StatefulWidget {
  final String? productName;
  final String? productId;
  final String? typeProduct;
  CreateProductItems(
      {Key? key,
      required this.productId,
      required this.productName,
      required this.typeProduct})
      : super(key: key);

  @override
  _CreateProductItemsState createState() => _CreateProductItemsState();
}

class _CreateProductItemsState extends State<CreateProductItems> {
  final ImagePicker _picker = ImagePicker();
  TextEditingController _itemName = TextEditingController();
  TextEditingController _itemPrice = TextEditingController();
  TextEditingController _itemDescription = TextEditingController();
  bool focusDescription = false;
  bool focusName = false;
  bool focusPrice = false;
  File? image_selected;
  getImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        image_selected = File(image.path);
      });
    }
  }

  takePhoto() async {
    XFile? take_photo = await _picker.pickImage(source: ImageSource.camera);
    if (take_photo != null) {
      setState(() {
        image_selected = File(take_photo.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('สร้างข้อมูลสินค้า'),
        backgroundColor: Colors.tealAccent[700],
      ),
      body: Form(
        child: ListView(
          children: [
            fieldItemName(width),
            fieldPrice(width),
            fieldDescription(width),
            SizedBox(height: 35),
            buildPhoto(width),
          ],
        ),
      ),
    );
  }

  Row buildPhoto(double width) {
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
                        color: Colors.white,
                        size: 60,
                      ),
                      Text(
                        'รูปภาพสำหรับหน้าปกสินค้า',
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
                      blurRadius: image_selected != null ? 15 : 0,
                      color: image_selected != null
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

  Row fieldPrice(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: width * .7,
            height: 60,
            child: TextFormField(
              controller: _itemPrice,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusPrice = false;
                }
                if (text.length >= 1) {
                  focusPrice = true;
                }
              }),
              validator: (value) {
                if (value!.isEmpty) return 'กรุณากรอกเบอร์โทรศัพท์';
                return null;
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ราคา :',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefix: Icon(
                    Icons.phone_in_talk_sharp,
                    color:
                        focusPrice ? Colors.tealAccent[700] : Colors.grey[500],
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
                  fontWeight: focusPrice ? FontWeight.w700 : FontWeight.normal),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusName ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
      ],
    );
  }

  Row fieldItemName(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 30),
            width: width * .7,
            height: 60,
            child: TextFormField(
              controller: _itemName,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusName = false;
                }
                if (text.length >= 1) {
                  focusName = true;
                }
              }),
              validator: (value) {
                if (value!.isEmpty) return 'กรุณากรอกเบอร์โทรศัพท์';
                return null;
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ชื่อสินค้า :',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefix: Icon(
                    Icons.phone_in_talk_sharp,
                    color:
                        focusName ? Colors.tealAccent[700] : Colors.grey[500],
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
                  fontWeight: focusName ? FontWeight.w700 : FontWeight.normal),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusName ? Colors.black26 : Colors.white,
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
          width: width * .7,
          child: TextFormField(
            maxLines: 2,
            controller: _itemDescription,
            onChanged: (text) => setState(() {
              if (text.isEmpty) {
                focusDescription = false;
              }
              if (text.length >= 1) {
                focusDescription = true;
              }
            }),
            validator: (value) {
              if (value!.isEmpty) return 'กรุณากรอกที่อยู่';
              return null;
            },
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'รายละเอียดสินค้า',
                labelStyle: TextStyle(color: Colors.grey[600]),
                prefix: Icon(
                  Icons.location_on,
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
        )
      ],
    );
  }
}
