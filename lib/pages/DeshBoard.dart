import 'package:flutter/material.dart';


class DeshBoard{

  itemDeshBoard(String title, IconData icondata, Color background,
      Function() onTab) =>
      InkWell(
        onTap: onTab, child: Container(
        decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 5),
                  color: Colors.white10,
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
            child: Icon(icondata, color: Colors.white),
           // child: Image.asset(icondata),
          ),
            const SizedBox(height: 2),
            Text(title)
          ],


        ),

      ),
      );


}