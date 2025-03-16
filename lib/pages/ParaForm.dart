import 'package:flu_first_app/pages/logIn_.dart';
import 'package:flu_first_app/widgets/ParaFormWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ParaForm extends StatefulWidget {
  const ParaForm({super.key});

  @override
  State<ParaForm> createState() => _ParaFormState();
}

class _ParaFormState extends State<ParaForm> {

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width / 2.0;
    return Scaffold(
      body: ParaFormWidget()
    );
  }
}

//       body: (
//
//       Container(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             SizedBox(height: 20,),
//             TextFormField(
//              // keyboardType: TextInputType.emailAddress,
//               // controller: emailController,
//               decoration: const InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 labelText: "Closing from",
//                 hintText: 'Closing From',
//                 border: OutlineInputBorder(),
//                // prefixIcon: Icon(Icons.email,color: Colors.black,),
//
//
//               ),
//               validator: (value){
//                 if (value!.isEmpty)
//                 {
//                   return 'Please Enter a email';
//                 }
//                 return null;
//               },
//
//
//             ),
//             SizedBox(height: 20,),
//             TextFormField(
//               // keyboardType: TextInputType.emailAddress,
//               // controller: emailController,
//               decoration: const InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 labelText: "Closing To",
//                 hintText: 'Closing To',
//                 border: OutlineInputBorder(),
//                 // prefixIcon: Icon(Icons.email,color: Colors.black,),
//
//
//               ),
//               validator: (value){
//                 if (value!.isEmpty)
//                 {
//                   return 'Please Enter a email';
//                 }
//                 return null;
//               },
//
//
//             ),
//           ],
//
//         ),
//
//
// )
//
//       ),

//  child: Padding(padding: const EdgeInsets.fromLTRB(10,50,10,10),

//     return 'Closing From';
