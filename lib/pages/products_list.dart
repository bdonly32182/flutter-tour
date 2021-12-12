import 'package:flutter/material.dart';
import 'package:tour_app/pages/create_product_items.dart';

class ProductsList extends StatefulWidget {
  ProductsList({Key? key}) : super(key: key);

  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
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
              icon: Icon(Icons.add))
        ],
      ),
    );
  }
}
