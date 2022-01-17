import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';

class Notifications extends StatefulWidget {
  Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyConstant.backgroudApp,
      appBar: AppBar(
        backgroundColor: MyConstant.themeApp,
        title: Text('แจ้งเตือน'),
      ),
      body: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(2.0),
                width: width * 1,
                height: height * 0.1,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5.0),
                      width: width * 0.25,
                      child: ShowImage(pathImage: MyConstant.appLogo),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: width * 0.5,
                          child: Text(
                            'หัวข้อแจ้งเตือนหัวข้อแจ้งเตือนหัวข้อแจ้งเตือน',
                            softWrap: true,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          width: width * 0.5,
                          child: Text(
                            'รายละเอียดแจ้งเตือน',
                            softWrap: true,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: width * 0.2,
                      child: IconButton(
                        onPressed: () {
                          print('delete message');
                        },
                        icon: Icon(
                          Icons.delete_outline,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(color: Colors.white70),
              );
            },
          ),
        ],
      ),
    );
  }
}
