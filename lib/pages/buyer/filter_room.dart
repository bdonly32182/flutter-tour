import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:tour_app/pages/buyer/amount_participant.dart';
import 'package:tour_app/pages/buyer/shopping_resort.dart';
import 'package:tour_app/utils/my_constant.dart';

class FilterRoom extends StatefulWidget {
  FilterRoom({Key? key}) : super(key: key);

  @override
  _FilterRoomState createState() => _FilterRoomState();
}

class _FilterRoomState extends State<FilterRoom> {
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
        child: Column(
          children: [
            buildDatePicker(width),
            Container(
              width: width * 0.85,
              height: 50,
              margin: EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AmountParticipant(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.person),
                    Text('1'),
                    Text('ห้อง'),
                    Text('1'),
                    Text('ผู้ใหญ่'),
                    Text('1'),
                    Text('เด็ก'),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            buildButtonSearch(context)
          ],
        ),
      ),
    );
  }

  Container buildButtonSearch(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.all(15),
      child: ElevatedButton(
        child: Text(
          'ดูราคา',
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => ShoppingResort(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(primary: MyConstant.themeApp),
      ),
    );
  }

  Row buildDatePicker(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: width * .4,
          child: DateTimePicker(
            // type: DatePickerType,
            dateHintText: 'วันที่เช็คอิน',
            firstDate: DateTime(2022),
            lastDate: DateTime(2100),
            onChanged: (val) {
              print('value $val');
            },
            validator: (date) {
              if (date!.isEmpty) {
                return 'กรุณาเลือกวันที่เช็คอิน';
              }
              return null;
            },
            // onSaved: (value) => startDate = value,
            style: TextStyle(
              color: MyConstant.themeApp,
              fontWeight: FontWeight.w700,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          width: width * .4,
          child: DateTimePicker(
            dateHintText: 'วันที่เช็คเอาท์',
            firstDate: DateTime(2022),
            lastDate: DateTime(2100),
            onChanged: (val) {
              print(val);
            },
            validator: (date) {
              if (date!.isEmpty) {
                return 'กรุณาเลือกวันที่เช็คเอาท์';
              }
              return null;
            },
            // onSaved: (value) => startDate = value,
            style: TextStyle(
              color: MyConstant.themeApp,
              fontWeight: FontWeight.w700,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }
}
