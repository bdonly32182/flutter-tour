import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';

class RoomsResort extends StatefulWidget {
  RoomsResort({Key? key}) : super(key: key);

  @override
  _RoomsResortState createState() => _RoomsResortState();
}

class _RoomsResortState extends State<RoomsResort> {
  List<Map<String, dynamic>> rooms = [
    {
      'roomName': 'roomName',
      'bedSize': '2 เตียงควีนไซส์',
      'roomSize': 28,
      'amountCustomer': 4,
      'roomImages': [
        MyConstant.homestayImage,
        MyConstant.locationImage,
        MyConstant.partnerImage
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyConstant.backgroudApp,
      appBar: AppBar(
        backgroundColor: MyConstant.themeApp,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            buildDetailResort(width, height),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'ประเภทห้องพัก',
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListView.builder(
                itemCount: rooms.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext buildContext, int index) {
                  return Card(
                    child: Column(
                      children: [
                        buildSwiperImage(width, height, index),
                        buildBedSize(index),
                        buildBedDetail(index),
                        buildAmoutCustomer(index),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  Row buildBedDetail(int index) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 8),
          child: Icon(Icons.bed),
        ),
        Text(' ${rooms[index]['bedSize']}'),
      ],
    );
  }

  Row buildBedSize(int index) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.meeting_room_rounded),
        ),
        Text(' ${rooms[index]['roomSize']} ตารางเมตร'),
      ],
    );
  }

  Row buildAmoutCustomer(int index) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 8),
          child: Icon(Icons.family_restroom_sharp),
        ),
        Text('เข้าพักได้สูงสุด : ผู้ใหญ่ ${rooms[index]['amountCustomer']} คน'),
      ],
    );
  }

  Container buildSwiperImage(double width, double height, int index) {
    return Container(
      width: width * 1,
      height: height * 0.18,
      child: Swiper(
        itemCount: rooms[index]['roomImages'].length,
        itemBuilder: (BuildContext context, int imageIndex) {
          return ShowImage(pathImage: rooms[index]['roomImages'][imageIndex]);
        },
        pagination: const SwiperPagination(),
        viewportFraction: 0.8,
        scale: 0.8,
      ),
    );
  }

  Container buildDetailResort(double width, double height) {
    return Container(
      width: width * 1,
      height: height * 0.32,
      child: Column(
        children: [
          Container(
            width: width * 1,
            height: height * 0.2,
            child: ShowImage(pathImage: MyConstant.homestayImage),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 20),
            child: Row(
              children: [
                Text(
                  'ชื่อบ้านพัก',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 8),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey,
                ),
                Text(
                  '19/19 แสมดำ บางขุนเทียน กทม 10150.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
