import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tour_app/utils/my_constant.dart';

class SellerCreateRoom extends StatefulWidget {
  final String? productName;
  final String? productId;
  final String? typeProduct;
  SellerCreateRoom(
      {Key? key,
      required this.productId,
      required this.productName,
      required this.typeProduct})
      : super(key: key);

  @override
  _SellerCreateRoomState createState() => _SellerCreateRoomState();
}

class _SellerCreateRoomState extends State<SellerCreateRoom> {
  final ImagePicker _picker = ImagePicker();
  TextEditingController _itemName = TextEditingController();
  TextEditingController _itemPrice = TextEditingController();
  TextEditingController _itemDiscount = TextEditingController(text: '0');
  TextEditingController _itemDescription = TextEditingController();
  TextEditingController _itemTotalRoom = TextEditingController();
  TextEditingController _itemBedSize = TextEditingController();
  TextEditingController _itemRoomSize = TextEditingController();
  bool focusDescription = false;
  bool focusName = false;
  bool focusPrice = false;
  bool focusTotalRoom = false;
  bool focusBedSize = false;
  bool focusBedDescription = false;
  bool focusRoomSize = false;
  List<File>? image_selected = [];
  String? _selectedValue;
  List<Map<String, dynamic>>? _valueOptionName = [];
  List<Map<String, dynamic>>? _valueOptionPrice = [];

  List<DropdownMenuItem<String>> items = [
    'Android',
    'IOS',
    'Flutter',
    'Node',
    'Java',
    'Python',
    'PHP',
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(
        value,
        style: TextStyle(color: MyConstant.themeApp, fontSize: 14),
      ),
    );
  }).toList();
  getImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        image_selected!.insert(0, File(image.path));
      });
    }
  }

  takePhoto() async {
    XFile? take_photo = await _picker.pickImage(source: ImageSource.camera);
    if (take_photo != null) {
      setState(() {
        image_selected!.insert(0, File(take_photo.path));
      });
    }
  }

  void _updateProductCategory(String value) {
    setState(() {
      _selectedValue = value;
    });
  }

  _addFieldPolicy(index) {
    Map<String, dynamic> jsonName = {
      "nameId": index,
      "value": '',
    };
    Map<String, dynamic> jsonPrice = {
      "priceId": index,
      "value": '',
    };
    setState(() {
      _valueOptionPrice!.add(jsonPrice);
      _valueOptionName!.add(jsonName);
    });
  }

  _updateNamePolicy(String index, String value) {
    for (var name in _valueOptionName!) {
      if (name['nameId'] == index) {
        name['value'] = value;
      }
    }
    print('name = $_valueOptionName');
  }

  _updateDescriptionPolicy(String index, String value) {
    for (var price in _valueOptionPrice!) {
      if (price['priceId'] == index) {
        price['value'] = value;
      }
    }
    print('price = $_valueOptionPrice');
  }

  _deletePolicy(index) {
    setState(() {
      _valueOptionName!.removeAt(index);
      _valueOptionPrice!.removeAt(index);
    });
  }

  _onSubmit() {
    print('_valueOptionPrice = $_valueOptionPrice');
    print('_valueOptionName = $_valueOptionName');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyConstant.backgroudApp,
      appBar: AppBar(
        title: const Text('สร้างข้อมูลห้องพัก'),
        backgroundColor: MyConstant.themeApp,
      ),
      body: Form(
        child: ListView(
          children: [
            fieldItemName(width),
            fieldTotalRoom(width),
            fieldRoomSize(width),
            fieldPrice(width),
            fieldBedSize(width),
            fieldBedDescription(width),
            fieldDiscount(width),
            fieldDescription(width),
            dropdownCategory(width),
            SizedBox(height: 35),
            Center(
              child: Text(
                'เลือกรูปภาพสำหรับห้องพัก',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: MyConstant.themeApp,
                ),
              ),
            ),
            buildPhoto(width),
            // const SizedBox(height: 10),
            // buildCreateOption(
            //   'เพิ่มรายการตัวเลือกเสริม',
            //   _addFieldPolicy,
            // ),
            // buildPolicyForm(width, height),
            buildCreateShopButton(width),
          ],
        ),
      ),
    );
  }

  Row fieldRoomSize(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: width * .7,
            height: 60,
            child: TextFormField(
              controller: _itemBedSize,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusRoomSize = false;
                }
                if (text.length >= 1) {
                  focusRoomSize = true;
                }
              }),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ขนาดห้อง',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefix: Icon(
                    Icons.room_preferences_sharp,
                    color: focusRoomSize
                        ? Colors.tealAccent[700]
                        : Colors.grey[500],
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10),
                  )),
              style: TextStyle(
                color: Colors.tealAccent[700],
                fontWeight: focusRoomSize ? FontWeight.w700 : FontWeight.normal,
              ),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusRoomSize ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
      ],
    );
  }

  Row fieldTotalRoom(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: width * .7,
            height: 60,
            child: TextFormField(
              controller: _itemTotalRoom,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusTotalRoom = false;
                }
                if (text.length >= 1) {
                  focusTotalRoom = true;
                }
              }),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'จำนวนห้องทั้งหมด(ของประเภทนี้):',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefix: Icon(
                    Icons.room_preferences_sharp,
                    color: focusTotalRoom
                        ? Colors.tealAccent[700]
                        : Colors.grey[500],
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10),
                  )),
              style: TextStyle(
                color: Colors.tealAccent[700],
                fontWeight:
                    focusTotalRoom ? FontWeight.w700 : FontWeight.normal,
              ),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusTotalRoom ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
      ],
    );
  }

  Row fieldBedSize(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: width * .7,
            height: 60,
            child: TextFormField(
              controller: _itemBedSize,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusBedSize = false;
                }
                if (text.length >= 1) {
                  focusBedSize = true;
                }
              }),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ขนาดเตียง',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefix: Icon(
                    Icons.bed,
                    color: focusBedSize
                        ? Colors.tealAccent[700]
                        : Colors.grey[500],
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10),
                  )),
              style: TextStyle(
                color: Colors.tealAccent[700],
                fontWeight: focusBedSize ? FontWeight.w700 : FontWeight.normal,
              ),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusBedSize ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
      ],
    );
  }

  Row fieldBedDescription(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: width * .7,
            height: 60,
            child: TextFormField(
              controller: _itemBedSize,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusBedDescription = false;
                }
                if (text.length >= 1) {
                  focusBedDescription = true;
                }
              }),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'รายละเอียดเตียง',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefix: Icon(
                    Icons.room_preferences_sharp,
                    color: focusBedDescription
                        ? Colors.tealAccent[700]
                        : Colors.grey[500],
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10),
                  )),
              style: TextStyle(
                color: Colors.tealAccent[700],
                fontWeight:
                    focusBedDescription ? FontWeight.w700 : FontWeight.normal,
              ),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusBedDescription ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
      ],
    );
  }

  Container buildCreateShopButton(double width) {
    return Container(
      margin: EdgeInsets.all(10),
      width: width * 0.4,
      height: 50,
      child: ElevatedButton(
        child: Text(
          'สร้างห้องพัก',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: _onSubmit,
        style: ElevatedButton.styleFrom(
          primary: MyConstant.themeApp,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  Container buildCreateOption(String titleOption, Function addFieldOption) {
    return Container(
      margin: const EdgeInsets.only(left: 35),
      child: Row(
        children: [
          Text(
            titleOption,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: MyConstant.themeApp,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: ElevatedButton(
              onPressed: () {
                addFieldOption(UniqueKey().toString());
              },
              child: Icon(
                Icons.add,
              ),
              style: ElevatedButton.styleFrom(
                primary: MyConstant.themeApp,
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildPolicyForm(double width, double height) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: width * .8,
      height: height * .45,
      child: _valueOptionPrice!.length > 0 ? ListViewPolicy(width) : null,
    );
  }

  ListView ListViewPolicy(double width) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _valueOptionPrice!.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildDismissible(
              index,
              width,
              _valueOptionPrice![index]['priceId'].toString(),
              _valueOptionName![index]['value'],
              _valueOptionPrice![index]['value'],
            ),
          ],
        );
      },
    );
  }

  Dismissible buildDismissible(int index, double width, String idField,
      String valueNamePolicy, String descriptionPolicy) {
    return Dismissible(
      key: Key(idField),
      direction: DismissDirection.endToStart,
      child: fieldOption(width, idField, valueNamePolicy, descriptionPolicy),
      onDismissed: (_) {
        _deletePolicy(index);
      },
      background: Container(
        color: Colors.red,
        margin: EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );
  }

  Container fieldOption(double width, String keyField, String valueNamePolicy,
      String descriptionPolicy) {
    return Container(
      width: width * 0.8,
      child: Column(
        children: [
          TextFormField(
            initialValue: valueNamePolicy,
            onChanged: (value) {
              _updateNamePolicy(keyField, value);
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: 'ชื่อตัวเลือกเสริม :',
              labelStyle: TextStyle(color: Colors.grey[600]),
              prefix: Icon(Icons.edit, color: MyConstant.themeApp),
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
          TextFormField(
            initialValue: descriptionPolicy,
            onChanged: (value) {
              _updateDescriptionPolicy(keyField, value);
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: 'ราคาตัวเลือกเสริม :',
              labelStyle: TextStyle(color: Colors.grey[600]),
              prefix: Icon(Icons.money, color: MyConstant.themeApp),
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
          Divider(
            color: MyConstant.themeApp,
            height: 20,
            thickness: 3.0,
          )
        ],
      ),
    );
  }

  Center dropdownCategory(double width) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        width: width * .7,
        height: 60,
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            items: items,
            onChanged: (String? value) => _updateProductCategory(value!),
            hint: Text(
              "เลือกประเภท",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            value: _selectedValue,
          ),
        ),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.white)],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Row buildPhoto(double width) {
    return Row(
      children: [
        Container(
          height: 15,
          width: width * .2,
          child: IconButton(
            onPressed: getImage,
            icon: Icon(
              Icons.photo_library_rounded,
              color: MyConstant.themeApp,
              size: 40,
            ),
          ),
        ),
        Container(
            width: width * .6,
            height: 150,
            child: image_selected!.length > 0
                ? Swiper(
                    itemCount: image_selected!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.file(
                        image_selected![index],
                        fit: BoxFit.cover,
                      );
                    },
                    pagination: SwiperPagination(),
                    control: SwiperControl(color: Colors.tealAccent[700]),
                    viewportFraction: 1,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.image,
                        color: const Color.fromRGBO(41, 187, 137, 0.7),
                        size: 60,
                      ),
                    ],
                  ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0, 5),
                  ),
                ])),
        Container(
          height: 15,
          width: width * .2,
          child: IconButton(
            onPressed: takePhoto,
            icon: Icon(
              Icons.camera_alt_rounded,
              color: MyConstant.themeApp,
              size: 40,
            ),
          ),
        )
      ],
    );
  }

  Row fieldPrice(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: width * .7,
            height: 60,
            child: TextFormField(
              controller: _itemPrice,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusPrice = false;
                }
                if (text.length >= 1) {
                  focusPrice = true;
                }
              }),
              validator: (value) {
                if (value!.isEmpty) return 'กรุณากรอกเบอร์โทรศัพท์';
                return null;
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ราคา :',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefix: Icon(
                    Icons.attach_money,
                    color:
                        focusPrice ? Colors.tealAccent[700] : Colors.grey[500],
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10),
                  )),
              style: TextStyle(
                  color: Colors.tealAccent[700],
                  fontWeight: focusPrice ? FontWeight.w700 : FontWeight.normal),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusName ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
      ],
    );
  }

  Row fieldDiscount(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: width * .7,
            height: 60,
            child: TextFormField(
              controller: _itemDiscount,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusPrice = false;
                }
                if (text.length >= 1) {
                  focusPrice = true;
                }
              }),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ส่วนลด % :',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefix: Icon(
                    Icons.money_off,
                    color:
                        focusPrice ? Colors.tealAccent[700] : Colors.grey[500],
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10),
                  )),
              style: TextStyle(
                color: Colors.tealAccent[700],
                fontWeight: focusPrice ? FontWeight.w700 : FontWeight.normal,
              ),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusName ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
      ],
    );
  }

  Row fieldItemName(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30),
          width: width * .7,
          height: 60,
          child: TextFormField(
            controller: _itemName,
            onChanged: (text) => setState(() {
              if (text.isEmpty) {
                focusName = false;
              }
              if (text.length >= 1) {
                focusName = true;
              }
            }),
            validator: (value) {
              if (value!.isEmpty) return 'กรุณากรอกเบอร์โทรศัพท์';
              return null;
            },
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'ชื่อห้องพัก :',
                labelStyle: TextStyle(color: Colors.grey[600]),
                prefix: Icon(
                  Icons.card_membership,
                  color: focusName ? Colors.tealAccent[700] : Colors.grey[500],
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),
                )),
            style: TextStyle(
                color: Colors.tealAccent[700],
                fontWeight: focusName ? FontWeight.w700 : FontWeight.normal),
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: focusName ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ],
          ),
        ),
      ],
    );
  }

  Row fieldDescription(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: width * .7,
          child: TextFormField(
            maxLines: 2,
            controller: _itemDescription,
            onChanged: (text) => setState(() {
              if (text.isEmpty) {
                focusDescription = false;
              }
              if (text.length >= 1) {
                focusDescription = true;
              }
            }),
            validator: (value) {
              if (value!.isEmpty) return 'กรุณากรอกที่อยู่';
              return null;
            },
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'รายละเอียดห้องพัก',
                labelStyle: TextStyle(color: Colors.grey[600]),
                prefix: Icon(
                  Icons.description,
                  color: focusDescription
                      ? Colors.tealAccent[700]
                      : Colors.grey[500],
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),
                )),
            style: TextStyle(
                color: Colors.tealAccent[700],
                fontWeight:
                    focusDescription ? FontWeight.w700 : FontWeight.normal),
          ),
        )
      ],
    );
  }
}
