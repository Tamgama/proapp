import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: const Text("Home Pass"));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
