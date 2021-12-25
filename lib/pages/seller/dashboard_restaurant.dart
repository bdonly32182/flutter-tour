import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_date_picker.dart';

class DashboardRestaurant extends StatefulWidget {
  DashboardRestaurant({Key? key}) : super(key: key);

  @override
  _DashboardRestaurantState createState() => _DashboardRestaurantState();
}

class _DashboardRestaurantState extends State<DashboardRestaurant> {
  DateTime selectedDate = DateTime.now();
  _selectDate(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(context);
    }
  }

  List<Map<String, dynamic>> myProducts = [
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
    },
  ];
  bool focusIncomeMonth = true;
  bool focusIncomeYear = false;
  bool focusSelectDate = false;
  String type = 'month';
  String? filterDate(DateTime date, String type) {
    if (type == 'year') {
      return 'ปี ${date.year}';
    }
    if (type == 'month') {
      String month = MyConstant().monthThailand[date.month - 1];
      return '${month}  ${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: MyConstant.backgroudApp,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildSwiperStore(width),
              buildFirstChart(width),
              buildSecondChart(width),
              buildFilterDashboard(),
              buildShowAndSelectDate(width),
              buildOrderList('ออร์เดอร์ทั้งหมด', '100'),
              buildOrderList('ออร์เดอร์ที่อนุมัติ', '90'),
              buildOrderList('ออร์เดอร์ที่ปฏิเสธ', '10'),
              buildOrderList('ออร์เดอร์ที่จัดส่งแล้ว', '90'),
              buildTotalIncome('รวมรายได้ทั้งหมด', '9,000'),
            ],
          ),
        ),
      ),
    );
  }

  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != selectedDate)
                  setState(() {
                    selectedDate = picked;
                  });
              },
              initialDateTime: selectedDate,
              minimumYear: 2021,
              maximumYear: 2100,
            ),
          );
        });
  }

  buildMaterialDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2100),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDatePickerMode: DatePickerMode.day,
      helpText: 'เลือกเดือนและปีที่ต้องการดูรายรับ',
      cancelText: 'ยกเลิก',
      confirmText: 'เลือก',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      fieldLabelText: 'dashboard date',
      fieldHintText: 'Month/Date/Year',
      builder: (context, child) {
        return focusIncomeMonth
            ? Theme(
                data: ThemeData.light(),
                child: child!,
              )
            : AlertDialog(
                title: Text("เลือกปีที่ต้องการดูรายรับ"),
                content: Container(
                  width: 300,
                  height: 300,
                  child: YearPicker(
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2100),
                    initialDate: DateTime.now(),
                    selectedDate: selectedDate,
                    onChanged: (DateTime dateTime) {
                      Navigator.pop(context);
                      setState(() {
                        selectedDate = dateTime;
                      });
                    },
                  ),
                ),
              );
      },
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Row buildSwiperStore(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15),
          width: width * .8,
          height: 220,
          child: Swiper(
            itemCount: myProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: width * .6,
                            height: 120,
                            child: Image.asset(
                              MyConstant.delivery,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.storefront_sharp,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              myProducts[index]["productName"],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(175, 175, 175, 1),
                            blurRadius: 12,
                            offset: Offset(0, 10)),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ),
              );
            },
            pagination: const SwiperPagination(),
            control: SwiperControl(color: Colors.grey),
            viewportFraction: 0.8,
            scale: 0.8,
          ),
        )
      ],
    );
  }

  Row buildTotalIncome(String type, String totalPrice) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 15, bottom: 20),
          child: Text(
            type,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Color.fromRGBO(41, 187, 137, 1),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25.0, top: 15, bottom: 20),
          child: Text(
            '$totalPrice  บาท',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Color.fromRGBO(41, 187, 137, 1),
            ),
          ),
        ),
      ],
    );
  }

  Row buildOrderList(String type, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 15, bottom: 12),
          child: Text(
            type,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25.0, top: 15, bottom: 12),
          child: Text(
            '$amount  รายการ',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  Row buildShowAndSelectDate(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 15, bottom: 12),
          child: Text(
            '${filterDate(selectedDate, type)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        buildSelectDate(width),
      ],
    );
  }

  Row buildFilterDashboard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [buildMonth(), buildYear()],
    );
  }

  Container buildYear() {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 15),
      child: ElevatedButton(
        child: focusIncomeYear
            ? const Text(
                'รายปี',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const Text(
                'รายปี',
                style: TextStyle(color: Colors.grey),
              ),
        onPressed: () {
          setState(() {
            focusIncomeYear = true;
            focusIncomeMonth = false;
            type = 'year';
            selectedDate = DateTime.now();
          });
        },
        style: ElevatedButton.styleFrom(
          primary: focusIncomeYear ? Colors.grey[100] : Colors.grey[200],
          padding: const EdgeInsets.symmetric(horizontal: 30),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Container buildMonth() {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 15),
      child: ElevatedButton(
        child: focusIncomeMonth
            ? const Text(
                'รายเดือน',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const Text(
                'รายเดือน',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
        onPressed: () {
          setState(() {
            focusIncomeMonth = true;
            focusIncomeYear = false;
            type = 'month';
            selectedDate = DateTime.now();
          });
        },
        style: ElevatedButton.styleFrom(
          primary: focusIncomeMonth ? Colors.grey[100] : Colors.grey[200],
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Container buildSelectDate(double width) {
    return Container(
      width: width * .35,
      child: IconButton(
          onPressed: () => _selectDate(context), icon: Icon(Icons.list)),
    );
  }

  Row buildSecondChart(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          width: width * .45,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'ออร์เดอร์ที่จัดส่งแล้ว',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Text(
                '900',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              // color: Color.fromRGBO(153, 228, 110, 1),
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(70, 186, 90, 1),
                  Color.fromRGBO(153, 228, 110, 1),
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
              borderRadius: BorderRadius.circular(15)),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: width * .45,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'ออร์เดอร์ที่ปฏิเสธ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Text(
                '10',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            // color: Color.fromRGBO(255, 111, 112, 1),
            gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(255, 111, 112, 1),
                Color.fromRGBO(255, 60, 66, 0.7),
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ],
    );
  }

  Row buildFirstChart(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: width * .45,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'ออร์เดอร์ทั้งหมด',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Text(
                '1,000',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              // color: Color.fromRGBO(189, 163, 241, 1),
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(166, 120, 241, 1),
                  Color.fromRGBO(189, 163, 241, 1),
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
              borderRadius: BorderRadius.circular(15)),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          width: width * .45,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'ออร์เดอร์ที่อนุมัติ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Text(
                '900',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              // color: Color.fromRGBO(100, 180, 255, 1),
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(89, 147, 245, 1),
                  Color.fromRGBO(100, 180, 255, 0.7),
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
              borderRadius: BorderRadius.circular(15)),
        )
      ],
    );
  }
}
