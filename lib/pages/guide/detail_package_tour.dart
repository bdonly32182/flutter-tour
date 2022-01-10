import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tour_app/pages/buyer/write_review.dart';
import 'package:tour_app/utils/my_constant.dart';

class DetailPackageTour extends StatefulWidget {
  DetailPackageTour({Key? key}) : super(key: key);

  @override
  _DetailPackageTourState createState() => _DetailPackageTourState();
}

class _DetailPackageTourState extends State<DetailPackageTour> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyConstant.backgroudApp,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                buildImagePackage(width, height),
                buildDescriptPackage(),
                buildTitleGallery(),
                buildTravelGallery(width, height)
              ],
            ),
          ),
          buildTabMenu(height),
        ],
      ),
    );
  }

  Container buildTabMenu(double height) {
    return Container(
      width: double.maxFinite,
      height: height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                'สถานะการจอง',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ToggleSwitch(
                    totalSwitches: 2,
                    minWidth: 80.0,
                    cornerRadius: 20.0,
                    activeBgColors: [
                      [MyConstant.themeApp],
                      [Colors.red[700]!]
                    ],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    initialLabelIndex: 1,
                    labels: ['เปิดจอง', 'ปิดจอง'],
                    radiusStyle: true,
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  )
                ],
              ),
            ],
          ),
          ElevatedButton(
            child: Text(
              'เขียนรีวิว',
              style: TextStyle(fontSize: 16, color: MyConstant.themeApp),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => WriteReview(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(primary: Colors.white),
          ),
        ],
      ),
      decoration: BoxDecoration(color: MyConstant.themeApp),
    );
  }

  Container buildTravelGallery(double width, double height) {
    return Container(
      width: width * 1,
      height: height * 0.26,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext galleryContext, int index) {
            return Container(
                width: width * 0.4,
                margin: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'หาดจ้าวหลาว',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(MyConstant.homestayImage),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.white60,
                        BlendMode.dst,
                      )),
                ));
          }),
    );
  }

  Container buildTitleGallery() {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Text(
        "Travel's Gallery",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding buildDescriptPackage() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
              style: TextStyle(color: Colors.black54),
              softWrap: true,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  Container buildImagePackage(double width, double height) {
    return Container(
      width: width * 1,
      height: height * 0.3,
      child: Stack(
        children: [
          buildArrowBack(),
          buildColumnInImage(),
        ],
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/america.jpg'),
          colorFilter: ColorFilter.mode(
            Colors.white30,
            BlendMode.dst,
          ),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    );
  }

  Row buildArrowBack() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(left: 10.0, top: 10),
            child: Center(
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
            ),
            width: 50,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  Column buildColumnInImage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Package tour name',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10.0),
                child: Center(
                  child: Text(
                    '4.7',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 15.0,
            left: 8.0,
          ),
          child: Row(
            children: const [
              Icon(
                Icons.location_on_outlined,
                color: Colors.white70,
              ),
              Text(
                'หาดเจ้าเทียน',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ],
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
