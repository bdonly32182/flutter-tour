import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';

class CreateShippingAddress extends StatefulWidget {
  CreateShippingAddress({Key? key}) : super(key: key);

  @override
  _CreateShippingAddressState createState() => _CreateShippingAddressState();
}

class _CreateShippingAddressState extends State<CreateShippingAddress> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyConstant.backgroudApp,
      appBar: AppBar(
        title: Text('สร้างที่อยู่ใหม่'),
        backgroundColor: MyConstant.themeApp,
      ),
      body: Form(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('ช่องทางติดต่อ'),
                  ],
                ),
              ),
              buildFormField(
                _nameController,
                'ชื่อ นามสกุล',
                Icons.person,
              ),
              buildFormField(
                _phoneController,
                'เบอร์โทรศัพท์',
                Icons.phone_callback,
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('ที่อยู่'),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  print('go to select address');
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'จังหวัด, เขต/อำเภอ , รหัสไปรษณีย์',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print('go to pin location');
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: height * 0.25,
                  width: width * 1,
                  child: ShowImage(pathImage: MyConstant.currentLocation),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                width: double.maxFinite,
                child: ElevatedButton(
                  child: const Text(
                    'ส่ง',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    print('create new address');
                  },
                  style: ElevatedButton.styleFrom(primary: MyConstant.themeApp),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildFormField(TextEditingController textController,
      String labelText, IconData iconField) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: TextFormField(
        controller: textController,
        onChanged: (value) {
          print(value);
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey[600]),
          prefix: Icon(iconField, color: MyConstant.themeApp),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
