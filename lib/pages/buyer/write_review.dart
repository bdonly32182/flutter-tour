import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';

class WriteReview extends StatefulWidget {
  WriteReview({Key? key}) : super(key: key);

  @override
  _WriteReviewState createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
  ImagePicker _picker = ImagePicker();
  List<File>? selectedImage = [];
  TextEditingController _address = TextEditingController();
  TextEditingController _title = TextEditingController();

  getImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage!.insert(0, File(image.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyConstant.backgroudApp,
      appBar: AppBar(
        backgroundColor: MyConstant.themeApp,
        title: Text('เขียนรีวิว'),
      ),
      body: SafeArea(
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildCardHeader(width),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildFormFieldTitle(width),
                      buildFormFieldMessage(width),
                      buildRating(width),
                      buildGetImage(width),
                      buildUploadImage(width),
                      buildButtonSendReview(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildButtonSendReview() {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        child: Text('ยืนยัน'),
        onPressed: () {
          print('send review');
        },
        style: ElevatedButton.styleFrom(primary: MyConstant.themeApp),
      ),
    );
  }

  Card buildRating(double width) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: width * 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ให้คะแนนการบริการ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            RatingBar.builder(
              allowHalfRating: true,
              itemSize: 30,
              itemBuilder: (BuildContext starContext, int index) {
                return Icon(
                  Icons.star,
                  color: Colors.yellow[800],
                );
              },
              onRatingUpdate: (ratingUpdate) {
                print(ratingUpdate);
              },
            ),
          ],
        ),
      ),
    );
  }

  Container buildUploadImage(double width) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: width * 1,
      height: 120,
      child: selectedImage != null
          ? ListView.builder(
              itemCount: selectedImage!.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext imageContext, int index) {
                return Container(
                  margin: EdgeInsets.all(6.0),
                  width: width * 0.2,
                  child: Image.file(selectedImage![index]),
                );
              },
            )
          : null,
    );
  }

  InkWell buildGetImage(double width) {
    return InkWell(
      onTap: getImage,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        width: width * 0.26,
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'อัปโหลดรูปภาพ',
              style: TextStyle(color: MyConstant.themeApp),
            ),
            Icon(
              Icons.camera_alt,
              color: MyConstant.themeApp,
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: MyConstant.backgroudApp,
        ),
      ),
    );
  }

  Container buildFormFieldTitle(double width) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: width * 1,
      child: TextFormField(
        maxLines: 2,
        controller: _title,
        onChanged: (text) => setState(() {}),
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            labelText: 'หัวข้อ :',
            labelStyle: TextStyle(color: Colors.grey[600]),
            prefixIcon: Icon(
              Icons.description,
              color: MyConstant.themeApp,
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
            color: Colors.tealAccent[700], fontWeight: FontWeight.w700),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
    );
  }

  Container buildFormFieldMessage(double width) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: width * 1,
      child: TextFormField(
        maxLines: 8,
        controller: _address,
        onChanged: (text) => setState(() {}),
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            labelText: 'ข้อความรีวิว :',
            labelStyle: TextStyle(color: Colors.grey[600]),
            prefixIcon: Icon(
              Icons.title,
              color: MyConstant.themeApp,
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
            color: Colors.tealAccent[700], fontWeight: FontWeight.w700),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
    );
  }

  Card buildCardHeader(double width) {
    return Card(
      child: Row(
        children: [
          Container(
            width: width * 0.2,
            child: ShowImage(pathImage: MyConstant.shopImage),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0, 0.8),
                  blurRadius: 4,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8.0),
            width: width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ชื่อร้าน',
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'ชื่อสินค้าชื่อสินค้าชื่อสินค้าชื่อสินค้าชื่อสินค้า',
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
