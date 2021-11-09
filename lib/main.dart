import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(const DeliveryApp());
}

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  var barColor = 0xFF43A047;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AUI DELIVERY'),
        foregroundColor: Color(barColor),
        backgroundColor: Colors.white,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 300,
                height: 60,
                child: HomeBar(),
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
              const SizedBox(height: 10)
            ],
          ),
        ],
      ),
    );
  }

  SalomonBottomBar HomeBar() {
    return SalomonBottomBar(
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
    );
  }
}
