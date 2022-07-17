import 'package:secure/models/menu_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MenuItems {
  static List<CustomMenuItem> items = [
    home,
    profile,
  ];
  static List<CustomMenuItem> items2 = [
    logout,
  ];

  static var logout = CustomMenuItem(
      title: 'Logout',
      icon: Icons.logout,
      onTap: () {
        FirebaseAuth.instance.signOut();
      });
  static var home =
      CustomMenuItem(title: 'Home', icon: Icons.home, onTap: () {});
  static var profile =
      CustomMenuItem(title: 'Profile', icon: Icons.person, onTap: () {});
}
