import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  var barColor = 0xFF43A047;
  late ScrollController controller;

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
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/search.png',
                height: 27.5,
                width: 27.5,
              ))
        ],
        title: Text(
          'AUI DELIVERY',
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            color: Color(barColor),
          ),
          textScaleFactor: 1.2,
        ),
        centerTitle: true,
        foregroundColor: Color(barColor),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: homePageListViewSecond(),
      floatingActionButton: ScrollToHideWidget(
        controller: controller,
        child: bottomCustomAppBar(),
        height: 60,
      ),
    );
  }

  ListView homePageListView() {
    final List<String> locations = <String>[
      'Grill',
      'Proxi Rest',
      'Cafeteria',
      'Pizzeria',
      'Store',
      'NewRest'
    ];
    final List<String> locationDetails = [
      'The Grill Restaurant beside Newrest',
      'The Fast Food Restaurant',
      'The Cafeteria in Building 2',
      'The Pizza place in Building 3',
      'The Convenient Store',
      'The famous Restaurant in Building 3'
    ];
    final List<String> imgUrls = [
      'assets/grill-2.jpg',
      'assets/proxi.png',
      'assets/coffee-4.jpg',
      'assets/pizza.png',
      'assets/store-2.jpg',
      'assets/newrest-3.jpg'
    ];
    return ListView.separated(
      controller: controller,
      itemCount: locations.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: Card(
            elevation: 1.5,
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              height: 120,
              width: 80,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      imgUrls[index],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 50),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          locations[index],
                          textScaleFactor: 2,
                          style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w600,
                              color: Color(barColor)),
                        ),
                        Text(locationDetails[index],
                            textScaleFactor: 1.2,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.w600,
                                color: Color(barColor)))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          onTap: () {},
        );
      },
      scrollDirection: Axis.vertical,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        thickness: 0.01,
        height: 1,
      ),
      shrinkWrap: true,
      reverse: true,
      padding: EdgeInsets.all(8),
    );
  }

  GridView homePageListViewSecond() {
    final List<String> locations = <String>[
      'Grill',
      'Proxi Rest',
      'Cafeteria',
      'Pizzeria',
      'Store',
      'NewRest'
    ];
    final List<String> locationDetails = [
      'The Grill Restaurant beside Newrest',
      'The Fast Food Restaurant',
      'The Cafeteria in Building 2',
      'The Pizza place in Building 3',
      'The Convenient Store',
      'The famous Restaurant in Building 3'
    ];
    final List<String> imgUrls = [
      'assets/grill-2.jpg',
      'assets/proxi.png',
      'assets/coffee-4.jpg',
      'assets/pizza.png',
      'assets/store-2.jpg',
      'assets/newrest-3.jpg'
    ];

    return GridView.builder(
      itemCount: locations.length,
      scrollDirection: Axis.vertical,
      reverse: false,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 35,
      ),
      controller: controller,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 150,
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
                        imgUrls[index],
                        width: 150,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      locations[index],
                      textScaleFactor: 1.5,
                      style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w600, color: Color(barColor)),
                    ),
                    SizedBox(height: 2.5),
                    Text(locationDetails[index],
                        textScaleFactor: 0.5,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600,
                            color: Color(barColor)))
                  ],
                ),
              ),
            ],
          ),
          onTap: () {},
        );
      },
    );
  }

  ListView bottomCustomAppBar() {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 300,
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
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 2))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
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
    if (direction == ScrollDirection.reverse) {
      show();
    } else if (direction == ScrollDirection.forward) {
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
