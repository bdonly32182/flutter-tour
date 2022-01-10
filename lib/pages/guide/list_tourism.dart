import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';

class ListTourism extends StatefulWidget {
  ListTourism({Key? key}) : super(key: key);

  @override
  _ListTourismState createState() => _ListTourismState();
}

class _ListTourismState extends State<ListTourism> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyConstant.backgroudApp,
      appBar: AppBar(
        backgroundColor: MyConstant.themeApp,
        title: Text('รายชื่อนักท่องเที่ยว'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext memberContext, int index) {
                  return Card(
                    child: SizedBox(
                      height: height * 0.14,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8.0),
                            width: width * 0.16,
                            child: ShowImage(pathImage: MyConstant.iconUser),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 10.0, top: 8.0),
                                    width: width * 0.4,
                                    child: Text(
                                      'ชื่อนักท่องเที่ยว',
                                      maxLines: 1,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: MyConstant.themeApp,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      left: 8.0,
                                      top: 8.0,
                                    ),
                                    width: width * 0.3,
                                    child: Text(
                                      'dd/mm/yyyy',
                                      style: TextStyle(
                                        color: MyConstant.themeApp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(
                                      Icons.group,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    '2 คน',
                                    style: TextStyle(
                                      color: MyConstant.themeApp,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(
                                      Icons.monetization_on,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    '2000 ฿',
                                    style: TextStyle(
                                      color: MyConstant.themeApp,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
