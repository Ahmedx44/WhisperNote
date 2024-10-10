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
  int pageIndex = 0; // Track the selected page
  bool showAddPostModal = false; // Control modal visibility

  @override
  Widget build(BuildContext context) {
    // Define the pages for the IndexedStack
    const List<Widget> pages = [
      Homepage(),
      SizedBox(), // Placeholder for the modal button
      ProfileScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomBarCreative(
        items: const [
          TabItem(icon: CupertinoIcons.home, title: 'Home'),
          TabItem(icon: CupertinoIcons.add),
          TabItem(icon: CupertinoIcons.person, title: 'Profile'),
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
            // Show the modal bottom sheet when the middle button is tapped
            showModalBottomSheet(
              enableDrag: true,
              isScrollControlled: true,
              isDismissible: true,
              showDragHandle: true,
              context: context,
              builder: (context) {
                return const AddPost(); // Your AddPost modal
              },
            ).whenComplete(() {
              // Reset the page index to 0 after the modal is closed
              setState(() {
                pageIndex = 0; // Go back to the home page
              });
            });
          } else {
            // Update the page index for the other buttons
            setState(() {
              pageIndex = index; // Switch to the selected page
            });
          }
        },
      ),
      // Use IndexedStack to preserve the state of the pages
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
    );
  }
}
