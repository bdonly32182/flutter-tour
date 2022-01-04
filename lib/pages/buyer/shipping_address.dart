import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tour_app/pages/buyer/create_shipping_address.dart';
import 'package:tour_app/utils/geolocation.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';

class ShippingAddress extends StatefulWidget {
  ShippingAddress({Key? key}) : super(key: key);

  @override
  _ShippingAddressState createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  Position? positionAddress;
  void initState() {
    super.initState();
    checkPermission();
  }

  void checkPermission() async {
    positionAddress = await DeterminePosition();
    print(positionAddress);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyConstant.backgroudApp,
      appBar: AppBar(
        backgroundColor: MyConstant.themeApp,
        title: Text('ที่อยู่ในการจัดส่ง'),
      ),
      body: ListView(
        children: [
          buildGoogleMap(width, height),
          buildAddress(width, height, 'จัดส่งที่: บ้าน',
              Icons.location_on_rounded, Colors.red.shade400),
          buildCardUsageCurrentPosition(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('ที่อยู่ที่บันทึก'),
          ),
          buildCardNewAddress('เพิ่มที่อยู่ใหม่'),
          Divider(
            height: 5,
          ),
          buildCardNewAddress('เพิ่มที่อยู่ทำงาน'),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (BuildContext addressContext, int intdexAddress) {
              return InkWell(
                onTap: () {
                  print('use address');
                },
                child: buildAddress(
                    width, height, 'บ้าน', Icons.home_outlined, Colors.black),
              );
            },
          ),
        ],
      ),
    );
  }

  Container buildCardNewAddress(String text) {
    return Container(
      height: 50,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => CreateShippingAddress(),
            ),
          );
        },
        child: Row(
          children: [
            Icon(Icons.add),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(color: Colors.white),
    );
  }

  Container buildCardUsageCurrentPosition() {
    return Container(
      height: 50,
      child: InkWell(
        onTap: () {
          checkPermission();
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.location_searching_rounded),
            ),
            Text(
              'ใช้ตำแหน่งปัจจุบัน',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(color: Colors.white),
    );
  }

  Card buildAddress(double width, double height, String text, IconData icon,
      Color colorIcon) {
    return Card(
      child: Column(
        children: [
          Container(
            width: width * 0.9,
            margin: EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: colorIcon,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(text),
                ),
              ],
            ),
          ),
          Container(
            width: width * 0.7,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '19/19 แสมดำ บางขุนเทียน กรงเทพมหานคร 10150',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: width * 0.7,
            margin: EdgeInsets.only(
              top: 8.0,
              bottom: 10.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'นาย จักรพันธ์ เพียเพ็งต้น | 0814206492',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.horizontal(
      //     left: Radius.circular(10),
      //     right: Radius.circular(10),
      //   ),
      // ),
    );
  }

  Row buildGoogleMap(double width, double height) {
    return Row(
      children: [
        Container(
          width: width * 1,
          height: height * 0.2,
          child: ShowImage(pathImage: MyConstant.currentLocation),
          decoration: BoxDecoration(color: Colors.white),
        ),
      ],
    );
  }
}
