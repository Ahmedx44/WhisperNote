import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wish_i_sent/presentation/pages/Profile/profile.dart';
import 'package:wish_i_sent/presentation/pages/home/pages/homepage.dart';
import 'package:wish_i_sent/presentation/pages/post/page/add_post.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page = const Homepage();
    if (pageIndex == 0) {
      page = const Homepage();
    } else if (pageIndex == 2) {
      page = const ProfileScreen();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar: BottomBarCreative(
        blur: 0.4,
        backgroundSelected: Theme.of(context).colorScheme.primary,
        items: const [
          TabItem(icon: CupertinoIcons.home, title: 'Home'),
          TabItem(icon: CupertinoIcons.add),
          TabItem(icon: CupertinoIcons.person, title: 'Profile')
        ],
        backgroundColor: Theme.of(context).colorScheme.secondary,
        color: Colors.white,
        colorSelected: Theme.of(context).colorScheme.primary,
        indexSelected: pageIndex,
        highlightStyle: const HighlightStyle(
          isHexagon: true,
        ),
        onTap: (int index) {
          if (index == 1) {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return AddPost();
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
