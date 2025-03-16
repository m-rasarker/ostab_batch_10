import 'package:flu_first_app/SideBar.dart';
import 'package:flu_first_app/pages/SecondPage.dart';
import 'package:flu_first_app/pages/fistScreen.dart';
import 'package:flu_first_app/pages/homeScreen.dart';
import 'package:flu_first_app/pages/logIn.dart';

import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int currentIndex = 0;

  final List<Widget> screen = const [HomeScreen(), firstPage(), Login(), secondPage()];



  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Center(
        child: SizedBox(
          child: screen[currentIndex],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.cyan,
        selectedFontSize: 20,
        unselectedFontSize: 20,
        type: BottomNavigationBarType.fixed,
        //  fixedColor: Colors.black,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedIconTheme: const IconThemeData(color: Colors.blue),
        iconSize: 50,
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {
            // switch (value) {
            //   case 0:
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => const firstPage()));
            //     break;
            //
            //   case 1:
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const secondPage()));
            //     break;
            //
            //   case 2:
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => const SideBar()));
            //     break;
            // }

            /*   if (currentIndex==0)
                        {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const firstPage()));
                        }
                        else if (currentIndex==1)
                        {
                            MaterialPageRoute(builder: (context) => const secondPage());
                         }

                      */
          });
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Report'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),

        ],
      ),
    );
  }
  //
  // itemDeshBoard(String title, IconData icondata, Color background,
  //         Function() onTab) =>
  //     InkWell(
  //       onTap: onTab,
  //       child: Container(
  //         decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(10),
  //             boxShadow: [
  //               BoxShadow(
  //                   offset: const Offset(0, 5),
  //                   color: Theme.of(context).primaryColor.withOpacity(.2),
  //                   spreadRadius: 2,
  //                   blurRadius: 5)
  //             ]),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Container(
  //               decoration:
  //                   BoxDecoration(color: background, shape: BoxShape.circle),
  //               child: Icon(icondata, color: Colors.white),
  //               //child: Image.asset(icondata)
  //             ),
  //             const SizedBox(
  //               height: 8,
  //             ),
  //             Text(
  //               title,
  //               style: Theme.of(context).textTheme.titleMedium,
  //             )
  //
  //             // Navigator.push(context,
  //             //  MaterialPageRoute(builder: (context) => const firstPage()));
  //           ],
  //         ),
  //       ),
  //     );
}
