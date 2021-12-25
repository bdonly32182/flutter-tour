import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tour_app/pages/buyer/menu_item_restaurant.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';

class ShoppingRestaurant extends StatefulWidget {
  ShoppingRestaurant({Key? key}) : super(key: key);

  @override
  _ShoppingRestaurantState createState() => _ShoppingRestaurantState();
}

class _ShoppingRestaurantState extends State<ShoppingRestaurant> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.themeApp,
      ),
      backgroundColor: MyConstant.backgroudApp,
      body: ListView(
        children: [
          buildSearch(width, height),
          Column(
            children: [
              buildTitle('หมวดหมู่ยอดนิยม'),
              Container(
                width: width * .9,
                height: height * .2,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildCategoryCard(
                      width,
                      height,
                      MyConstant.delivery,
                      'อาหารไทย',
                    ),
                    buildCategoryCard(
                      width,
                      height,
                      MyConstant.delivery,
                      'อาหารไทย',
                    ),
                    buildCategoryCard(
                      width,
                      height,
                      MyConstant.delivery,
                      'อาหารไทย',
                    ),
                    buildCategoryCard(
                      width,
                      height,
                      MyConstant.delivery,
                      'อาหารไทย',
                    ),
                    buildCategoryCard(
                      width,
                      height,
                      MyConstant.delivery,
                      'อาหารไทย',
                    ),
                  ],
                ),
              ),
              buildTitle('ร้านอาหารทั้งหมด'),
            ],
          ),
          buildListViewRestaurantAll(height, width),
        ],
      ),
    );
  }

  ListView buildListViewRestaurantAll(double height, double width) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return buildCardRestaurantAll(height, width);
      },
    );
  }

  Card buildCardRestaurantAll(double height, double width) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MenuItemRestaurant()),
          );
        },
        child: Container(
          height: height * .25,
          width: width * 1,
          child: Column(
            children: [
              Container(
                width: width * 7,
                height: height * 0.14,
                child: ShowImage(pathImage: MyConstant.homestayImage),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        'ชื่อร้าน',
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          itemSize: 20.0,
                          initialRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 1,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (ratingUpdate) {
                            print(ratingUpdate);
                          },
                        ),
                        const Text('4.4'),
                        const Text('(100)'),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Icon(
                      Icons.more_vert,
                      size: 15,
                      color: Colors.grey.shade700,
                    ),
                    Text(
                      'อาหารเกาหลี',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Icon(
                      Icons.delivery_dining_outlined,
                      color: Colors.grey.shade700,
                    ),
                    Text(
                      '100 ฿',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTitle(String title) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }

  Card buildCategoryCard(
      double width, double height, String pathImage, String titleCategory) {
    return Card(
      child: Column(
        children: [
          SizedBox(
            width: width * .35,
            height: height * .15,
            child: ShowImage(pathImage: pathImage),
          ),
          Container(
            child: Text(titleCategory),
          )
        ],
      ),
    );
  }

  Row buildSearch(double width, double height) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: width * 0.7,
                  height: height * .065,
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'ค้นหาร้านอาหารที่คุณสนใจ :',
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
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        blurRadius: 10,
                        offset: Offset(0, 5))
                  ])),
              Container(
                  margin: const EdgeInsets.only(top: 30, left: 10),
                  width: width * 0.2,
                  height: 40,
                  child: ElevatedButton(
                    child: const Text('search'),
                    onPressed: () {
                      print('click search');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: MyConstant.themeApp,
                    ),
                  ),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.green.shade100,
                        blurRadius: 15,
                        offset: const Offset(0, 5))
                  ]))
            ],
          ),
        ),
      ],
    );
  }
}
