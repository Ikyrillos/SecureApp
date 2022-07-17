import 'package:secure/models/menu_item.dart';
import 'package:secure/models/menu_items.dart';
import 'package:secure/presentation/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          PopupMenuButton<CustomMenuItem>(
            itemBuilder: (context) => [
              ...MenuItems.items.map(buildItem).toList(),
              const PopupMenuDivider(),
              ...MenuItems.items2.map(buildItem).toList(),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text('Welcome, ${user.email}'),
          ],
        ),
      ),
    );
  }
}
