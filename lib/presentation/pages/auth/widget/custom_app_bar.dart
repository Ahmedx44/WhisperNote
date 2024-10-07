import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? showBackButton;
  final Color? backgroundColor;
  final String? title;

  const MyAppBar({
    super.key,
    this.title = '',
    this.showBackButton = false,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: showBackButton!
            ? GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade200,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Icon(
                    CupertinoIcons.back,
                    weight: 1,
                  ),
                ),
              )
            : const SizedBox(),
        centerTitle: true,
        title: title!.isNotEmpty
            ? Text(
                title!,
                style: TextStyle(color: Colors.white),
              )
            : Text(''),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
