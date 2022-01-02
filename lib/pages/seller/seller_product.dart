import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tour_app/pages/seller/check_order_resteraunt.dart';
import 'package:tour_app/pages/seller/order_resort.dart';
import 'package:tour_app/pages/seller/order_resteraunt.dart';
import 'package:tour_app/pages/seller/products_list.dart';

import 'seller_create_shop.dart';
import 'create_product_items.dart';

class ProductSeller extends StatefulWidget {
  ProductSeller({Key? key}) : super(key: key);

  @override
  _ProductSellerState createState() => _ProductSellerState();
}

class _ProductSellerState extends State<ProductSeller> {
  TextEditingController searchController = TextEditingController();
  final List<Map<String, dynamic>> products = [
    {
      'productName': 'jakkaphan piaphengton',
      'typeProduct': 'resteraunt',
      'productOwnerName': 'best@gmail.com',
      'tel': '081-822-5233',
      'productId': '123456'
    },
    {
      'productName': 'narubest piaphengton',
      'typeProduct': 'resort',
      'productOwnerName': 'narubest@gmail.com',
      'tel': '082-832-5234',
      'productId': '123456'
    }
  ];
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('ร้านของฉัน'),
        backgroundColor: Colors.tealAccent[700],
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SellerCreateShop(),
                ),
              );
            },
            icon: Icon(Icons.store),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            // search
            buildSearch(size),
            // list view
            buildListView(size, sizeHeight)
          ],
        ),
      ),
    );
  }

  Container buildListView(double size, double sizeHeight) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: size * 1,
      height: sizeHeight * 0.75,
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Container(
                height: sizeHeight * .3,
                child: InkWell(
                  child: Column(
                    children: [
                      buildEdit(context),
                      buildDetail(size, index, context),
                      buildToggle(),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.teal.shade200,
                      Colors.tealAccent.shade400,
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
          );
        },
      ),
    );
  }

  Row buildEdit(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SellerCreateShop()));
          },
          icon: Icon(Icons.edit),
          color: Colors.red,
        )
      ],
    );
  }

  Row buildDetail(double size, int index, BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          width: size * 0.2,
          height: 60,
          child: const Icon(
            Icons.person_pin,
            size: 60,
            color: Colors.white,
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.library_books,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    products[index]["productName"],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(products[index]["tel"],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.category,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(products[index]["typeProduct"],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: buildButtonOrder(index, context),
                  ),
                  buildButtonProducts(context)
                ],
              )
            ],
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(60)),
        )
      ],
    );
  }

  Row buildToggle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ToggleSwitch(
          totalSwitches: 2,
          minWidth: 80.0,
          cornerRadius: 20.0,
          activeBgColors: [
            [Colors.green[800]!],
            [Colors.red[800]!]
          ],
          activeFgColor: Colors.white,
          inactiveBgColor: Colors.grey,
          inactiveFgColor: Colors.white,
          initialLabelIndex: 1,
          labels: ['เปิดร้าน', 'ปิดร้าน'],
          radiusStyle: true,
          onToggle: (index) {
            print('switched to: $index');
          },
        )
      ],
    );
  }

  ElevatedButton buildButtonProducts(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ProductsList()));
      },
      child: Row(
        children: [
          Icon(Icons.production_quantity_limits_sharp),
          Text('รายการสินค้า'),
        ],
      ),
    );
  }

  ElevatedButton buildButtonOrder(int index, BuildContext context) {
    return ElevatedButton(
      child: Row(
        children: [
          const Icon(Icons.delivery_dining_rounded),
          const Text('ออร์เดอร์')
        ],
      ),
      onPressed: () {
        if (products[index]['typeProduct'] == 'resteraunt') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OrderResteraunt()),
          );
        }
        if (products[index]['typeProduct'] == 'resort') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => OrderResort()),
          );
        }
      },
    );
  }

  Row buildSearch(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 30),
            width: size * 0.7,
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ค้นหาสมาชิก :',
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
                  color: Colors.deepPurple.shade100,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ]))
      ],
    );
  }
}
