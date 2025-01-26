import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:grocery/pages/admin_login/admin_login.dart';
import 'package:grocery/pages/home.dart';
import 'package:grocery/pages/login_pages/login.dart';
import 'package:grocery/pages/order.dart';
import 'package:grocery/pages/profile.dart';
import 'package:grocery/pages/wallet.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentIndex = 0;

  late Widget currentPage;
  late List<Widget> pages;
  late Home home = Home();
  late AdminPannel profile = AdminPannel();
  late Order order = Order();
  late Wallet wallet = Wallet();

  @override
  void initState() {
    pages = [home, profile, order, wallet];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 400),
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          Icon(
            Icons.home_filled,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.shopping_bag,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.wallet,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
//ghkdsfhgiufdgkdopwkc collection id
