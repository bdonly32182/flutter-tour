import 'package:flutter/material.dart';
import 'package:tour_app/pages/adminpage/create_tourism_location.dart';
import 'package:tour_app/widgets/card_location.dart';

class TourismLocation extends StatefulWidget {
  bool isAdmin;
  TourismLocation({Key? key, required this.isAdmin}) : super(key: key);

  @override
  _TourismLocationState createState() => _TourismLocationState();
}

class _TourismLocationState extends State<TourismLocation> {
  TextEditingController searchController = TextEditingController();
  final List<Map<String, dynamic>> tourism_locations = [
    {
      'placeName': 'ตลาด 100 ปี หลังวัดโรมัน',
      'location': 'ตลาดโรมัน จันทบุรั',
      'rating': 4.7,
      'ratingCount': 20,
      'pictur': 'images/america.jpg'
    },
    {
      'placeName': 'ชุมชนริมน้ำจันทบูรห',
      'location': 'ตลาดโรมัน จันทบุรั',
      'rating': 4.5,
      'ratingCount': 30,
      'pictur': 'images/america.jpg'
    },
    {
      'placeName': 'อาสนวิหารพระนางมารีอาปฏิสินธินิริมล',
      'location': '110 หมู่ 5 ตำบลจันทนิมิต อำเภอเมืองจันทบุรี จังหวัดจันทบุรี',
      'rating': 4.6,
      'ratingCount': 20,
      'pictur': 'images/america.jpg'
    },
    {
      'placeName': 'จุดชมวิวเนินนางพญา',
      'location': 'อ่าวคุ้งวิมาน',
      'rating': 4.8,
      'ratingCount': 40,
      'pictur': 'images/america.jpg'
    },
    {
      'placeName': 'อ่าวคุ้งกระเบน',
      'location': 'อ่าวคุ้งวิมาน ',
      'rating': 3.3,
      'ratingCount': 10,
      'pictur': 'images/america.jpg'
    },
    {
      'placeName': 'หาดเจ้าหลาว',
      'location': 'ตำบลคลองขุด อำเภอท่าใหม่ จังหวัดจันทบุรี',
      'rating': 3.5,
      'ratingCount': 10,
      'pictur': 'images/america.jpg'
    },
    {
      'placeName': 'น้ำตกพลิ้ว',
      'location': 'อุทยานแห่งชาติน้ำตกพลิ้ว',
      'rating': 4.4,
      'ratingCount': 10,
      'pictur': 'images/america.jpg'
    },
    {
      'placeName': 'หาดแหลมสิงห์',
      'location': 'ตำบลปากน้ำแหลมสิงห์ อำเภอแหลมสิงห์ จังหวัดจันทบุรี',
      'rating': 4.2,
      'ratingCount': 10,
      'pictur': 'images/america.jpg'
    },
  ];
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[700],
        actions: widget.isAdmin
            ? [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateTourismLocation()));
                    },
                    icon: Icon(
                      Icons.add,
                      size: 35,
                    ))
              ]
            : [],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            buildSearch(size, sizeHeight),
            Container(
              margin: EdgeInsets.all(15),
              height: sizeHeight * .74,
              width: size * 1,
              child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: sizeHeight > 730
                      ? size / sizeHeight / .65
                      : size / sizeHeight / 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  children: List.generate(
                      tourism_locations.length,
                      (index) => CardLocation(
                            urlPicture: tourism_locations[index]['pictur'],
                            name: tourism_locations[index]['placeName'],
                            rating: tourism_locations[index]['rating'],
                            ratingCoute: tourism_locations[index]
                                ['ratingCount'],
                            location: tourism_locations[index]['location'],
                          ))),
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
                    color: Colors.tealAccent[700],
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
              style: ElevatedButton.styleFrom(primary: Colors.tealAccent[700]),
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
