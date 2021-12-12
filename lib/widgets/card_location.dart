import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CardLocation extends StatelessWidget {
  final String urlPicture;
  final String name;
  final double rating;
  final int ratingCoute;
  final String location;
  const CardLocation({
    Key? key,
    required this.urlPicture,
    required this.name,
    required this.rating,
    required this.ratingCoute,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: Colors.red,
            ),
          ],
        ),
        child: Material(
          child: Ink.image(
            colorFilter: ColorFilter.mode(Colors.white30, BlendMode.multiply),
            image: AssetImage(urlPicture),
            fit: BoxFit.cover,
            child: InkWell(
              onTap: () {
                print('click ');
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        width: width * 1,
                        height: height > 730 ? height * .12 : height * .24,
                        decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 10),
                              child: Text(
                                name,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                location,
                                style: TextStyle(color: Colors.white),
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: RatingBar.builder(
                                    itemSize: 20.0,
                                    initialRating: rating,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 1.0),
                                    itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                    onRatingUpdate: (ratingUpdate) {
                                      print(ratingUpdate);
                                    })),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'รายละเอียดเพิ่มเติม >>',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
