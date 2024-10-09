import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wish_i_sent/presentation/pages/Profile/profile.dart';
import 'package:wish_i_sent/presentation/pages/home/homepage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page = Homepage();
    if (pageIndex == 0) {
      page = Homepage();
    } else if (pageIndex == 2) {
      page = ProfileScreen();
    }

    return Scaffold(
      bottomNavigationBar: BottomBarCreative(
        items: const [
          TabItem(icon: CupertinoIcons.home, title: 'Home'),
          TabItem(icon: CupertinoIcons.add),
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
          if (index == 1) {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    child: Container());
              },
            );
          } else {
            setState(() {
              pageIndex = index;
            });
          }
        },
      ),
      body: page,
    );
  }
}
