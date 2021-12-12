import 'package:flutter/material.dart';
import 'package:tour_app/pages/adminpage/create_guide.dart';

class GuideList extends StatefulWidget {
  GuideList({Key? key}) : super(key: key);

  @override
  _GuideListState createState() => _GuideListState();
}

class _GuideListState extends State<GuideList> {
  TextEditingController searchController = TextEditingController();
  final List<Map<String, dynamic>> guides = [
    {
      'name': 'jakkaphan piaphengton',
      'role': 'seller',
      'email': 'best@gmail.com',
      'tel': '081-822-5233'
    },
    {
      'name': 'narubest piaphengton',
      'role': 'buyer',
      'email': 'narubest@gmail.com',
      'tel': '082-832-5234'
    },
    {
      'name': 'anongnuch piaphengton',
      'role': 'guide',
      'email': 'anongnuch@gmail.com',
      'tel': '083-824-5235'
    },
    {
      'name': 'jutharat piaphengton',
      'role': 'buyer',
      'email': 'jutharat@gmail.com',
      'tel': '084-825-5236'
    },
    {
      'name': 'apassara piaphengton',
      'role': 'seller',
      'email': 'apassara@gmail.com',
      'tel': '085-826-5237'
    },
    {
      'name': 'jakkaphan piaphengton',
      'role': 'seller',
      'email': 'best@gmail.com',
      'tel': '081-822-5233'
    },
    {
      'name': 'narubest piaphengton',
      'role': 'buyer',
      'email': 'narubest@gmail.com',
      'tel': '082-832-5234'
    },
    {
      'name': 'anongnuch piaphengton',
      'role': 'guide',
      'email': 'anongnuch@gmail.com',
      'tel': '083-824-5235'
    },
    {
      'name': 'jutharat piaphengton',
      'role': 'buyer',
      'email': 'jutharat@gmail.com',
      'tel': '084-825-5236'
    },
    {
      'name': 'apassara piaphengton',
      'role': 'seller',
      'email': 'apassara@gmail.com',
      'tel': '085-826-5237'
    },
  ];
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[700],
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (contect) => CreateGuide()));
              },
              icon: Icon(Icons.person_add))
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            // search
            buildSearch(size),
            // list view
            buildListView(size, sizeHeight)
          ],
        ),
      ),
    );
  }

  Container buildListView(double size, double sizeHeight) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      width: size * 1,
      height: sizeHeight * 0.68,
      child: ListView.builder(
        itemCount: guides.length,
        itemBuilder: (BuildContext context, int index) {
          int color_role = guides[index]["role"] == 'seller'
              ? 0
              : guides[index]["role"] == 'buyer'
                  ? 1
                  : 2;

          return Container(
            margin: EdgeInsets.all(10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Container(
                height: 120,
                child: InkWell(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        width: size * 0.2,
                        height: 60,
                        child: Icon(
                          Icons.person_pin,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.library_books,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  guides[index]["name"],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(guides[index]["tel"],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.category,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(guides[index]["role"],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60)),
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.blue.shade300,
                      Colors.blue.shade400,
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
          );
        },
      ),
    );
  }

  Row buildSearch(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 30),
            width: size * 0.7,
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ค้นหาสมาชิก :',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.tealAccent[700],
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
        Container(
            margin: EdgeInsets.only(top: 30, left: 10),
            width: size * 0.2,
            height: 40,
            child: ElevatedButton(
              child: Text('search'),
              onPressed: () {
                print('click search');
              },
              style: ElevatedButton.styleFrom(primary: Colors.tealAccent[700]),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.tealAccent.shade100,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ]))
      ],
    );
  }
}
