import 'package:flutter/material.dart';
import 'package:tour_app/pages/buyer/add_to_cart.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';

class MenuItemRestaurant extends StatefulWidget {
  MenuItemRestaurant({Key? key}) : super(key: key);

  @override
  _MenuItemRestaurantState createState() => _MenuItemRestaurantState();
}

class _MenuItemRestaurantState extends State<MenuItemRestaurant> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyConstant.backgroudApp,
        appBar: AppBar(
          backgroundColor: MyConstant.themeApp,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  buildDetail(width, height),
                  buildListviewProduct(width, height)
                ],
              ),
            ),
            buildButtonCheckout(height, width)
          ],
        ),
      ),
    );
  }

  Container buildButtonCheckout(double height, double width) {
    return Container(
      width: double.maxFinite,
      height: height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width * 0.85,
            height: 50,
            child: ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '2',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'สั่งอาหาร',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '150 ฿',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              onPressed: () {
                print('go to checkout');
              },
              style: ElevatedButton.styleFrom(primary: MyConstant.themeApp),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(color: Colors.white),
    );
  }

  Padding buildListviewProduct(double width, double height) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: [
                Container(
                  width: width * 0.35,
                  height: height * 0.16,
                  child: ShowImage(pathImage: MyConstant.locationImage),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'ชื่อสินค้าชื่อสินค้าชื่อสินค้าชื่อสินค้าชื่อสินค้า',
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: true,
                        ),
                      ),
                      Text(
                        '50 ฿',
                        style: TextStyle(
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 55.0),
                  child: ElevatedButton(
                    child: Text('เลือก'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AddToCart(
                            productImage: MyConstant.delivery,
                            option: [
                              {'optionName': 'พิเศษข้าว', 'optionPrice': 10},
                              {'optionName': 'พิเศษกับข้าว', 'optionPrice': 20},
                              {'optionName': 'พิเศษ', 'optionPrice': 10},
                              {'optionName': 'พิเศษ', 'optionPrice': 10},
                              {'optionName': 'พิเศษ', 'optionPrice': 10},
                              {'optionName': 'พิเศษ', 'optionPrice': 10},
                            ],
                            productName: 'productName',
                            productPrice: 100,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow.shade800,
                      textStyle: TextStyle(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Container buildDetail(double width, double height) {
    return Container(
      width: width * 1,
      height: height * .3,
      child: Column(
        children: [
          buildNameRestaurant('ชื่อร้าน'),
          buildDescription(),
          buildImageRestaurant(width, height),
        ],
      ),
    );
  }

  Expanded buildImageRestaurant(double width, double height) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width * 1,
            height: height * 0.25,
            child: ShowImage(pathImage: MyConstant.delivery),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.white54, blurRadius: 5, offset: Offset(0, 6))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row buildDescription() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'เปิด จนถึง 20:30',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),
          ),
        ),
        TextButton(
          child: Text(
            'ดูข้อมูลร้าน >',
            style: TextStyle(
              color: MyConstant.themeApp,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onPressed: () {
            print('go to detail');
          },
        )
      ],
    );
  }

  Row buildNameRestaurant(String restaurantName) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Text(
            restaurantName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
