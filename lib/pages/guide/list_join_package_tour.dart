import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/card_package_tour.dart';

class ListJoinPackageTour extends StatefulWidget {
  ListJoinPackageTour({Key? key}) : super(key: key);

  @override
  _ListJoinPackageTourState createState() => _ListJoinPackageTourState();
}

class _ListJoinPackageTourState extends State<ListJoinPackageTour> {
  final List<Map<String, dynamic>> package_tours = [
    {
      'package_name': 'ตลาด 100 ปี หลังวัดโรมัน',
      'highlight_location': 'ตลาดโรมัน จันทบุร',
      'url_image': 'images/america.jpg',
      'price': 5500.00
    },
    {
      'package_name': 'ชุมชนริมน้ำจันทบูรห',
      'highlight_location': 'ตลาดโรมัน จันทบุรั',
      'url_image': 'images/america.jpg',
      'price': 4500.00
    },
    {
      'package_name': 'อาสนวิหารพระนางมารีอาปฏิสินธินิริมล',
      'highlight_location': '110 หมู่ 5 ตำบลจันทนิมิต',
      'url_image': 'images/america.jpg',
      'price': 5000.00
    },
    {
      'package_name': 'จุดชมวิวเนินนางพญา',
      'highlight_location': 'อ่าวคุ้งวิมาน',
      'url_image': 'images/america.jpg',
      'price': 6500.00
    },
    {
      'package_name': 'อ่าวคุ้งกระเบน',
      'highlight_location': 'อ่าวคุ้งวิมาน ',
      'url_image': 'images/america.jpg',
      'price': 6000.00
    },
    {
      'package_name': 'หาดเจ้าหลาว',
      'highlight_location': 'ตำบลคลองขุด',
      'url_image': 'images/america.jpg',
      'price': 7500.00
    },
    {
      'package_name': 'น้ำตกพลิ้ว',
      'highlight_location': 'อุทยานแห่งชาติน้ำตกพลิ้ว',
      'url_image': 'images/america.jpg',
      'price': 8000.00
    },
    {
      'package_name': 'หาดแหลมสิงห์',
      'highlight_location':
          'ตำบลปากน้ำแหลมสิงห์ อำเภอแหลมสิงห์ จังหวัดจันทบุรีhighlight_locationhighlight_location110 หมู่ 5 ตำบลจันทนิมิต อำเภอเมืองจันทบุรี จังหวัดจันทบุรีhighlight_locationhighlight_locationhighlight_location',
      'url_image': 'images/america.jpg',
      'price': 5500.00
    },
  ];
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyConstant.backgroudApp,
      appBar: AppBar(
        backgroundColor: MyConstant.themeApp,
        title: Text('รายการทัวร์ที่ได้เข้าร่วม'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: package_tours.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: sizeHeight * .36,
                    child: CardPackageTour(
                      url_image: package_tours[index]['url_image'],
                      package_name: package_tours[index]['package_name'],
                      highlight_location: package_tours[index]
                          ['highlight_location'],
                      price: package_tours[index]['price'],
                      isBuyer: false,
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
