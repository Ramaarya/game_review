import 'package:flutter/material.dart';

// import halaman
import '../pages/tab/game_review_tab.dart';
import './tab/pc_games.dart';
import '../pages/tab/about_me_tab.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  List<Widget> tabs = const [
    GameReviewTab(),
    PCGamesTab(),
    AboutMeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selectedNavbar],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad),
            label: 'Review',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.computer),
            label: 'All games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Developer',
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
