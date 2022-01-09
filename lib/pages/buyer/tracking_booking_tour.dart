import 'package:flutter/material.dart';
import 'package:tour_app/pages/buyer/write_review.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';

class TrackBookingTour extends StatefulWidget {
  TrackBookingTour({Key? key}) : super(key: key);

  @override
  _TrackBookingTourState createState() => _TrackBookingTourState();
}

class _TrackBookingTourState extends State<TrackBookingTour> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyConstant.backgroudApp,
      appBar: AppBar(
        backgroundColor: MyConstant.themeApp,
        title: Text('ติดตามการจองแพ็คเกจทัวร์'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext cardContext, int index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('เลขที่ใบเสร็จ'),
                          Text('วันที่ทำธุรกรรม')
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: width * 0.26,
                            child: ShowImage(
                              pathImage: MyConstant.shopImage,
                            ),
                          ),
                          Column(
                            children: [
                              Text('ชื่อร้าน'),
                              Text('ราคา (จำนวนรายการ)'),
                              Text('สถานะสินค้า'),
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: ElevatedButton(
                              child: Text(
                                'ให้คะแนน',
                                style: TextStyle(color: MyConstant.themeApp),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (builder) => WriteReview(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8.0, right: 8.0),
                            child: ElevatedButton(
                              child: Text(
                                'สั่งใหม่',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                print('go to restaurant again');
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: MyConstant.themeApp),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
