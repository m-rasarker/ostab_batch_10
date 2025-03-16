import 'package:flu_first_app/nav.dart';
import 'package:flutter/material.dart';

import '../SideBar.dart';
import 'BotNav.dart';

// ignore: camel_case_types
class secondPage extends StatelessWidget {
  const secondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideBar(),
        bottomNavigationBar: const BotNav(),
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient:LinearGradient(
                  colors: [
                    Colors.orange,
                    Colors.green,
                    Colors.white30
                  ]
              )
          ),

          child: Center(
            child: Container(
              child: Text('Second Page'),
            ),
          ),
        )
      //  child: Nav(),

    );

  }
}
