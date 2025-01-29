import 'dart:ffi';


import 'package:ecomerce_final/controllers/cart_controller.dart';
import 'package:ecomerce_final/view/home_screen.dart';
import 'package:ecomerce_final/view/notifications.dart';
import 'package:ecomerce_final/view/orders.dart';
import 'package:ecomerce_final/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List of pages that will be shown based on the selected index
  static List<Widget> pages = <Widget>[
    HomeScreen(),
    Notifications(),
    OrdersScreen(),
    const ProfileScreen(),
  ];

  int selectedIndex = 0; // Track the selected index

  // Function to handle item taps and update the selected index
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(CartController()); // Initialize the CartController

    return Scaffold(
      body: pages[selectedIndex],
      // Render the correct page based on selectedIndex
      bottomNavigationBar: Container(
        color: Colors.white, // Set the background color
        child: BottomNavigationBar(
          currentIndex: selectedIndex, // Update the current selected index
          onTap: _onItemTapped,
          type: BottomNavigationBarType.shifting,
          // elevation: 0, // Set elevation to 0 for a flat look
          selectedItemColor:
              Colors.green, // Color for the selected item icon (green)
          unselectedItemColor: const Color.fromARGB(
              255, 73, 73, 73), // Color for the unselected item icons (gray)
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.notifications),
                label: "Notification"),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: "Message"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
