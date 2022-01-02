import 'dart:io';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tour_app/model/user_model.dart';
import 'package:tour_app/utils/geolocation.dart';
import 'package:tour_app/utils/my_constant.dart';

class SellerCreateShop extends StatefulWidget {
  SellerCreateShop({Key? key}) : super(key: key);

  @override
  _SellerCreateShopState createState() => _SellerCreateShopState();
}

class _SellerCreateShopState extends State<SellerCreateShop> {
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
  TextEditingController shippingPrice = TextEditingController();

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
  List<Map<String, dynamic>>? _valuePolicyName = [];
  List<Map<String, dynamic>>? _valuePolicyDescription = [];
  List<Map<String, dynamic>>? _valueCategorys = [];
  getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        image_selected = File(image.path);
      });
    }
  }

  takePhoto() async {
    final XFile? takePhoto = await _picker.pickImage(
        source: ImageSource.camera, maxWidth: 800, maxHeight: 500);
    if (takePhoto != null) {
      setState(() {
        image_selected = File(takePhoto.path);
      });
    }
  }

  _addFieldPolicy(index) {
    Map<String, dynamic> jsonName = {
      "nameId": index,
      "value": '',
    };
    Map<String, dynamic> jsonPrice = {
      "descriptionPolicyId": index,
      "value": '',
    };
    setState(() {
      _valuePolicyDescription!.add(jsonPrice);
      _valuePolicyName!.add(jsonName);
    });
  }

  _updateNamePolicy(String index, String value) {
    for (var name in _valuePolicyName!) {
      if (name['nameId'] == index) {
        // name['nameId'] = index;
        name['value'] = value;
      }
    }
    print('name = $_valuePolicyName');
  }

  _updateDescriptionPolicy(String index, String value) {
    for (var price in _valuePolicyDescription!) {
      if (price['descriptionPolicyId'] == index) {
        price['value'] = value;
      }
    }
    print('price = $_valuePolicyDescription');
  }

  _deletePolicy(index) {
    setState(() {
      _valuePolicyName!.removeAt(index);
      _valuePolicyDescription!.removeAt(index);
    });
  }

  _addFieldCategory(index) {
    Map<String, dynamic> jsonCategory = {
      "categoryId": index,
      "value": '',
    };
    setState(() {
      _valueCategorys!.add(jsonCategory);
    });
  }

  _updateNameCategory(String index, String value) {
    for (var name in _valueCategorys!) {
      if (name['categoryId'] == index) {
        name['value'] = value;
      }
    }
    print('name = $_valuePolicyName');
  }

  _deleteCategory(index) {
    setState(() {
      _valueCategorys!.removeAt(index);
    });
  }

  _onSubmit() {
    print('_valueOptionPrice = $_valuePolicyDescription');
    print('_valueOptionName = $_valuePolicyName');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: MyConstant.backgroudApp,
      appBar: AppBar(
        title: Text('สร้างร้านให้ผู้ประกอบการ'),
        backgroundColor: MyConstant.themeApp,
      ),
      body: SafeArea(
        child: Form(
          child: ListView(
            padding: EdgeInsets.only(top: 20),
            children: [
              inputName(width),
              buildIdentifier(width),
              inputPhone(width),
              inputShippingPrice(width),
              inputAddress(width),
              dropdownDate(width),
              buildTimepicker(width),
              const SizedBox(height: 25),
              buildTextSelectImage(),
              buildPhoto(width),
              const SizedBox(height: 20),
              buildCreateOption(
                'เพิ่มประเภทสินค้า / บ้านพัก',
                _addFieldCategory,
              ),
              buildCategoryForm(width, height),
              const SizedBox(height: 10),
              buildCreateOption(
                'เพิ่มนโยบายของร้าน / บ้านพัก',
                _addFieldPolicy,
              ),
              buildPolicyForm(width, height),
              buildCreateShopButton(width),
            ],
          ),
        ),
      ),
    );
  }

  Container buildCategoryForm(double width, double height) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: width * .8,
      height: height * .3,
      child: _valueCategorys!.length > 0 ? ListViewCategory(width) : null,
    );
  }

  ListView ListViewCategory(double width) {
    return ListView.builder(
      itemCount: _valueCategorys!.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildDismissCategory(
              index,
              width,
              _valueCategorys![index]['categoryId'].toString(),
              _valueCategorys![index]['value'],
            ),
          ],
        );
      },
    );
  }

  Dismissible buildDismissCategory(
      int index, double width, String idField, String valueCategoryName) {
    return Dismissible(
      key: Key(idField),
      direction: DismissDirection.endToStart,
      child: fieldFormCategory(width, idField, valueCategoryName),
      onDismissed: (_) {
        _deleteCategory(index);
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

  SizedBox fieldFormCategory(
    double width,
    String keyField,
    String valueCategoryName,
  ) {
    return SizedBox(
      width: width * 0.8,
      child: Column(
        children: [
          TextFormField(
            initialValue: valueCategoryName,
            onChanged: (value) {
              _updateNameCategory(keyField, value);
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: 'ชื่อประเภทสินค้า :',
              labelStyle: TextStyle(color: Colors.grey[600]),
              prefix: Icon(Icons.book, color: MyConstant.themeApp),
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

  Row buildTextSelectImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'เลือกรูปภาพสำหรับบ้านพัก',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: MyConstant.themeApp,
            ),
          ),
        )
      ],
    );
  }

  Container buildCreateShopButton(double width) {
    return Container(
      width: width * 0.4,
      height: 50,
      child: ElevatedButton(
        child: Text(
          'สร้างร้านค้า',
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

  Container buildPolicyForm(double width, double height) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: width * .8,
      height: height * .45,
      child: _valuePolicyDescription!.length > 0 ? ListViewPolicy(width) : null,
    );
  }

  ListView ListViewPolicy(double width) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _valuePolicyDescription!.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildDismissible(
              index,
              width,
              _valuePolicyDescription![index]['descriptionPolicyId'].toString(),
              _valuePolicyName![index]['value'],
              _valuePolicyDescription![index]['value'],
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
              labelText: 'หัวข้อนโยบาย :',
              labelStyle: TextStyle(color: Colors.grey[600]),
              prefix: Icon(Icons.book, color: MyConstant.themeApp),
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
            maxLines: 10,
            initialValue: descriptionPolicy,
            onChanged: (value) {
              _updateDescriptionPolicy(keyField, value);
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: 'อธิบายนโยบาย :',
              labelStyle: TextStyle(color: Colors.grey[600]),
              prefix: Icon(Icons.policy_rounded, color: MyConstant.themeApp),
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
                    color:
                        focusFirstName ? MyConstant.themeApp : Colors.grey[500],
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
                color: MyConstant.themeApp,
                fontWeight:
                    focusFirstName ? FontWeight.w700 : FontWeight.normal,
              ),
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
                    color:
                        focusLastName ? MyConstant.themeApp : Colors.grey[500],
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
                  color: MyConstant.themeApp,
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
          margin: EdgeInsets.only(top: 10),
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
              color: MyConstant.themeApp,
              fontWeight: focusStartTime ? FontWeight.w700 : FontWeight.normal,
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
        Text('ถึง'),
        SizedBox(
          width: 10,
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
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
              color: MyConstant.themeApp,
              fontWeight: focusEndTime ? FontWeight.w700 : FontWeight.normal,
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

  Row dropdownDate(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          width: width * .35,
          height: 60,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: startDate,
              icon: Icon(Icons.calendar_today,
                  color:
                      focusStartDate ? MyConstant.themeApp : Colors.grey[400]),
              iconSize: 20,
              underline: Container(
                height: 2,
                color: focusStartDate ? MyConstant.themeApp : Colors.grey[400],
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
                color: MyConstant.themeApp,
                fontWeight:
                    focusStartDate ? FontWeight.w700 : FontWeight.normal,
              ),
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
        Text('ถึง'),
        SizedBox(
          width: 10,
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          width: width * .35,
          height: 60,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: endDate,
              hint: Text('วันที่ปิด'),
              icon: Icon(
                Icons.calendar_today,
                color: focusEndDate ? MyConstant.themeApp : Colors.grey[400],
              ),
              iconSize: 20,
              underline: Container(
                height: 2,
                color: focusEndDate ? MyConstant.themeApp : Colors.grey[400],
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
                  color: MyConstant.themeApp,
                  fontWeight:
                      focusEndDate ? FontWeight.w700 : FontWeight.normal),
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

  Row buildPhoto(double width) {
    return Row(
      children: [
        SizedBox(
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
                      color: Color.fromRGBO(41, 187, 137, 0.7),
                      size: 60,
                    ),
                  ],
                ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: image_selected != null ? Colors.black54 : Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black54,
                offset: const Offset(0, 5),
              ),
            ],
          ),
        ),
        SizedBox(
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
                    color:
                        focusAddress ? MyConstant.themeApp : Colors.grey[500],
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
                color: MyConstant.themeApp,
                fontWeight: focusAddress ? FontWeight.w700 : FontWeight.normal,
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
                    color: focusMobile ? MyConstant.themeApp : Colors.grey[500],
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
                color: MyConstant.themeApp,
                fontWeight: focusMobile ? FontWeight.w700 : FontWeight.normal,
              ),
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

  Row inputShippingPrice(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: width * .8,
            height: 60,
            child: TextFormField(
              controller: shippingPrice,
              onChanged: (text) => setState(() {
                if (text.isEmpty) {
                  focusMobile = false;
                }
                if (text.length >= 1) {
                  focusMobile = true;
                }
              }),
              validator: (value) {
                if (value!.isEmpty) return 'กรุณากรอกค่าจัดส่ง';
                return null;
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ค่าจัดส่ง :',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefix: Icon(
                    Icons.delivery_dining,
                    color: focusMobile ? MyConstant.themeApp : Colors.grey[500],
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
                color: MyConstant.themeApp,
                fontWeight: focusMobile ? FontWeight.w700 : FontWeight.normal,
              ),
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
                    color: focusName ? MyConstant.themeApp : Colors.grey[500],
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
                  color: MyConstant.themeApp,
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
