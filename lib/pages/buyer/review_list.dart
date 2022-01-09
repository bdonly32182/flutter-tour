import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';

class ReviewList extends StatefulWidget {
  ReviewList({Key? key}) : super(key: key);

  @override
  _ReviewListState createState() => _ReviewListState();
}

class _ReviewListState extends State<ReviewList> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyConstant.backgroudApp,
      appBar: AppBar(
        title: Text('รีวิว'),
        backgroundColor: MyConstant.themeApp,
      ),
      body: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: [
                    buildRowImageAndRating(width),
                    buildTextTitle(width),
                    buildTextDescription(width),
                    buildShowImage(width),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Container buildShowImage(double width) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: width * 1,
      height: 100,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (BuildContext contextImage, int index) {
            return Container(
              margin: EdgeInsets.all(6.0),
              width: width * 0.2,
              child: ShowImage(pathImage: MyConstant.delivery),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 4,
                    offset: Offset(0, 0.8),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Container buildTextDescription(double width) {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      width: width * 1,
      child: Text(
        'description',
        maxLines: 10,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Container buildTextTitle(double width) {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      width: width * 1,
      child: Text(
        'Title',
        maxLines: 2,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Row buildRowImageAndRating(double width) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(8.0),
          width: width * 0.1,
          height: 40,
          child: ShowImage(pathImage: MyConstant.iconUser),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  width: width * 0.5,
                  child: Text('ชื่อผู้ใช้งาน'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  width: width * 0.3,
                  child: Text('d/mm/yyyy'),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 6.0),
              width: width * 0.8,
              height: 20,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext starContext, int index) {
                  return Container(
                    margin: EdgeInsets.all(2.0),
                    width: 16,
                    child: const Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.yellow[700],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
