import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/view/home/home_screen.dart';

// ignore: must_be_immutable
class Bottom extends StatefulWidget {
  Bottom({super.key, required this.profileimage});
  String profileimage;

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int selectedIndex = 0;
  List pages = const [
    Center(child: HomeScreen()),
    Center(
      child: Text(
        'Games',
        style: TextStyle(color: Colors.black),
      ),
    ),
    Center(
      child: Text('New & Hot'),
    ),
    Center(
      child: Text('My Netflix'),
    ),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: pages.elementAt(selectedIndex),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.red,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: Colors.black,
              ),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.gamecontroller_alt_fill,
                color: Colors.black,
              ),
              label: 'Games',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.video_collection_outlined,
                color: Colors.black,
              ),
              label: 'New & Hot',
            ),
            BottomNavigationBarItem(
              tooltip: 'Profile',
              icon: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.profileimage),
                  ),
                ),
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
        ));
  }
}
