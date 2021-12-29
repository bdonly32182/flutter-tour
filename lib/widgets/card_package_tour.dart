import 'package:flutter/material.dart';
import 'package:tour_app/pages/buyer/booking_tour.dart';

class CardPackageTour extends StatelessWidget {
  final String url_image;
  final String package_name;
  final String highlight_location;
  final double price;
  const CardPackageTour(
      {Key? key,
      required this.url_image,
      required this.package_name,
      required this.highlight_location,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 17,
            spreadRadius: -22,
            color: Colors.grey,
          ),
        ],
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (builder) => BookingTour(),
              ),
            );
          },
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: width * 1,
                    child: Image.asset(
                      url_image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, top: 5),
                  child: Text(
                    package_name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    highlight_location,
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$price บาท',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        child: const Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.navigate_next_sharp,
                            size: 45,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
