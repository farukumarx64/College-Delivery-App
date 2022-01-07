import 'package:campus_delivery/routes/home_page.dart';
import 'package:campus_delivery/routes/restaurant%20info/food_list.dart';
import 'package:campus_delivery/routes/restaurant%20info/food_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantInfo extends StatefulWidget {
  final restaurantName,
      restaurantListIndex,
      restaurantImage,
      barColor,
      restaurantDetail,
      otherColor;

  RestaurantInfo(
      {this.restaurantName,
      this.restaurantListIndex,
      this.restaurantImage,
      this.barColor,
      this.restaurantDetail,
      this.otherColor});

  @override
  _RestaurantInfoState createState() => _RestaurantInfoState();
}

class _RestaurantInfoState extends State<RestaurantInfo> {
  final double sidePadding = 15;
  var selected = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(sidePadding, 50, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1))
                      ],
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new_sharp,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
                InkWell(
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1))
                      ],
                    ),
                    child: Icon(
                      Icons.file_upload_outlined,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(sidePadding, 30, sidePadding, 0),
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                widget.restaurantImage[widget.restaurantListIndex],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            child: Container(
              padding: EdgeInsets.fromLTRB(sidePadding, 20, 0, 0),
              child: Text(
                widget.restaurantName[widget.restaurantListIndex],
                style: GoogleFonts.roboto(
                    color: Color(
                      widget.otherColor,
                    ),
                    fontSize: 36,
                    fontWeight: FontWeight.w600),
              ),
            ),
            alignment: Alignment.topLeft,
          ),
          Align(
            child: Container(
              padding: EdgeInsets.fromLTRB(sidePadding, 5, 0, 0),
              child: Text(
                widget.restaurantDetail[widget.restaurantListIndex],
                style: GoogleFonts.poppins(
                    color: Color(widget.otherColor),
                    fontSize: 18,
                    fontWeight: FontWeight.w100),
              ),
            ),
            alignment: Alignment.topLeft,
          ),
          Align(
            child: Container(
              padding: EdgeInsets.fromLTRB(sidePadding, 20, 0, 0),
              child: Text(
                'MENU',
                style: GoogleFonts.poppins(
                    color: Color(widget.otherColor),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            alignment: Alignment.topLeft,
          ),
          FoodList(selected, (int index) {
            setState(() {
              selected = index;
            });
          }, widget.otherColor, sidePadding),
          Expanded(
            child: FoodListView(
              pageController,
              selected,
              (int index) {
                setState(
                  () {
                    selected = index;
                  },
                );
              },
              widget.restaurantName,
              widget.restaurantListIndex,
              widget.restaurantImage,
              widget.barColor,
              widget.restaurantDetail,
              widget.otherColor
            ),
          ),
        ],
      ),
    );
  }
}
