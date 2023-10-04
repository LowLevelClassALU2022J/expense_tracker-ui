import 'package:flutter/material.dart';

class TopNavigationWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const TopNavigationWidget({Key? key}) : super(key: key);

  void _openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center(
        child: Text('Expense Tracker'),
      ),
      backgroundColor: const Color(0xFF429690),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => _openDrawer(context),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
