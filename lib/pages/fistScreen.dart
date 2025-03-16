import 'package:flu_first_app/pages/ParaForm.dart';
import 'package:flu_first_app/pages/SignUp.dart';
import 'package:flu_first_app/pages/business.dart';
import 'package:flu_first_app/pages/commission.dart';
import 'package:flu_first_app/pages/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flu_first_app/nav.dart';
import 'package:form_validation/form_validation.dart';

import '../SideBar.dart';
import 'BotNav.dart';

import 'SecondPage.dart';
import 'logIn.dart';

// ignore: camel_case_types
class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => _firstPageState();

}

class _firstPageState extends State<firstPage> {
  // // commission
  // var val ='000397';
  // var clf ='2024121';
  // var clt ='2024122';
  // Business
  var val ='005321';
  var clf ='202412';
  var clt ='202501';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      bottomNavigationBar: BotNav(),

      appBar: AppBar(
        // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(25),right: Radius.circular((25)))),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20), bottom: Radius.circular((5)))),
          title: const Text('Reports', style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white
      ),

      body:ListView(
      //  padding: const EdgeInsets.symmetric(),
        children: [

         // const ParaForm(),
          Container(
            // color: Theme.of(context).primaryColor,
            color: Colors.white,
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

                children: <Widget>[

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
                  itemDeshBoard('Policy Statement','assets/images/policy_statement.png', Colors.white, (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()));}),
                  itemDeshBoard('Business Report','assets/images/business_report.png', Colors.white, (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  Business(orgId: val, closingFrom: clf, closingTo: clt )));}),
                  itemDeshBoard('Commission','assets/images/commission.png', Colors.white, (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Commission(orgId: val, closingFrom: clf, closingTo: clt )));}),

                  itemDeshBoard('Policy List','assets/images/policy_issue_list.png', Colors.white, (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const secondPage()));}),

                  itemDeshBoard('Persistence','assets/images/percent.png', Colors.white, (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));}),

                  itemDeshBoard('Rank','assets/images/ranking.png', Colors.white, (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Signup()));}),



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
              blurRadius: 3
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
        Text(title,style: Theme.of(context).textTheme.titleMedium,)

        // Navigator.push(context,
        //  MaterialPageRoute(builder: (context) => const firstPage()));
      ],


    ),

  ),
  );

}
