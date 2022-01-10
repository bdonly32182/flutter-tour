import 'package:flutter/material.dart';
import 'package:tour_app/pages/seller/create_product_items.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';

class ProductsList extends StatefulWidget {
  ProductsList({Key? key}) : super(key: key);

  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  final List<Map<String, dynamic>> products = [
    {
      'productItemName': 'jakkaphan piaphengton',
      'price': 250,
      'description': 'best@gmail.com',
      'productId': '123456'
    },
    {
      'productItemName': 'narubest piaphengton',
      'price': 100,
      'description': 'narubest@gmail.com',
      'productId': '123456'
    }
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateProductItems(
                          productId: '1',
                          productName: 'productName',
                          typeProduct: 'typeProduct')));
            },
            icon: Icon(Icons.add),
          )
        ],
        backgroundColor: MyConstant.themeApp,
        title: Text('รายการสินค้า'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: width * 1,
            height: height * 0.75,
            child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Container(
                      height: height * .2,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateProductItems(
                                  productId: 'productId',
                                  productName: 'productName',
                                  typeProduct: 'typeProduct'),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  width: width * 0.2,
                                  height: 60,
                                  child:
                                      ShowImage(pathImage: MyConstant.delivery),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            products[index]["productItemName"],
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
                                            Icons.money_off,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                              products[index]["price"]
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.description,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(products[index]["description"],
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.teal.shade200,
                                Colors.tealAccent.shade400,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
