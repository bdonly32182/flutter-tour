import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';

class ShoppingResort extends StatefulWidget {
  ShoppingResort({Key? key}) : super(key: key);

  @override
  _ShoppingResortState createState() => _ShoppingResortState();
}

class _ShoppingResortState extends State<ShoppingResort> {
  TextEditingController searchController = TextEditingController();
  final List<Map<String, dynamic>> resorts = [
    {
      'resort_name': 'best resort',
      'location': 'ตลาดโรมัน จันทบุร',
      'url_image': 'images/america.jpg',
      'price': 5500.00,
      'rating': 4.3,
    },
    {
      'resort_name': 'aoy resort',
      'location': 'ตลาดโรมัน จันทบุรั',
      'url_image': 'images/america.jpg',
      'price': 4500.00,
      'rating': 4.3,
    },
    {
      'resort_name': 'nuch resort',
      'location': '110 หมู่ 5 ตำบลจันทนิมิต',
      'url_image': 'images/america.jpg',
      'price': 5000.00,
      'rating': 4.3,
    },
    {
      'resort_name': 'nid resort',
      'location': 'อ่าวคุ้งวิมาน',
      'url_image': 'images/america.jpg',
      'price': 6500.00,
      'rating': 4.3,
    },
    {
      'resort_name': 'aom resort',
      'location': 'อ่าวคุ้งวิมาน ',
      'url_image': 'images/america.jpg',
      'price': 6000.00,
      'rating': 4.3,
    },
    {
      'resort_name': 'mom resort',
      'location': 'ตำบลคลองขุด',
      'url_image': 'images/america.jpg',
      'price': 7500.00,
      'rating': 4.3,
    },
    {
      'resort_name': 'papa resort',
      'location': 'อุทยานแห่งชาติน้ำตกพลิ้ว',
      'url_image': 'images/america.jpg',
      'price': 8000.00,
      'rating': 4.3,
    },
    {
      'resort_name': 'mom aoy',
      'location':
          'ตำบลปากน้ำแหลมสิงห์ อำเภอแหลมสิงห์ จังหวัดจันทบุรีlocationlocation110 หมู่ 5 ตำบลจันทนิมิต อำเภอเมืองจันทบุรี จังหวัดจันทบุรีlocationlocationlocation',
      'url_image': 'images/america.jpg',
      'price': 5500.00,
      'rating': 4.3,
    },
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.themeApp,
      ),
      backgroundColor: MyConstant.backgroudApp,
      body: SafeArea(
        child: ListView(
          children: [
            buildSearch(width, height),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: resorts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      height: height * 0.26,
                      child: Column(
                        children: [
                          buildImageCard(width, height, index),
                          buildResortName(index),
                          buildResortLocation(index),
                          const SizedBox(
                            height: 10,
                            child: Divider(
                              color: Colors.grey,
                              thickness: 0.05,
                            ),
                          ),
                          buildFooter(index)
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  Row buildFooter(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              const Icon(Icons.location_on_outlined),
              const Text(
                '5 km. from center',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black54,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: Row(
            children: [
              RatingBar.builder(
                itemSize: 20.0,
                initialRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 1,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (ratingUpdate) {
                  print(ratingUpdate);
                },
              ),
              Text('${resorts[index]['rating']}')
            ],
          ),
        ),
      ],
    );
  }

  Row buildResortLocation(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              resorts[index]['location'],
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: const Text(
            'ต่อคืน',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Row buildResortName(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              resorts[index]['resort_name'],
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: true,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${resorts[index]['price']} ฿',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  SizedBox buildImageCard(double width, double height, int index) {
    return SizedBox(
      width: width * 1,
      height: height * 0.14,
      child: ShowImage(pathImage: resorts[index]['url_image']),
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
                  labelText: 'ค้นหาบ้านพัก:',
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
