import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';

class CartOtop extends StatefulWidget {
  CartOtop({Key? key}) : super(key: key);

  @override
  _CartOtopState createState() => _CartOtopState();
}

class _CartOtopState extends State<CartOtop> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyConstant.backgroudApp,
      appBar: AppBar(
        backgroundColor: MyConstant.themeApp,
        title: Text('ตะกร้าของฉัน'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (BuildContext restaurantContext, int indexRes) {
                  return Card(
                    child: Column(
                      children: [
                        buildHeaderCard(),
                        ListviewFood(width),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ทั้งหมด: 300 ฿',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: MyConstant.themeApp,
                                ),
                              ),
                              ElevatedButton(
                                child: Text('ชำระเงิน'),
                                onPressed: () {
                                  print('go to  checkout');
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: MyConstant.themeApp,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  ListView ListviewFood(double width) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int indexFood) {
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: width * 0.25,
                  child: ShowImage(
                    pathImage: MyConstant.delivery,
                  ),
                ),
                Container(
                  width: width * 0.3,
                  child: Column(
                    children: [
                      Text(
                        'product name',
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text('1 x 100 ฿')
                    ],
                  ),
                ),
                Container(
                  width: width * 0.3,
                  child: IconButton(
                      onPressed: () {
                        print('delete food');
                      },
                      icon: Icon(
                        Icons.delete_rounded,
                        color: Colors.red,
                      )),
                )
              ],
            ),
          );
        });
  }

  Row buildHeaderCard() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.store_outlined,
            color: Colors.grey[700],
          ),
        ),
        Text(
          'ชื่อร้านผลิตภัณฑ์ชุมชน',
          style: TextStyle(fontSize: 16, color: MyConstant.themeApp),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '>',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
