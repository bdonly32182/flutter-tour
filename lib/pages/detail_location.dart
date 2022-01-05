import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';

class DetailLocation extends StatefulWidget {
  DetailLocation({Key? key}) : super(key: key);

  @override
  _DetailLocationState createState() => _DetailLocationState();
}

class _DetailLocationState extends State<DetailLocation> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyConstant.backgroudApp,
      appBar: AppBar(
        backgroundColor: MyConstant.themeApp,
        title: Text('รายละเอียดแหล่งท่องเที่ยว'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildShowImageLocation(width, height),
              buildCardDetail(),
              Card(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25, left: 10.0),
                        child: Text(
                          'รูปภาพและรีวิว',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  buildShowImageReview(width, height),
                  buildComment(width),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Container buildShowImageReview(double width, double height) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: width * 1,
      height: height * 0.16,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(3.0),
            width: width * 0.22,
            height: 70,
            child: ShowImage(pathImage: MyConstant.delivery),
          );
        },
      ),
    );
  }

  InkWell buildComment(double width) {
    return InkWell(
      onTap: () {
        print('go to read review');
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: width * 1,
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text('อ่านรีวิว (35)'),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
            )
          ],
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 5,
              offset: Offset(0, 0.5),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Card buildCardDetail() {
    return Card(
      child: Column(
        children: [
          buildNameLocation(),
          buildRating(),
          buildAddress(),
          buildNameDescription(),
          buildDescription()
        ],
      ),
    );
  }

  Row buildDescription() {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            style: TextStyle(
              fontSize: 15,
            ),
            maxLines: 15,
            softWrap: true,
          ),
        ),
      ],
    );
  }

  Row buildNameDescription() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'รายละเอียด',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Row buildAddress() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 5.0),
            child: Text(
              '19/19 แสมดำ บางขุนเทียน กทม 10150',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }

  Row buildRating() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Icon(
            Icons.star,
            size: 15,
            color: Colors.yellow[700],
          ),
        ),
        Text('4.2 (30 รีวิว)'),
      ],
    );
  }

  Row buildNameLocation() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'ชื่อสถานที่ท่องเที่ยว',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  Container buildShowImageLocation(double width, double height) {
    return Container(
      width: width * 1,
      height: height * 0.26,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ShowImage(pathImage: MyConstant.locationImage),
            );
          }),
    );
  }
}
