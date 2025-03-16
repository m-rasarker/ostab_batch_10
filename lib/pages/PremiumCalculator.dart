
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flu_first_app/pages/logIn_.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'BotNav.dart';
import 'ProductInfo.dart';

class PremiumCalculator extends StatefulWidget {
  const PremiumCalculator({super.key});

  @override
  State<PremiumCalculator> createState() => _PremiumCalculatorState();
}

class _PremiumCalculatorState extends State<PremiumCalculator> {
 // List<LiPayModes> LiPayModess =[];
List<dynamic> users =[];
List<dynamic> lsProduct =[];
List<dynamic> lsSuppProduct =[];
List<dynamic> lsOccupation =[];
bool isChecked1 =false;
bool isChecked2 =false;
bool isChecked3 =false;


String? selectedPaymentMode;
String? selectedProduct;
String? selectedSuppProduct1;
String? selectedSuppProduct2;
String? selectedSuppProduct3;
String? selecteOccup;
String? selecteSex;

int selectedValue=0;
var lval ='01';




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _textEditingController.text='${widget.closingFrom}';
    // clf='${widget.closingFrom}';
    // scrollController.addListener(_scrollListener);

    fetchPosts();
  }


  @override
  Widget build(BuildContext context)  {
    final mediaWidth =MediaQuery.of(context).size.width/2.0;


    return Scaffold(


      bottomNavigationBar: BotNav(),

      appBar: AppBar(
        // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(25),right: Radius.circular((25)))),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20), bottom: Radius.circular((5)))),
          title: const Text('Premium Calculator', style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white
      ),

body: SingleChildScrollView(

  child: Column(
    children:<Widget> [
      const SizedBox(height: 2.0),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          Container(
            padding: EdgeInsets.all(5.0),
      alignment: Alignment.topCenter,
      width: mediaWidth*1.3,
      height: 60,
      child: TextFormField(
    //  keyboardType: TextInputType.emailAddress,
      // controller: emailController,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
       labelText: "Date of Birth (DD/MM/YYYY)",
        hintText: 'Date of Birth (DD/MM/YYYY)',
        border: OutlineInputBorder(),
       // prefixIcon: Icon(Icons.email,color: Colors.black,),
      ),
      validator: (value){
        if (value!.isEmpty)
        {
          return 'Please Enter Date of Birth';
        }
        return null;
      }
      ),
    ),
          Container(
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.topCenter,
            width: mediaWidth*.7,
            height: 60,
            child: TextFormField(
             //  keyboardType: TextInputType.emailAddress,
                // controller: emailController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Age",
                  hintText: 'Age',
                  border: OutlineInputBorder(),
              //    prefixIcon: Icon(Icons.email,color: Colors.black,),
                ),
                validator: (value){
                  if (value!.isEmpty)
                  {
                    return 'Please Enter Date of Birth';
                  }
                  return null;
                }
            ),
          ),

        ],
      ),
      //
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          Container(
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.topCenter,
            width: mediaWidth*1.3,
            height: 60,
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Select Occupation",
                border: OutlineInputBorder(),
              ),
              value: selecteOccup, // Set value to the selected value
              items: [
                for (int i = 0; i < lsOccupation.length; i++)
                  DropdownMenuItem<String>(
                    value: lsOccupation[i]['CODE'].toString(), // Ensure this is unique
                    child: Text(lsOccupation[i]['DSCR'].toString()),
                  ),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  selecteOccup = newValue.toString(); // Update the selected value
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.topCenter,
            width: mediaWidth*.7,
            height: 60,
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Select Sex",
                border: OutlineInputBorder(),
              ),
              value: selecteSex, // Set value to the selected value
              items: [

                  DropdownMenuItem(
                      child: Text('Male'),
                    value: 'M'),

                DropdownMenuItem(
                    child: Text('Female'),
                    value: 'F')

              ],
              onChanged: (String? newValue) {
                setState(() {
                  selecteSex = newValue.toString(); // Update the selected value
                });
              },
            ),
          ),

        ],
      ),

      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          Container(
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.topCenter,
            width: mediaWidth*2,
            height: 60,
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Select Product",
                border: OutlineInputBorder(),
              ),
              value: selectedProduct, // Set value to the selected value
              items: [
                for (int i = 0; i < lsProduct.length; i++)
                  DropdownMenuItem<String>(
                    value: lsProduct[i]['Pid'].toString().trim(), // Ensure this is unique
                    child: Text(lsProduct[i]['pShortName'].toString().trim(),style: const TextStyle(fontSize: 12)),
                  ),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  selectedProduct = newValue.toString();
                  for (int i = 0; i < lsProduct.length; i++)
                    {
                      if ( lsProduct[i]['Pid'].toString().trim() ==selectedProduct)
                        {
                          lsSuppProduct = lsProduct[i]['liAppSuppProduct'];
                        }

                    }


                  // Update the selected value
                });
              },
            ),
          ),


        ],
      ),

      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          Container(
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.topCenter,
            width: mediaWidth,
            height: 60,
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Term",
                // hintText: 'Age',
                border: OutlineInputBorder(),
              ),
              value: '',
              items: const [ DropdownMenuItem(child: Text('Select Term'),value: '',),



              ], onChanged: (Object? value) {  },
              //  keyboardType: TextInputType.emailAddress,
              // controller: emailController,
              //   decoration: const InputDecoration(
              //     filled: true,
              //     fillColor: Colors.white,
              //     labelText: "Closing From",
              //     hintText: 'Closing from',
              //     border: OutlineInputBorder(),
              //     // prefixIcon: Icon(Icons.email,color: Colors.black,),
              //   ),
              // validator: (value){
              //   if (value!.isEmpty)
              //   {
              //     return 'Please Enter Closing from';
              //   }
              //   return null;
              // }
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.topCenter,
            width: mediaWidth,
            height: 60,
            child:   DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Payment Mode",
                border: OutlineInputBorder(),
              ),
              value: selectedPaymentMode, // Set value to the selected value
              items: [
                for (int i = 0; i < users.length; i++)
                  DropdownMenuItem<String>(
                    value: users[i]['PAY_MODE_ID'].toString(), // Ensure this is unique
                    child: Text(users[i]['PAY_MODE'].toString()),
                  ),
              ],
              onChanged: (String? Value) {

                setState(() {
                  selectedPaymentMode = Value.toString(); // Update the selected value
                });
              },
            ),
          ),

        ],
      ),



      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          Container(
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.topCenter,
            width: mediaWidth,
            height: 60,
            child: TextFormField(
              //  keyboardType: TextInputType.emailAddress,
              // controller: emailController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Sum-Assured",
                  hintText: 'Sum-Assured',
                  border: OutlineInputBorder(),
                  // prefixIcon: Icon(Icons.email,color: Colors.black,),
                ),
                validator: (value){
                  if (value!.isEmpty)
                  {
                    return 'Please Enter Sum-Assured';
                  }
                  return null;
                }
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.topCenter,
            width: mediaWidth,
            height: 60,
            child: TextFormField(
              //  keyboardType: TextInputType.emailAddress,
              // controller: emailController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Premium",
                hintText: 'Premium',
                border: OutlineInputBorder(),
                //    prefixIcon: Icon(Icons.email,color: Colors.black,),
              ),
              // validator: (value){
              //   if (value!.isEmpty)
              //   {
              //     return 'Please Enter Date of Birth';
              //   }
              //   return null;
              // }
            ),
          ),

        ],
      ),







      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  <Widget>  [
          Container(
            width: mediaWidth*.5,
            child: Row(
              children: [
                Checkbox(
                  value: isChecked1,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked1 = !isChecked1;
                      print(isChecked1);
                      //  checkboxController.isChecked.value = value ?? false;
                    });
                  },
                ),
                const Text(
                  "Suppli",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),

          ),

          Visibility(
            visible: isChecked1,
           // visible: true,
            child:    Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.topCenter,
              width: mediaWidth*1.5,
              height: 60,
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Supplimentary 1",
                  // hintText: 'Age',
                  border: OutlineInputBorder(),
                ),
                value: selectedSuppProduct1 ,

                items: [
                  for (int i = 0; i <lsSuppProduct.length; i++)
                    DropdownMenuItem<String>(
                      value: lsSuppProduct[i]['Spid'].toString().trim(), // Ensure this is unique
                      child: Text(lsSuppProduct[i]['SuppShortName'].toString().trim(),style: const TextStyle(fontSize: 12)),
                    ),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    selectedSuppProduct1 = newValue.toString(); // Update the selected value
                  });
                },
              ),
            ),),





        ] ,
      ),







      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          Visibility(
            visible: isChecked1,
            child:   Container(
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.topCenter,
            width: mediaWidth,
            height: 60,
            child: TextFormField(
              //  keyboardType: TextInputType.emailAddress,
              // controller: emailController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Sum-Assured",
                  hintText: 'Sum-Assured',
                  border: OutlineInputBorder(),
                  // prefixIcon: Icon(Icons.email,color: Colors.black,),
                ),
                validator: (value){
                  if (value!.isEmpty)
                  {
                    return 'Please Enter Sum-Assured';
                  }
                  return null;
                }
            ),
          ),)
        ,

          Visibility(
            visible: isChecked1,
            child:    Container(
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.topCenter,
            width: mediaWidth,
            height: 60,
            child: TextFormField(
              //  keyboardType: TextInputType.emailAddress,
              // controller: emailController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Premium",
                hintText: 'Premium',
                border: OutlineInputBorder(),
                //    prefixIcon: Icon(Icons.email,color: Colors.black,),
              ),
              // validator: (value){
              //   if (value!.isEmpty)
              //   {
              //     return 'Please Enter Date of Birth';
              //   }
              //   return null;
              // }
            ),
          ),)


        ],
      ),









      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  <Widget>  [
          Visibility(
            visible: isChecked1,
            child:  Container(
            width: mediaWidth*.5,
            child: Row(
              children: [
                Checkbox(
                  value: isChecked2,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked2 = !isChecked2;
                      print(isChecked2);
                      //  checkboxController.isChecked.value = value ?? false;
                    });
                  },
                ),
                const Text(
                  "Suppli",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),

          ),),


          Visibility(
            visible: isChecked2,
            // visible: true,
            child:    Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.topCenter,
              width: mediaWidth*1.5,
              height: 60,
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Supplimentary 2",
                  // hintText: 'Age',
                  border: OutlineInputBorder(),
                ),
                value: selectedSuppProduct2 ,

                items: [
                  for (int i = 0; i <lsSuppProduct.length; i++)
                    DropdownMenuItem<String>(
                      value: lsSuppProduct[i]['Spid'].toString().trim(), // Ensure this is unique
                      child: Text(lsSuppProduct[i]['SuppShortName'].toString().trim(),style: const TextStyle(fontSize: 12)),
                    ),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    selectedSuppProduct2 = newValue.toString(); // Update the selected value
                  });
                },
              ),
            ),),





        ] ,
      ),







      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          Visibility(
            visible: isChecked2,
            child:   Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.topCenter,
              width: mediaWidth,
              height: 60,
              child: TextFormField(
                //  keyboardType: TextInputType.emailAddress,
                // controller: emailController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Sum-Assured",
                    hintText: 'Sum-Assured',
                    border: OutlineInputBorder(),
                    // prefixIcon: Icon(Icons.email,color: Colors.black,),
                  ),
                  validator: (value){
                    if (value!.isEmpty)
                    {
                      return 'Please Enter Sum-Assured';
                    }
                    return null;
                  }
              ),
            ),)
          ,

          Visibility(
            visible: isChecked2,
            child:    Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.topCenter,
              width: mediaWidth,
              height: 60,
              child: TextFormField(
                //  keyboardType: TextInputType.emailAddress,
                // controller: emailController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Premium",
                  hintText: 'Premium',
                  border: OutlineInputBorder(),
                  //    prefixIcon: Icon(Icons.email,color: Colors.black,),
                ),
                // validator: (value){
                //   if (value!.isEmpty)
                //   {
                //     return 'Please Enter Date of Birth';
                //   }
                //   return null;
                // }
              ),
            ),)


        ],
      ),










      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  <Widget>  [
          Visibility(
            visible: isChecked2,
            child:     Container(
            width: mediaWidth*.5,
            child: Row(
              children: [
                Checkbox(
                  value: isChecked3,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked3 = !isChecked3;
                      print(isChecked3);
                      //  checkboxController.isChecked.value = value ?? false;
                    });
                  },
                ),
                const Text(
                  "Suppli",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),

          ),),


          Visibility(
            visible: isChecked3,
            // visible: true,
            child:    Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.topCenter,
              width: mediaWidth*1.5,
              height: 60,
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Supplimentary 3",
                  // hintText: 'Age',
                  border: OutlineInputBorder(),
                ),
                value: selectedSuppProduct3 ,

                items: [
                  for (int i = 0; i <lsSuppProduct.length; i++)
                    DropdownMenuItem<String>(
                      value: lsSuppProduct[i]['Spid'].toString().trim(), // Ensure this is unique
                      child: Text(lsSuppProduct[i]['SuppShortName'].toString().trim(),style: const TextStyle(fontSize: 12)),
                    ),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    selectedSuppProduct3 = newValue.toString(); // Update the selected value
                  });
                },
              ),
            ),),





        ] ,
      ),







      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          Visibility(
            visible: isChecked3,
            child:   Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.topCenter,
              width: mediaWidth,
              height: 60,
              child: TextFormField(
                //  keyboardType: TextInputType.emailAddress,
                // controller: emailController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Sum-Assured",
                    hintText: 'Sum-Assured',
                    border: OutlineInputBorder(),
                    // prefixIcon: Icon(Icons.email,color: Colors.black,),
                  ),
                  validator: (value){
                    if (value!.isEmpty)
                    {
                      return 'Please Enter Sum-Assured';
                    }
                    return null;
                  }
              ),
            ),)
          ,

          Visibility(
            visible: isChecked3,
            child:    Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.topCenter,
              width: mediaWidth,
              height: 60,
              child: TextFormField(
                //  keyboardType: TextInputType.emailAddress,
                // controller: emailController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Premium",
                  hintText: 'Premium',
                  border: OutlineInputBorder(),
                  //    prefixIcon: Icon(Icons.email,color: Colors.black,),
                ),
                // validator: (value){
                //   if (value!.isEmpty)
                //   {
                //     return 'Please Enter Date of Birth';
                //   }
                //   return null;
                // }
              ),
            ),)


        ],
      ),




















      //
      // Container(
      //  // padding: EdgeInsets.all(10.0),
      //   width: mediaWidth*2-20,
      //
      //   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(width: 2, color: Colors.green)),
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children:<Widget> [
      //       Container(
      //        // padding: EdgeInsets.all(10.0),
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
      //        // padding: EdgeInsets.all(10.0),
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
      //        // padding: EdgeInsets.all(10.0),
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
      //

    ],

  ),
),





    );
  }


Future<void> fetchPosts() async{

        final url="https://priyojon.charteredlifebd.com/PriojanApi/api/PremiumCal";
        final uri =Uri.parse(url);
        final response = await http.get(uri);
        if (response.statusCode==200)
        {

          final json = jsonDecode(response.body);
         // final results     =json['liPayModes'] as List<dynamic>;
          setState(() {
         //   posts =posts + json;
            users = json['liPayModes'];
            lsProduct =json['liAppProduct'];
            lsOccupation=json['ListOCCUPATION'];
          });


        }
        else
        {
          // invalid response

        }


}





}


class CheckboxController {
  ValueNotifier<bool> isChecked = ValueNotifier(false);
}

final checkboxController = CheckboxController();



