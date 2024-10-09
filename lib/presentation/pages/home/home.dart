import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wish_i_sent/presentation/pages/Profile/profile.dart';
import 'package:wish_i_sent/presentation/pages/home/homepage.dart';
import 'package:wish_i_sent/presentation/pages/splash_Screen/splash_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    // Update the page based on pageIndex within the build method
    Widget page = Homepage();
    if (pageIndex == 0) {
      page = Homepage();
    } else if (pageIndex == 1) {
      page = SplashScreen(); // Placeholder for another page
    } else if (pageIndex == 2) {
      page = ProfileScreen();
    }

    return Scaffold(
      bottomNavigationBar: BottomBarCreative(
        items: const [
          TabItem(icon: CupertinoIcons.home, title: 'Home'),
          TabItem(icon: CupertinoIcons.add), // Placeholder
          TabItem(icon: CupertinoIcons.person, title: 'Profile')
        ],
        backgroundColor: Colors.white,
        color: Colors.black,
        colorSelected: Colors.lightBlue,
        indexSelected: pageIndex,
        highlightStyle: const HighlightStyle(
          isHexagon: true,
        ),
        onTap: (int index) {
          // Update the pageIndex within setState to rebuild the UI
          setState(() {
            pageIndex = index;
          });
        },
      ),
      body: page, // This will dynamically change based on pageIndex
    );
  }
}
