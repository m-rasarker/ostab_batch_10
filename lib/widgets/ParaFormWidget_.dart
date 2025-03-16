

import 'package:flutter/material.dart';

class ParaFormWidget_ extends StatefulWidget {
  const ParaFormWidget_({super.key});

  @override
  State<ParaFormWidget_> createState() => _ParaFormWidgetState();
}

class _ParaFormWidgetState extends State<ParaFormWidget_> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width / 2.0;
    return Column(
      children:<Widget> [
        SizedBox(height: 30.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [
            Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.topCenter,
              width: mediaWidth,
              child: TextFormField(
//  keyboardType: TextInputType.emailAddress,
                // controller: emailController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Closing From",
                    hintText: 'Closing from',
                    border: OutlineInputBorder(),
                    // prefixIcon: Icon(Icons.email,color: Colors.black,),
                  ),
                  validator: (value){
                    if (value!.isEmpty)
                    {
                      return 'Please Enter Closing from';
                    }
                    return null;
                  }
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.topCenter,
              width: mediaWidth,
              child: TextFormField(
                //  keyboardType: TextInputType.emailAddress,
                // controller: emailController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Closing To",
                    hintText: 'Closing To',
                    border: OutlineInputBorder(),
                    //    prefixIcon: Icon(Icons.email,color: Colors.black,),
                  ),
                  validator: (value){
                    if (value!.isEmpty)
                    {
                      return 'Please Enter Closing To';
                    }
                    return null;
                  }
              ),
            ),

          ],
        ),

        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children:<Widget> [
        //     Container(
        //       padding: EdgeInsets.all(5.0),
        //       alignment: Alignment.topCenter,
        //       width: mediaWidth*2,
        //       child: TextFormField(
        //         //  keyboardType: TextInputType.emailAddress,
        //         // controller: emailController,
        //           decoration: const InputDecoration(
        //             filled: true,
        //             fillColor: Colors.white,
        //             labelText: "Closing From",
        //             hintText: 'Closing from',
        //             border: OutlineInputBorder(),
        //             // prefixIcon: Icon(Icons.email,color: Colors.black,),
        //           ),
        //           validator: (value){
        //             if (value!.isEmpty)
        //             {
        //               return 'Please Enter Closing from';
        //             }
        //             return null;
        //           }
        //       ),
        //     ),
        //
        //
        //   ],
        // ),

        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children:<Widget> [
        //     Container(
        //       padding: EdgeInsets.all(5.0),
        //       alignment: Alignment.topCenter,
        //       width: mediaWidth*2/3,
        //       child:    RadioListTile<int>(
        //
        //                               value: 0,
        //                               groupValue: selectedValue,
        //                               title: Text('FA'),
        //                              // subtitle: Text('Field Officer'),
        //                               onChanged: (value) =>setState(() =>selectedValue=0)
        //                           ),
        //     ),
        //     Container(
        //       padding: EdgeInsets.all(5.0),
        //       alignment: Alignment.topCenter,
        //       width: mediaWidth*2/3,
        //       child:    RadioListTile<int>(
        //
        //           value: 1,
        //           groupValue: selectedValue,
        //           title: Text('UM'),
        //         //  subtitle: Text('UM'),
        //           onChanged: (value) =>setState(() =>selectedValue=1)
        //       ),
        //     ),
        //     Container(
        //       padding: EdgeInsets.all(5.0),
        //       alignment: Alignment.topCenter,
        //       width: mediaWidth*2/3,
        //       child:    RadioListTile<int>(
        //
        //           value: 2,
        //           groupValue: selectedValue,
        //           title: Text('BM'),
        //          // subtitle: Text('BM'),
        //           onChanged: (value) =>setState(() =>selectedValue=2)
        //       ),
        //     ),
        //
        //
        //   ],
        //
        //
        //
        // )

        // Container(
        //   // padding: EdgeInsets.all(10.0),
        //   width: mediaWidth*2-20,
        //
        //   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(width: 2, color: Colors.green)),
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children:<Widget> [
        //       Container(
        //         // padding: EdgeInsets.all(10.0),
        //         alignment: Alignment.topCenter,
        //         width: mediaWidth*2/3-8,
        //         child: RadioListTile<int>(
        //             value: 0,
        //             groupValue: selectedValue,
        //             title: Text('FA'),
        //             // subtitle: Text('Field Officer'),
        //             onChanged: (value) =>setState(() =>selectedValue=0)
        //         ),
        //       ),
        //       Container(
        //         // padding: EdgeInsets.all(10.0),
        //         alignment: Alignment.topCenter,
        //         width: mediaWidth*2/3-8,
        //         child: RadioListTile<int>(
        //
        //             value: 1,
        //             groupValue: selectedValue,
        //             title: Text('UM'),
        //             //  subtitle: Text('UM'),
        //             onChanged: (value) =>setState(() =>selectedValue=1)
        //         ),
        //       ),
        //       Container(
        //         // padding: EdgeInsets.all(10.0),
        //         alignment: Alignment.topCenter,
        //         width: mediaWidth*2/3-8,
        //         child: RadioListTile<int>(
        //
        //             value: 2,
        //             groupValue: selectedValue,
        //             title: Text('BM'),
        //             // subtitle: Text('BM'),
        //             onChanged: (value) =>setState(() =>selectedValue=2)
        //         ),
        //       ),
        //
        //
        //
        //
        //
        //
        //
        //     ],
        //
        //
        //
        //   ),
        // )


      ],

    );
  }
}
