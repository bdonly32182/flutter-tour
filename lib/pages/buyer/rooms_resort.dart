import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';

class RoomsResort extends StatefulWidget {
  RoomsResort({Key? key}) : super(key: key);

  @override
  _RoomsResortState createState() => _RoomsResortState();
}

class _RoomsResortState extends State<RoomsResort> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyConstant.backgroudApp,
      appBar: AppBar(
        backgroundColor: MyConstant.themeApp,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: width * 1,
              height: height * 0.32,
              child: Column(
                children: [
                  Container(
                    width: width * 1,
                    height: height * 0.2,
                    child: ShowImage(pathImage: MyConstant.homestayImage),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    child: Row(
                      children: [
                        Text(
                          'ชื่อบ้านพัก',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey,
                        ),
                        Text(
                          '19/19 แสมดำ บางขุนเทียน กทม 10150.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
