import 'package:flutter/material.dart';
import 'package:tour_app/pages/adminpage/create_package_tour.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/card_package_tour.dart';

class PackageTour extends StatefulWidget {
  final bool isAdmin;
  PackageTour({Key? key, required this.isAdmin}) : super(key: key);

  @override
  _PackageTourState createState() => _PackageTourState();
}

class _PackageTourState extends State<PackageTour> {
  TextEditingController searchController = TextEditingController();
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
      appBar: AppBar(
        backgroundColor: MyConstant.themeApp,
        actions: widget.isAdmin
            ? <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => CreatePackageTour()));
                  },
                )
              ]
            : [],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            buildSearch(size, sizeHeight),
            Container(
              margin: const EdgeInsets.all(15),
              width: size * 1,
              height: sizeHeight * .74,
              child: ListView.builder(
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
                        isBuyer: true,
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Row buildSearch(double size, double sizeHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 30),
            width: size * 0.7,
            height: sizeHeight * .065,
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ค้นหาแหล่งท่องเที่ยว :',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: Icon(
                    Icons.search,
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
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
        Container(
            margin: EdgeInsets.only(top: 30, left: 10),
            width: size * 0.2,
            height: 40,
            child: ElevatedButton(
              child: Text('search'),
              onPressed: () {
                print('click search');
              },
              style: ElevatedButton.styleFrom(primary: MyConstant.themeApp),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.tealAccent.shade100,
                  blurRadius: 15,
                  offset: const Offset(0, 5))
            ]))
      ],
    );
  }
}
