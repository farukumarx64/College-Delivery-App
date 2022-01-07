import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:campus_delivery/routes/restaurant%20info/restaurant_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:campus_delivery/food_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  var barColor = 0xFF43A047;
  var otherColor = 0xFF1B5E20;
  late ScrollController controller;
  TextEditingController textController = TextEditingController();

  var foodData = FoodData();


  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    controller = ScrollController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains) {
          return Column(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 40),
                  Text(
                    'AUI Delivery',
                    style: GoogleFonts.jacquesFrancois(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Color(barColor)),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AnimSearchBar(
                      suffixIcon: Icon(Icons.search,
                      color: Color(otherColor),),
                        rtl: true,
                        autoFocus: true,
                        width: 330,
                        textController: textController,
                        closeSearchOnSuffixTap: false,
                        onSuffixTap: () {}),
                    SizedBox(
                      width: 15,
                    )
                  ],
                ),
              ),
              homePageListView(),
            ],
          );
        },
      ),
      bottomNavigationBar: bottomCustomAppBar(),
    );
  }

  Expanded homePageListView() {

    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
        physics: ScrollPhysics(),
        itemCount: foodData.locationsData.length,
        scrollDirection: Axis.vertical,
        reverse: false,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, mainAxisExtent: 190),
        controller: controller,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 220,
                  width: 155,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 0.5,
                          offset: const Offset(0, 0.5))
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10)),
                        child: Image.asset(
                          foodData.imgUrlsData[index],
                          width: 165,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 5),
                      FittedBox(
                        child: Text(
                          foodData.locationsData[index],
                          textScaleFactor: 1.5,
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w700,
                              color: Color(otherColor)),
                        ),
                      ),
                      SizedBox(height: 2.5),
                    ],
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RestaurantInfo(
                    restaurantName: foodData.locationsData,
                    restaurantListIndex: index,
                    restaurantImage: foodData.imgUrlsData,
                    barColor: barColor,
                    restaurantDetail: foodData.locationDetailsData,
                    otherColor: otherColor,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  SizedBox bottomCustomAppBar() {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(22.5, 0, 22.5, 0),
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: SalomonBottomBar(
                  currentIndex: _currentIndex,
                  onTap: (i) => setState(() => _currentIndex = i),
                  items: [
                    /// Home
                    SalomonBottomBarItem(
                      icon: Icon(Icons.fastfood_outlined),
                      activeIcon: Icon(Icons.fastfood),
                      title: Text("Order"),
                      selectedColor: Color(barColor),
                    ),

                    /// Likes
                    SalomonBottomBarItem(
                      icon: Icon(Icons.delivery_dining_outlined),
                      activeIcon: Icon(Icons.delivery_dining),
                      title: Text("Deliver"),
                      selectedColor: Color(barColor),
                    ),

                    /// Profile
                    SalomonBottomBarItem(
                      icon: Icon(Icons.person_outlined),
                      activeIcon: Icon(Icons.person),
                      title: Text("Profile Settings"),
                      selectedColor: Color(barColor),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 0,
                        offset: const Offset(0, 0))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ScrollToHideWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;
  final double height;

  const ScrollToHideWidget({
    Key? key,
    required this.child,
    required this.controller,
    this.duration = const Duration(milliseconds: 200),
    this.height = 60.0,
  }) : super(key: key);

  @override
  _ScrollToHideWidgetState createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(listen);
    super.dispose();
  }

  void listen() {
    final direction = widget.controller.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
  }

  void show() {
    if (!isVisible) setState(() => isVisible = true);
  }

  void hide() {
    if (isVisible) setState(() => isVisible = false);
  }

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        height: isVisible ? widget.height : 0,
        duration: widget.duration,
        child: widget.child,
      );
}
