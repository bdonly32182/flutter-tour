import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';

class BookingTour extends StatefulWidget {
  BookingTour({Key? key}) : super(key: key);

  @override
  _BookingTourState createState() => _BookingTourState();
}

class _BookingTourState extends State<BookingTour> {
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
            Expanded(
              child: ListView(
                children: [
                  Card(
                    child: SizedBox(
                      width: width * 1,
                      height: height * 0.3,
                      child: Column(
                        children: [
                          SizedBox(
                            width: width * 1,
                            height: height * 0.2,
                            child: ShowImage(
                              pathImage: MyConstant.packageTourImage,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const[
                                Text(
                                  'Package tour name',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          buildStartAndEndDate()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                child: const Text(
                  'Booking now',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  print('booking now');
                },
                style: ElevatedButton.styleFrom(primary: MyConstant.themeApp),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildStartAndEndDate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: const [
            Icon(Icons.calendar_today),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'พ., ธ.ค. 29',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        const Icon(Icons.arrow_forward),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'พฤ., ธ.ค. 30',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.dark_mode),
            ),
            Text('1 คืน'),
          ],
        )
      ],
    );
  }
}
