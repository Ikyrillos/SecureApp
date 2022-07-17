import 'package:flutter/material.dart';

class CustomMenuItem {
  CustomMenuItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String? title;
  final IconData? icon;
  final Function? onTap;
}
