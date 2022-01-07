import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodList extends StatelessWidget {
  final int selected;
  final Function callback;
  final otherColor, sidePadding;

  FoodList(this.selected, this.callback, this.otherColor, this.sidePadding);

  final List<String> menuList = [
    'Popular',
    'Recommended',
    'Fast Food',
    'Cuisines',
    'Drinks',
  ];
  var textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: sidePadding, right: sidePadding),
      height: 50,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                child: Row(
                  children: [
                    Container(
                      child: Center(child: InkWell(
                        child: Text(menuList[index], style: GoogleFonts.poppins(
                          color: selected == index ? textColor : Colors.black
                        ),),
                      ),),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          color: selected == index
                              ? Color(otherColor)
                              : Colors.white38,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ],
                ),
                onTap: () => callback(index),
              ),
          separatorBuilder: (buildContext, index) => SizedBox(width: 20),
          itemCount: menuList.length),
    );
  }
}
