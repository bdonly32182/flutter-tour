import 'package:flutter/material.dart';
import 'package:tour_app/pages/buyer_create_brand.dart';
import 'package:tour_app/pages/create_product_items.dart';

class PartnerList extends StatefulWidget {
  PartnerList({Key? key}) : super(key: key);

  @override
  _PartnerListState createState() => _PartnerListState();
}

class _PartnerListState extends State<PartnerList> {
  TextEditingController searchController = TextEditingController();
  final List<Map<String, dynamic>> partners = [
    {
      'productName': 'jakkaphan piaphengton',
      'typeProduct': 'resteraunt',
      'productOwnerName': 'best@gmail.com',
      'tel': '081-822-5233',
      'restaurant': 2,
      'otop': 0,
      'homestay': 0,
      'productId': '123456'
    },
    {
      'productName': 'narubest piaphengton',
      'typeProduct': 'resteraunt',
      'productOwnerName': 'narubest@gmail.com',
      'tel': '082-832-5234',
      'restaurant': 0,
      'otop': 1,
      'homestay': 0,
      'productId': '123456'
    },
    {
      'productName': 'anongnuch piaphengton',
      'typeProduct': 'otop',
      'productOwnerName': 'anongnuch@gmail.com',
      'tel': '083-824-5235',
      'restaurant': 2,
      'otop': 0,
      'homestay': 1,
      'productId': '123456'
    },
    {
      'productName': 'jutharat piaphengton',
      'typeProduct': 'otop',
      'productOwnerName': 'jutharat@gmail.com',
      'tel': '084-825-5236',
      'restaurant': 0,
      'otop': 1,
      'homestay': 1,
      'productId': '123456'
    },
    {
      'productName': 'apassara piaphengton',
      'typeProduct': 'resort',
      'productOwnerName': 'apassara@gmail.com',
      'tel': '085-826-5237',
      'restaurant': 1,
      'otop': 0,
      'homestay': 0,
      'productId': '123456'
    },
    {
      'productName': 'jakkaphan piaphengton',
      'typeProduct': 'resort',
      'productOwnerName': 'best@gmail.com',
      'tel': '081-822-5233',
      'restaurant': 0,
      'otop': 2,
      'homestay': 0,
      'productId': '123456'
    },
    {
      'productName': 'narubest piaphengton',
      'typeProduct': 'resort',
      'productOwnerName': 'narubest@gmail.com',
      'tel': '082-832-5234',
      'restaurant': 0,
      'otop': 0,
      'homestay': 2,
      'productId': '123456'
    },
  ];
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[700],
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.tealAccent[700]),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => BuyerCreateBrand()));
            },
            child: Row(
              children: const [
                Icon(
                  Icons.add,
                ),
                Icon(
                  Icons.store_sharp,
                  size: 40,
                )
              ],
            ),
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
        itemCount: partners.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Container(
                height: 150,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CreateProductItems(
                            productId: partners[index]['productId'],
                            productName: partners[index]['productName'],
                            typeProduct: partners[index]['typeProduct']),
                      ),
                    );
                  },
                  child: Row(
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
                                Icon(
                                  Icons.library_books,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  partners[index]["productName"],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(partners[index]["tel"],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.category,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(partners[index]["typeProduct"],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.home,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('${partners[index]["homestay"]}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.restaurant_menu_sharp,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('${partners[index]["restaurant"]}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.store_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('${partners[index]['otop']}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60)),
                      )
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
