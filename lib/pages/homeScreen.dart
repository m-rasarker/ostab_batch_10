import 'package:flu_first_app/pages/BotNav.dart';
import 'package:flu_first_app/pages/PremiumCalculator.dart';
import 'package:flu_first_app/pages/fistScreen.dart';
import 'package:flu_first_app/pages/logIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'PremiumCalculator.dart';


import '../SideBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // TODO: implement widget
 //  Widget appBatTitle = const Text('Home Page');

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
     drawer: const SideBar(),
      bottomNavigationBar: BotNav(),
      appBar: AppBar(
        // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(25),right: Radius.circular((25)))),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20),bottom: Radius.circular((5)))),
          title: const Text('Home',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white

      ),

      body:ListView(
       // padding: const EdgeInsets.symmetric(),
        children: [
          // Container(
          //
          //   height: 100,
          //   decoration: BoxDecoration(
          //       color: Theme.of(context).primaryColor,
          //       borderRadius: const BorderRadius.only(
          //           bottomRight: Radius.circular(50)
          //       )
          //   ),
          //
          //   child:  const Column(
          //
          //       children: [
          //         SizedBox(height: 20,),
          //         ListTile(
          //           title: Text('Hi Ruhul!'),
          //           subtitle: Text('Good Day'),
          //
          //
          //           trailing: CircleAvatar(
          //             radius: 30,
          //
          //             child: Icon(Icons.menu),
          //
          //           ),
          //         ),
          //
          //
          //
          //       ]
          //
          //   ),
          //
          // ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(100)
                  // )
              ),
              child: GridView.count(
                padding: const EdgeInsets.all(10.0),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [

                  /*
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ResetPasswordScreen()),
            );
          },
       InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const firstPage()));
              }
          ),

*/

                 // bottomMenu.itemDeshBoard(title, icondata, background, onTab);

                  // bottomMenu.itemDeshBoard('Video',CupertinoIcons.play_rectangle, Colors.deepOrange,(){Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const firstPage()));}),
                  //
                  // bottomMenu.itemDeshBoard('Video',CupertinoIcons.graph_circle ,Colors.deepOrange,(){Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const secondPage()  ));}),
                  // bottomMenu.itemDeshBoard('Analytics',CupertinoIcons.person_2 ,Colors.deepOrange,(){Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const firstPage()));} ),
                  // bottomMenu.itemDeshBoard('Audience',CupertinoIcons.chat_bubble_2 ,Colors.deepOrange,(){Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const firstPage()));} ),
                  // bottomMenu.itemDeshBoard('Comments',CupertinoIcons.airplane,Colors.deepOrange,(){Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const firstPage()));} )
                  itemDeshBoard('Payment','assets/images/online_pay.png', Colors.white, (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()));}),
                  itemDeshBoard('Calculator','assets/images/calculator.png', Colors.white, (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const PremiumCalculator()));}),

                  itemDeshBoard('Payment','assets/images/online_pay.png', Colors.white, (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()));}),
                  itemDeshBoard('Calculator','assets/images/calculator.png', Colors.white, (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const firstPage()));}),


                  itemDeshBoard('Payment','assets/images/online_pay.png', Colors.white, (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()));}),
                  itemDeshBoard('Calculator','assets/images/calculator.png', Colors.white, (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));}),



                  // itemDeshBoard('Video',CupertinoIcons.graph_circle ,Colors.deepOrange,(){Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const firstPage()  ));}),
                  // itemDeshBoard('Analytics',CupertinoIcons.person_2 ,Colors.deepOrange,(){Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const secondPage()));} ),
                  // itemDeshBoard('Audience',CupertinoIcons.chat_bubble_2 ,Colors.deepOrange,(){Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const firstPage()));} ),
                  // itemDeshBoard('Comments',CupertinoIcons.airplane,Colors.deepOrange,(){Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const firstPage()));} )




                ],
              ),

            ),
          )
        ],

      ),




    );
  }

  itemDeshBoard(String title,String icondata,Color background, Function() onTab) =>InkWell(
    onTap: onTab, child:  Container(
    decoration: BoxDecoration(color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0,5),
              color: Theme.of(context).primaryColor.withOpacity(.5),
              spreadRadius: 2,
              blurRadius: 5
          )
        ]
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Container(
        decoration: BoxDecoration(
            color: background,
            shape: BoxShape.circle
        ),
      //  child: Icon(icondata,color: Colors.white),
        child: Image.asset(icondata,height: 70,)
      ),
        const SizedBox(height: 2,),
      //  Text(title,style: style,)
       Text(title,style: Theme.of(context).textTheme.titleMedium)

        // Navigator.push(context,
        //  MaterialPageRoute(builder: (context) => const firstPage()));
      ],


    ),

  ),
  );

}
