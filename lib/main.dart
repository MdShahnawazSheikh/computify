import 'package:computify/screens/accountScreen.dart';
import 'package:computify/screens/cartScreen.dart';
import 'package:computify/screens/homescreen.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedTabIndex = 0;

  final List<Widget> _screens = [
    const Homescreen(),
    const Cartscreen(),
    const Accountscreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: SizedBox(
            width: screenWidth / 3,
            child: Image.asset("assets/computify-logo.png"),
          ),
        ),
        drawer: const Drawer(),
        body: _screens[_selectedTabIndex],
        extendBody: true,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: DotNavigationBar(
            backgroundColor: Colors.grey.shade200,
            currentIndex: _selectedTabIndex,
            onTap: _onItemTapped,
            items: [
              DotNavigationBarItem(
                icon: const Icon(Icons.home),
                selectedColor: Colors.purple,
              ),
              DotNavigationBarItem(
                icon: const Icon(Icons.shopping_cart),
                selectedColor: Colors.purple,
              ),
              DotNavigationBarItem(
                icon: const Icon(Icons.person),
                selectedColor: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
