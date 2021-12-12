import 'dart:io';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tour_app/model/user_model.dart';
import 'package:tour_app/utils/geolocation.dart';
import 'package:tour_app/utils/my_constant.dart';

class BuyerCreateBrand extends StatefulWidget {
  BuyerCreateBrand({Key? key}) : super(key: key);

  @override
  _BuyerCreateBrandState createState() => _BuyerCreateBrandState();
}

enum SingingCharacter { homestay, resteraunt, otop }

class _BuyerCreateBrandState extends State<BuyerCreateBrand> {
  SingingCharacter? _character = SingingCharacter.resteraunt;
  final ImagePicker _picker = ImagePicker();
  Position? positionBuyer;
  void initState() {
    super.initState();
    checkPermission();
  }

  void checkPermission() async {
    positionBuyer = await DeterminePosition();
    print(positionBuyer);
  }

  File? image_selected;
  TextEditingController thaiName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController timeStart =
      TextEditingController(text: '$TimeOfDay.now().hour');
  TextEditingController timeEnd = TextEditingController();
  TextEditingController test = TextEditingController();
  bool focusName = false;
  bool focusFirstName = false;
  bool focusLastName = false;
  bool focusMobile = false;
  bool focusAddress = false;
  bool focusStartTime = false;
  bool focusEndTime = false;
  bool focusStartDate = false;
  bool focusEndDate = false;
  final List dateOnly = ['จ.', 'อ.', 'พ.', 'พฤ.', 'ศ.', 'ส.', 'อา.'];
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  List<Map<String, dynamic>>? _valueOptionName = [];
  List<Map<String, dynamic>>? _valueOptionPrice = [];
  getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        image_selected = File(image.path);
      });
    }
  }

  takePhoto() async {
    final XFile? take_photo = await _picker.pickImage(
        source: ImageSource.camera, maxWidth: 800, maxHeight: 500);
    if (take_photo != null) {
      setState(() {
        image_selected = File(take_photo.path);
      });
    }
  }

  _addFieldOption(index) {
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

  _updateNameOption(String index, String value) {
    for (var name in _valueOptionName!) {
      if (name['nameId'] == index) {
        // name['nameId'] = index;
        name['value'] = value;
      }
    }
    print('name = $_valueOptionName');
  }

  _updatePriceOption(String index, String value) {
    for (var price in _valueOptionPrice!) {
      if (price['priceId'] == index) {
        // price['priceId'] = index;
        price['value'] = value;
      }
    }
    print('price = $_valueOptionPrice');
  }

  _deleteOption(index) {
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
      appBar: AppBar(
        title: Text('สร้างร้านให้ผู้ประกอบการ'),
        backgroundColor: Colors.tealAccent[700],
      ),
      body: SafeArea(
        child: Form(
          child: ListView(
            padding: EdgeInsets.only(top: 20),
            children: [
              inputName(width),
              buildIdentifier(width),
              inputPhone(width),
              inputAddress(width),
              dropdownDate(width),
              buildTimepicker(width),
              const SizedBox(height: 25),
              buildPhoto(width),
              const SizedBox(height: 10),
              buildRadioType(),
              const SizedBox(height: 20),
              buildCreateOption(),
              buildOptionForm(width, height),
              ElevatedButton(
                child: Text('create'),
                onPressed: _onSubmit,
              )
            ],
          ),
        ),
      ),
    );
  }

  Column buildRadioType() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          title: const Text('บ้านพัก'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.homestay,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('ร้านอาหาร'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.resteraunt,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('ผลิตภัณฑ์ชุมชน'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.otop,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Container buildOptionForm(double width, double height) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: width * .8,
      height: height * .45,
      child: _valueOptionPrice!.length > 0 ? ListViewOption(width) : null,
    );
  }

  ListView ListViewOption(double width) {
    return ListView.builder(
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
          String valueName, String valuePrice) =>
      Dismissible(
        key: Key(idField),
        direction: DismissDirection.endToStart,
        child: fieldOption(width, idField, valueName, valuePrice),
        onDismissed: (_) {
          _deleteOption(index);
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

  Container fieldOption(
      double width, String keyField, String valueName, String valuePrice) {
    return Container(
      width: width * .6,
      child: Column(
        children: [
          TextFormField(
            initialValue: valueName,
            onChanged: (value) {
              _updateNameOption(keyField, value);
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: 'ชื่อตัวเลือกเสริม :',
              labelStyle: TextStyle(color: Colors.grey[600]),
              prefix: Icon(Icons.location_on, color: Colors.tealAccent[700]),
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
            initialValue: valuePrice,
            onChanged: (value) {
              _updatePriceOption(keyField, value);
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: 'ราคาตัวเลือกเสริม :',
              labelStyle: TextStyle(color: Colors.grey[600]),
              prefix: Icon(Icons.location_on, color: Colors.tealAccent[700]),
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
            color: Colors.tealAccent[700],
            height: 20,
            thickness: 3.0,
          )
        ],
      ),
    );
  }

  Container buildCreateOption() {
    return Container(
      margin: const EdgeInsets.only(left: 35),
      child: Row(
        children: [
          const Text(
            'เพิ่มตัวเลือกเสริม',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: ElevatedButton(
              onPressed: () {
                _addFieldOption(UniqueKey().toString());
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }

  Row buildIdentifier(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 15),
            width: width * .4,
            height: 60,
            child: TextFormField(
              controller: firstName,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusFirstName = false;
                }
                if (text.length >= 1) {
                  focusFirstName = true;
                }
              }),
              validator: (value) {
                if (value!.isEmpty) return 'กรุณากรอกชื่อเจ้าของร้าน';
                return null;
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ชื่อ:',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefix: Icon(
                    Icons.person,
                    color: focusFirstName
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
                      focusFirstName ? FontWeight.w700 : FontWeight.normal),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusFirstName ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
        Container(
            margin: EdgeInsets.only(top: 15, left: 5),
            width: width * .4,
            height: 60,
            child: TextFormField(
              controller: lastName,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusLastName = false;
                }
                if (text.length >= 1) {
                  focusLastName = true;
                }
              }),
              validator: (value) {
                if (value!.isEmpty) return 'กรุณากรอกนามสกุลเจ้าของร้าน';
                return null;
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'นามสกุล:',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefix: Icon(
                    Icons.person,
                    color: focusLastName
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
                      focusLastName ? FontWeight.w700 : FontWeight.normal),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusLastName ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ]))
      ],
    );
  }

  Row buildTimepicker(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width * .35,
          child: DateTimePicker(
            initialTime: TimeOfDay.now(),
            type: DateTimePickerType.time,
            timeLabelText: 'เวลาที่เปิดร้าน',
            onChanged: (val) {
              startTime = val;
              setState(() {
                if (val.isEmpty) {
                  focusStartTime = false;
                } else {
                  focusStartTime = true;
                }
              });
            },
            validator: (date) {
              if (date!.isEmpty) {
                return 'กรุณาเลือกวันที่เปิดร้าน';
              }
              return null;
            },
            // onSaved: (value) => startDate = value,
            style: TextStyle(
                color: Colors.tealAccent[700],
                fontWeight:
                    focusStartTime ? FontWeight.w700 : FontWeight.normal),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text('ถึง'),
        SizedBox(
          width: 10,
        ),
        Container(
            width: width * .35,
            child: DateTimePicker(
                initialTime: TimeOfDay.now(),
                type: DateTimePickerType.time,
                timeLabelText: 'เวลาที่ปิดร้าน',
                onChanged: (val) {
                  endTime = val;
                  setState(() {
                    if (val.isEmpty) {
                      focusEndTime = false;
                    } else {
                      focusEndTime = true;
                    }
                  });
                },
                validator: (date) {
                  if (date!.isEmpty) {
                    return 'กรุณาเลือกวันที่เปิดร้าน';
                  }
                  return null;
                },
                // onSaved: (value) => startDate = value,
                style: TextStyle(
                    color: Colors.tealAccent[700],
                    fontWeight:
                        focusEndTime ? FontWeight.w700 : FontWeight.normal))),
      ],
    );
  }

  Row dropdownDate(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width * .35,
          child: DropdownButton<String>(
            value: startDate,
            icon: Icon(Icons.calendar_today,
                color:
                    focusStartDate ? Colors.tealAccent[700] : Colors.grey[400]),
            iconSize: 20,
            underline: Container(
              height: 2,
              color: focusStartDate ? Colors.tealAccent[700] : Colors.grey[400],
            ),
            onChanged: (newValue) {
              setState(() {
                startDate = newValue;
                if (newValue!.isEmpty) {
                  focusStartDate = false;
                } else {
                  focusStartDate = true;
                }
              });
            },
            items: dateOnly.map<DropdownMenuItem<String>>((e) {
              return DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              );
            }).toList(),
            hint: Text('วันที่เปิด'),
            style: TextStyle(
                color: Colors.tealAccent[700],
                fontWeight:
                    focusStartDate ? FontWeight.w700 : FontWeight.normal),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text('ถึง'),
        SizedBox(
          width: 10,
        ),
        Container(
          width: width * .35,
          child: DropdownButton<String>(
            value: endDate,
            hint: Text('วันที่ปิด'),
            icon: Icon(
              Icons.calendar_today,
              color: focusEndDate ? Colors.tealAccent[700] : Colors.grey[400],
            ),
            iconSize: 20,
            underline: Container(
              height: 2,
              color: focusEndDate ? Colors.tealAccent[700] : Colors.grey[400],
            ),
            onChanged: (String? newValue) {
              setState(() {
                endDate = newValue;
                if (newValue!.isEmpty) {
                  focusEndDate = false;
                } else {
                  focusEndDate = true;
                }
              });
            },
            items: <String>['จ.', 'อ.', 'พ.', 'พฤ.', 'ศ.', 'ส.', 'อา.']
                .map<DropdownMenuItem<String>>((e) {
              return DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              );
            }).toList(),
            style: TextStyle(
                color: Colors.tealAccent[700],
                fontWeight: focusEndDate ? FontWeight.w700 : FontWeight.normal),
          ),
        ),
      ],
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
            icon: Icon(Icons.photo_library_outlined),
          ),
        ),
        Container(
            width: width * .6,
            height: 150,
            child: image_selected != null
                ? Image.file(
                    image_selected!,
                    fit: BoxFit.cover,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.image,
                        color: Colors.white,
                        size: 60,
                      ),
                      Text(
                        'รูปภาพสำหรับหน้าปกร้าน',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      blurRadius: image_selected != null ? 15 : 0,
                      color: image_selected != null
                          ? Colors.black54
                          : Colors.deepPurple.shade100,
                      offset: const Offset(0, 5))
                ])),
        Container(
          height: 15,
          width: width * .2,
          child: IconButton(
            onPressed: takePhoto,
            icon: Icon(Icons.camera_alt_outlined),
          ),
        )
      ],
    );
  }

  Row inputAddress(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: width * .8,
            height: 100,
            child: TextFormField(
              maxLines: 3,
              controller: address,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusAddress = false;
                }
                if (text.length >= 1) {
                  focusAddress = true;
                }
              }),
              validator: (value) {
                if (value!.isEmpty) return 'กรุณากรอกที่อยู่';
                return null;
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ที่อยู๋ ... หมู่ ... ถนน ... :',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefix: Icon(
                    Icons.location_on,
                    color: focusAddress
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
                      focusAddress ? FontWeight.w700 : FontWeight.normal),
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

  Row inputPhone(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: width * .8,
            height: 60,
            child: TextFormField(
              controller: mobileNumber,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusMobile = false;
                }
                if (text.length >= 1) {
                  focusMobile = true;
                }
              }),
              validator: (value) {
                if (value!.isEmpty) return 'กรุณากรอกเบอร์โทรศัพท์';
                return null;
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'เบอร์โทรศัพท์ :',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefix: Icon(
                    Icons.phone_in_talk_sharp,
                    color:
                        focusMobile ? Colors.tealAccent[700] : Colors.grey[500],
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
                      focusMobile ? FontWeight.w700 : FontWeight.normal),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusMobile ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
      ],
    );
  }

  Row inputName(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: width * .8,
            height: 60,
            child: TextFormField(
              controller: thaiName,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusName = false;
                }
                if (text.length >= 1) {
                  focusName = true;
                }
              }),
              validator: (value) {
                if (value!.isEmpty) return 'กรุณากรอกชื่อร้าน';
                return null;
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ชื่อร้าน :',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefix: Icon(
                    Icons.store_outlined,
                    color:
                        focusName ? Colors.tealAccent[700] : Colors.grey[500],
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
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: focusName ? Colors.black26 : Colors.white,
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ])),
      ],
    );
  }
}
