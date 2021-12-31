import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';

class AddToCart extends StatefulWidget {
  String productImage;
  int productPrice;
  String productName;
  List<Map<String, dynamic>> option;
  AddToCart(
      {Key? key,
      required this.productImage,
      required this.option,
      required this.productName,
      required this.productPrice})
      : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int amountProduct = 1;
  int totalPrice = 0;
  int totalOptionPrice = 0;
  List<bool>? _isChecked;
  @override
  void initState() {
    super.initState();
    totalPrice = widget.productPrice;
    _isChecked = List<bool>.filled(widget.option.length, false);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: MyConstant.backgroudApp,
      appBar: AppBar(
        backgroundColor: MyConstant.themeApp,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                buildImageMenu(width, height),
                buildMenuName(),
                if (widget.option.length > 0) buildOptionTitle(),
                const SizedBox(
                  height: 10,
                ),
                listviewOption(width),
              ],
            ),
          ),
          buildButtonAddtoCart(height)
        ],
      ),
    );
  }

  Container buildButtonAddtoCart(double height) {
    return Container(
      height: height * 0.15,
      child: Column(
        children: [
          addAmoutProduct(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'ราคาทั้งหมด',
                    style: TextStyle(
                      fontSize: 14,
                      color: MyConstant.themeApp,
                    ),
                  ),
                  Text(
                    '${totalPrice} ฿',
                    style: TextStyle(
                      fontSize: 20,
                      color: MyConstant.themeApp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                child: Text(
                  'ใส่ในตะกร้า',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  print('send to firebase');
                },
                style: ElevatedButton.styleFrom(
                  primary: MyConstant.themeApp,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
            top: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(0, 6),
              blurRadius: 10,
            ),
          ]),
    );
  }

  Row addAmoutProduct() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: amountProduct == 1
              ? null
              : () {
                  setState(() {
                    amountProduct -= 1;
                    totalPrice = widget.productPrice * amountProduct +
                        (totalOptionPrice * amountProduct);
                  });
                },
          icon: Icon(
            Icons.remove_circle_outline_rounded,
            color: amountProduct == 1 ? Colors.grey[400] : Colors.grey[700],
          ),
          iconSize: 40,
          disabledColor: Colors.grey[400],
        ),
        Text(
          amountProduct.toString(),
          style: TextStyle(
              fontSize: 20,
              color: MyConstant.themeApp,
              fontWeight: FontWeight.w700),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              amountProduct += 1;
              totalPrice = widget.productPrice * amountProduct +
                  (totalOptionPrice * amountProduct);
            });
          },
          icon: Icon(
            Icons.add_circle_outline,
            color: Colors.grey[700],
          ),
          iconSize: 40,
        ),
      ],
    );
  }

  ListView listviewOption(double width) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.option.length,
      itemBuilder: (BuildContext buildContext, int index) {
        return Container(
          height: 50,
          margin: EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  activeColor: MyConstant.themeApp,
                  value: _isChecked![index],
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked![index] = value!;
                      int newPrice =
                          widget.option[index]['optionPrice'] * amountProduct;
                      if (value == true) {
                        totalOptionPrice += int.parse(
                            widget.option[index]['optionPrice'].toString());
                        totalPrice += newPrice;
                      } else {
                        totalOptionPrice -= int.parse(
                            widget.option[index]['optionPrice'].toString());
                        totalPrice -= newPrice;
                      }
                    });
                  }),
              Text(widget.option[index]['optionName']),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text('${widget.option[index]['optionPrice']}  ฿'),
              )
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
        );
      },
    );
  }

  Padding buildOptionTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 12),
      child: Text(
        "ตัวเลือกเพิ่มเติม",
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Row buildMenuName() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            'ชื่อรายการอาหาร',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Container buildImageMenu(double width, double height) {
    return Container(
      width: width * 1,
      height: height * 0.26,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            width: width * 1,
            height: height * 0.22,
            child: ShowImage(
              pathImage: widget.productImage,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(top: height * 0.212),
                width: width * 0.3,
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '฿ ${widget.productPrice}',
                      style: TextStyle(
                        color: MyConstant.themeApp,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '/ชิ้น',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
