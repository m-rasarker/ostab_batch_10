
import 'package:flutter/material.dart';



class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
child: ListView(
  children: const [
    UserAccountsDrawerHeader(accountName: Text('Name'), accountEmail: Text('Email'),
  currentAccountPicture: CircleAvatar(child: CircleAvatar(
    child: ClipOval(
     child: Icon(Icons.menu),

    ),
  ),),
  ),
ListTile(
  leading: Icon(Icons.report),
  title: Text('Business Reports'),
),
    ListTile(
      leading: Icon(Icons.money),
      title: Text('Commission'),


    ),
    ListTile(

      leading: Icon(Icons.favorite),
      title: Text('Favorite'),

    ),
    ListTile(
      leading: Icon(Icons.favorite),
      title: Text('Favorite'),

    )

  ],



),



    );
  }
}
