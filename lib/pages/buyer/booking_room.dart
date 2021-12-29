import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';

class BookingRoom extends StatefulWidget {
  BookingRoom({Key? key}) : super(key: key);

  @override
  _BookingRoomState createState() => _BookingRoomState();
}

class _BookingRoomState extends State<BookingRoom> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  Map<String, dynamic> room = {
    'roomName': 'roomName',
    'bedSize': '2 เตียงควีนไซส์',
    'roomSize': 28,
    'amountCustomer': 4,
    'roomImages': [
      MyConstant.homestayImage,
      MyConstant.locationImage,
      MyConstant.partnerImage
    ]
  };
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.themeApp,
        title: Text('รายละเอียดการจอง'),
      ),
      backgroundColor: MyConstant.backgroudApp,
      body: Form(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  buildCardDetailResort(width, height),
                  buildCardImage(width, height),
                  buildCardContact(width, height)
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              width: double.maxFinite,
              child: ElevatedButton(
                child: Text(
                  'ชำระเงิน',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  print('ชำระเงิน');
                },
                style: ElevatedButton.styleFrom(primary: MyConstant.themeApp),
              ),
            )
          ],
        ),
      ),
    );
  }

  Card buildCardContact(double width, double height) {
    return Card(
      child: SizedBox(
        width: width * 1,
        height: height * 0.5,
        child: Column(
          children: [
            buildRoomHeader(
              Icons.contacts_outlined,
              'ข้อมูลการติดต่อ',
            ),
            buildTextFormFieldName(width),
            buildTextFormFieldEmail(width),
            buildTextFormFieldPhone(width),
            buildTextFormFieldAddress(width),
          ],
        ),
      ),
    );
  }

  Container buildTextFormFieldAddress(double width) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: width * 0.9,
      child: TextFormField(
        controller: _addressController,
        maxLines: 3,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          label: const Text('ที่อยู่ในการติดต่อ :'),
          labelStyle: TextStyle(color: Colors.grey[600]),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        style: TextStyle(
          color: MyConstant.themeApp,
        ),
      ),
    );
  }

  Container buildTextFormFieldPhone(double width) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: width * 0.9,
      child: TextFormField(
        controller: _phoneController,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          label: const Text('หมายเลขโทรศัพท์'),
          labelStyle: TextStyle(color: Colors.grey[600]),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        style: TextStyle(
          color: MyConstant.themeApp,
        ),
      ),
    );
  }

  Container buildTextFormFieldEmail(double width) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: width * 0.9,
      child: TextFormField(
        controller: _emailController,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          label: const Text('อีเมล'),
          labelStyle: TextStyle(color: Colors.grey[600]),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        style: TextStyle(
          color: MyConstant.themeApp,
        ),
      ),
    );
  }

  Container buildTextFormFieldName(double width) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: width * 0.9,
      child: TextFormField(
        controller: _nameController,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          label: const Text('ชื่อ - นามสกุล'),
          labelStyle: TextStyle(color: Colors.grey[600]),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        style: TextStyle(
          color: MyConstant.themeApp,
        ),
      ),
    );
  }

  Card buildCardDetailResort(double width, double height) {
    return Card(
      child: Container(
        width: width * 1,
        height: height * 0.3,
        child: Column(
          children: [
            buildRowDetailResort(width, height),
            Divider(
              height: 5,
              thickness: 0.2,
            ),
            buildRowCheckinAndCheckout(),
          ],
        ),
      ),
    );
  }

  Row buildRowCheckinAndCheckout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Row(
              children: [
                Icon(Icons.calendar_today),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'พ., ธ.ค. 29',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text('14:00'),
              ],
            )
          ],
        ),
        Icon(Icons.arrow_forward),
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'พฤ., ธ.ค. 30',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text('12:00'),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.dark_mode),
            ),
            Text('1 คืน'),
          ],
        )
      ],
    );
  }

  Row buildRowDetailResort(double width, double height) {
    return Row(
      children: [
        Container(
          width: width * 0.3,
          height: height * 0.2,
          child: ShowImage(pathImage: MyConstant.memberPicture),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      'ชื่อบ้านพัก',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Text(
                        '19/19 แสมดำ บางขุนเทียน กทม 10150.',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                        maxLines: 3,
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Card buildCardImage(double width, double height) {
    return Card(
      child: SizedBox(
        width: width * 1,
        height: height * 0.36,
        child: Column(
          children: [
            buildRoomHeader(Icons.bed, '1 x Family Room'),
            Row(
              children: [
                buildImageRoom(height, width),
                buildColumnDetailRoom()
              ],
            ),
            const Divider(
              thickness: 0.5,
              height: 5,
            ),
            buildRoomFooter()
          ],
        ),
      ),
    );
  }

  Padding buildRoomFooter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ยอดรวมที่ต้องชำระ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            '4,000 ฿',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: MyConstant.themeApp),
          ),
        ],
      ),
    );
  }

  Container buildRoomHeader(IconData iconHeader, String titleHeader) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 50,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              iconHeader,
              color: MyConstant.themeApp,
            ),
          ),
          Text(
            titleHeader,
            style: TextStyle(
              color: MyConstant.themeApp,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 0.5),
            blurRadius: 1,
          ),
        ],
      ),
    );
  }

  Column buildColumnDetailRoom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Icon(Icons.group),
            ),
            Text('จำนวนผู้เข้าพักผู้ใหญ่: 6 คน')
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              child: Icon(Icons.bed),
            ),
            Text('4เตียงสองชั้น และ 1 เตียงคิงไซส์'),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              child: Icon(
                Icons.policy,
                color: MyConstant.themeApp,
              ),
            ),
            Text(
              'เงื่อนไขการจอง',
              style: TextStyle(
                color: MyConstant.themeApp,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Container buildImageRoom(double height, double width) {
    return Container(
      margin: EdgeInsets.all(8),
      height: height * 0.2,
      width: width * 0.3,
      child: ShowImage(pathImage: room['roomImages'][0]),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
