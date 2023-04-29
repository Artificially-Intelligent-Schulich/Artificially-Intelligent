import 'package:flutter/material.dart';
import 'package:recyclo/models/stored_items.dart';
import 'package:recyclo/widgets/item_list.dart';

void main() => runApp(const Recyclo());

class Recyclo extends StatelessWidget {
  const Recyclo({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: RecycloStateful(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RecycloStateful extends StatefulWidget {
  const RecycloStateful({super.key});

  @override
  State<RecycloStateful> createState() => _RecycloStatefulState();
}

class _RecycloStatefulState extends State<RecycloStateful> {
  int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget getWiget() {
    if (_selectedIndex == 0) {
      // return const Text(
      //   'Index 0: Info',
      //   style: optionStyle,
      // );
      return const ItemList();
    } else if (_selectedIndex == 1) {
      return const Text(
        'Index 1: Scanner',
        style: optionStyle,
      );
    } else if (_selectedIndex == 2) {
      return const Text(
        'Index 2: Home',
        style: optionStyle,
      );
    } else if (_selectedIndex == 3) {
      return const Text(
        'Index 3: Analysis',
        style: optionStyle,
      );
    } else if (_selectedIndex == 4) {
      return const Text(
        'Index 4: List',
        style: optionStyle,
      );
    } else {
      return Container(
        child: const Text('This works'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: getWiget()),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: 'Scanner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: 'Analysis',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Items',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[300],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
