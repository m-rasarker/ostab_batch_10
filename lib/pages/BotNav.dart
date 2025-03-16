import 'package:flutter/material.dart';

import 'SecondPage.dart';
import 'fistScreen.dart';
import 'homeScreen.dart';
import 'logIn.dart';



class BotNav extends StatefulWidget {
  const BotNav({super.key});


  @override
  State<BotNav> createState() => _BotNavState();


}

class _BotNavState extends State<BotNav> {
  int currentIndex=0;
  final List<Widget> screen = const [HomeScreen(), firstPage(), Login(), secondPage()];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.cyan,
      selectedFontSize: 15,
      unselectedFontSize: 15,
      type: BottomNavigationBarType.fixed,
      //  fixedColor: Colors.black,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      selectedIconTheme: const IconThemeData(color: Colors.blue),
      iconSize: 40,
      currentIndex: currentIndex,
      onTap: (value) {
        currentIndex = value;

        setState(() {
          switch (value) {
            case 0:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
              break;

            case 1:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const firstPage()));
              break;

            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const secondPage()));
              break;
          }
        });
      },

      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Report'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),

      ],
    );

  }
}
