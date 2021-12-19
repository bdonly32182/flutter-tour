import 'package:flutter/material.dart';
import 'package:tour_app/pages/seller_product.dart';
import 'package:tour_app/pages/shopping_restaurant.dart';
import 'package:tour_app/utils/my_constant.dart';

class HomeBuyer extends StatefulWidget {
  HomeBuyer({Key? key}) : super(key: key);

  @override
  _HomeBuyerState createState() => _HomeBuyerState();
}

class _HomeBuyerState extends State<HomeBuyer> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyConstant.backgroudApp,
      body: SingleChildScrollView(
        child: Column(
          children: [
            menuCard(
              context,
              width,
              ShoppingRestaurant(),
              MyConstant.shopImage,
              'ผลิตภัณฑ์ชุมชน และร้านอาหาร',
              Colors.orange.shade300,
            ),
            menuCard(
              context,
              width,
              ProductSeller(),
              MyConstant.homestayImage,
              'บ้านพัก',
              Colors.green.shade300,
            ),
            menuCard(
              context,
              width,
              ProductSeller(),
              MyConstant.locationImage,
              'แหล่งท่องเที่ยว',
              Colors.purple.shade200,
            ),
            menuCard(
              context,
              width,
              ProductSeller(),
              MyConstant.packageTourImage,
              'แพ็คเกจท่องเที่ยว',
              Colors.blue.shade300,
            ),
          ],
        ),
      ),
    );
  }

  Card menuCard(BuildContext context, double width, Widget gotoWidget,
      String imageUrl, String? title, Color titleColor) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => gotoWidget)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: width * 0.4,
              child: Image.asset(imageUrl),
            ),
            SizedBox(
              width: width * .5,
              child: Center(
                child: Text(
                  title!,
                  style: TextStyle(
                      color: titleColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      shadows: const [
                        Shadow(
                          color: Colors.grey,
                          offset: Offset(0, 2.2),
                          blurRadius: 6,
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
