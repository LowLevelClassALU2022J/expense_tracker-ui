import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  final Function(int) onItemSelected;

  const BottomNavigationWidget({required this.onItemSelected, Key? key})
      : super(key: key);

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money),
          label: 'Income',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.money_off),
          label: 'Expense',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt),
          label: 'Reports',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey[700],
      onTap: _onItemTapped,
    );
  }
}
