import 'package:flutter/material.dart';

class MemberApprove extends StatefulWidget {
  MemberApprove({Key? key}) : super(key: key);

  @override
  _MemberApproveState createState() => _MemberApproveState();
}

class _MemberApproveState extends State<MemberApprove> {
  TextEditingController searchController = TextEditingController();
  final List<Map<String, dynamic>> members = [
    {
      'name': 'jakkaphan piaphengton',
      'role': 'seller',
      'email': 'best@gmail.com',
      'tel': '081-822-5233'
    },
    {
      'name': 'narubest piaphengton',
      'role': 'seller',
      'email': 'narubest@gmail.com',
      'tel': '082-832-5234'
    },
    {
      'name': 'anongnuch piaphengton',
      'role': 'seller',
      'email': 'anongnuch@gmail.com',
      'tel': '083-824-5235'
    },
    {
      'name': 'jutharat piaphengton',
      'role': 'seller',
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
      'role': 'seller',
      'email': 'narubest@gmail.com',
      'tel': '082-832-5234'
    },
  ];
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
        itemCount: members.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Container(
                height: 150,
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
                                  members[index]["name"],
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
                                Text(members[index]["tel"],
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
                                Text(members[index]["role"],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.redAccent[100]),
                                  child: Text('ปฏิเสธ'),
                                  onPressed: () {
                                    print('reject');
                                  },
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                ElevatedButton(
                                  child: Text('อนุมัติ'),
                                  onPressed: () {
                                    print('accecpt');
                                  },
                                )
                              ],
                            )
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
                      Colors.teal.shade200,
                      Colors.tealAccent.shade400,
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
